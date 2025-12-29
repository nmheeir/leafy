// import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/data/models/ol_edition_result.dart';
import 'package:leafy/data/models/ol_search_result.dart';
import 'package:leafy/di/injection.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/entities/reading.dart';
import 'package:leafy/domain/services/open_library_service.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/bloc/open_lib/open_lib_bloc.dart';
import 'package:leafy/logic/bloc/open_lib_search/open_lib_search_bloc.dart';
import 'package:leafy/logic/cubit/edit_book_cubit.dart';
import 'package:leafy/ui/book_editor/book_editor_screen.dart';
import 'package:leafy/ui/book_editor/widgets/form_fields/book_text_field.dart';
import 'package:leafy/ui/common/keyboard_dismissable.dart';
import 'package:leafy/ui/search_ol/widgets/book_card_ol.dart';
import 'package:leafy/ui/search_ol/widgets/ol_search_radio.dart';
import 'package:leafy/ui/search_ol_edition/search_ol_edition_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SearchOLScreen extends StatefulWidget {
  const SearchOLScreen({super.key, this.scan = false, required this.status});

  final bool scan;
  final BookStatus status;

  @override
  State<SearchOLScreen> createState() => _SearchOLScreenState();
}

class _SearchOLScreenState extends State<SearchOLScreen>
    with AutomaticKeepAliveClientMixin {
  final _searchController = TextEditingController();
  int offset = 0;
  final _pageSize = 10;
  String? _searchTerm;
  int? numberOfResults;
  // ScanResult? scanResult;
  int searchTimestamp = 0;

  bool searchActivated = false;
  bool _searchingISBN = false;
  bool _searchingISBNError = false;

  late final _pagingController = PagingController<int, OLSearchResultDoc>(
    fetchPage: (pageKey) => _fetchPage(pageKey),
    getNextPageKey: (state) =>
        state.lastPageIsEmpty ? null : state.nextIntPageKey,
  );

  late final EditBookCubit _editBookCubit;

  void _saveNoEdition({
    required List<String> editions,
    required String title,
    String? subtitle,
    required String author,
    int? firstPublishYear,
    int? pagesMedian,
    int? cover,
    List<String>? isbn,
    String? olid,
  }) {
    final defaultBookFormat = BookFormat.paperback;
    final defaultTags = [];

    final book = Book(
      title: title,
      subtitle: subtitle,
      author: author,
      status: widget.status,
      favorite: false,
      pages: pagesMedian,
      isbn: (isbn != null && isbn.isNotEmpty) ? isbn[0] : null,
      olid: (olid != null) ? olid.replaceAll('/works/', '') : null,
      publicationYear: firstPublishYear,
      bookFormat: defaultBookFormat,
      readings: List<Reading>.empty(growable: true),
      tags: defaultTags.isNotEmpty
          ? defaultTags.join('Constants.tagDelimeter')
          : null,
      dateAdded: DateTime.now(),
      dateModified: DateTime.now(),
    );

    _editBookCubit.setBook(book);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookEditorScreen(
          fromOpenLibrary: true,
          coverOpenLibraryID: cover,
          work: olid,
        ),
      ),
    );
  }

  void _saveEdition({
    required OLEditionResult result,
    required int? cover,
    String? work,
    String? authors,
  }) {
    if (!mounted) return;

    // TODO: Change to use Cubit
    // final defaultBookFormat = context.read<DefaultBooksFormatCubit>().state;
    // final defaultTags = context.read<DefaultBookTagsCubit>().state;
    final defaultBookFormat = BookFormat.paperback;
    final defaultTags = [];

    final addDate = DateTime.now();

    final book = Book(
      title: result.title!,
      subtitle: result.subtitle,
      author: authors ?? '',
      pages: result.numberOfPages,
      status: widget.status,
      favorite: false,
      isbn: (result.isbn13 != null && result.isbn13!.isNotEmpty)
          ? result.isbn13![0]
          : (result.isbn10 != null && result.isbn10!.isNotEmpty)
          ? result.isbn10![0]
          : null,
      olid: (result.key != null) ? result.key!.replaceAll('/books/', '') : null,
      publicationYear: int.tryParse(result.publishDate ?? ''),
      bookFormat: result.physicalFormat ?? defaultBookFormat,
      readings: List<Reading>.empty(growable: true),
      tags: defaultTags.isNotEmpty == true
          ? defaultTags.join(Constants.tagDelimeter)
          : null,
      dateAdded: addDate,
      dateModified: addDate,
    );

    _editBookCubit.setBook(book);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookEditorScreen(
          fromOpenLibrary: true,
          fromOpenLibraryEdition: true,
          work: work,
          coverOpenLibraryID: cover,
        ),
      ),
    );
  }

  Future<List<OLSearchResultDoc>> _fetchPage(int pageKey) async {
    final searchTimestampSaved = DateTime.now().millisecondsSinceEpoch;
    searchTimestamp = searchTimestampSaved;

    try {
      if (_searchTerm == null) return [];

      final newItems = await getIt<OpenLibraryService>().getResults(
        query: _searchTerm!,
        offset: (pageKey - 1) * _pageSize,
        limit: _pageSize,
        searchType: _getOLSearchTypeEnum(
          context.read<OpenLibSearchBloc>().state,
        ),
      );

      // Used to cancel the request if a new search is startedpageKey
      // to avoid showing results from a previous search
      if (searchTimestamp != searchTimestampSaved) return [];

      setState(() {
        numberOfResults = newItems.numFound;
      });

      return newItems.docs;
    } catch (error) {
      // TODO: Handle error and show message to user
      return [];
    }
  }

  void _startNewSearch() {
    if (_searchController.text.isEmpty) return;

    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _searchingISBNError = false;
      _searchingISBN = false;
      searchActivated = true;
    });

    if (context.read<OpenLibSearchBloc>().state is OpenLibSearchISBNState) {
      final isbn = _searchController.text.replaceAll('-', '').trim();
      _searchByISBN(isbn);
    } else {
      _searchTerm = _searchController.text;

      _pagingController.refresh();
    }
  }

  void _searchByISBN(String isbn) async {
    setState(() {
      _searchingISBNError = false;
      _searchingISBN = true;
    });
    final edition = await getIt<OpenLibraryService>().getEditionByISBN(
      isbn: isbn,
    );

    if (edition == null) {
      setState(() {
        _searchingISBN = false;
        _searchingISBNError = true;
      });
      return;
    }
    final authorFutures = (edition.authors ?? []).map((author) {
      return getIt<OpenLibraryService>().getAuthor(key: author.key ?? '');
    }).toList();

    final authors = await Future.wait(authorFutures);

    final authorNames = authors
        .where((author) => author?.name != null)
        .map((author) => author!.name!)
        .toList();

    setState(() {
      searchActivated = false;
    });

    _saveEdition(
      result: edition,
      cover: edition.covers != null && edition.covers!.isNotEmpty
          ? edition.covers![0]
          : null,
      work: edition.works != null && edition.works!.isNotEmpty
          ? edition.works![0].key
          : null,
      authors: authorNames.join(', '),
    );
  }

  // TODO: Bỏ bình luận và hoàn thiện chức năng quét mã vạch.
  // TODO: Xử lý quyền truy cập camera (ví dụ: sử dụng package permission_handler).
  // void _startScanner() async {
  //   FocusManager.instance.primaryFocus?.unfocus();
  //   context.read<OpenLibSearchBloc>().add(const OpenLibSearchISBNEvent());

  //   var result = await BarcodeScanner.scan(
  //     options: ScanOptions(
  //       strings: {
  //         'cancel': LocaleKeys.cancel.tr(),
  //         'flash_on': LocaleKeys.flash_on.tr(),
  //         'flash_off': LocaleKeys.flash_off.tr(),
  //       },
  //     ),
  //   );

  //   if (result.type == ResultType.Barcode) {
  //     setState(() {
  //       _searchingISBNError = false;
  //       searchActivated = true;
  //       _searchController.text = result.rawContent;
  //     });

  //     _searchTerm = result.rawContent;
  //     // _pagingController.refresh();
  //     _searchByISBN(result.rawContent);
  //   }
  // }

  OLSearchType _getOLSearchTypeEnum(OpenLibSearchState state) {
    if (state is OpenLibSearchGeneralState) {
      return OLSearchType.general;
    } else if (state is OpenLibSearchAuthorState) {
      return OLSearchType.author;
    } else if (state is OpenLibSearchISBNState) {
      return OLSearchType.isbn;
    } else if (state is OpenLibSearchTitleState) {
      return OLSearchType.title;
    } else {
      return OLSearchType.general;
    }
  }

  Future<void> _changeSearchType(OLSearchType? value) async {
    final openLibrarySearchBloc = context.read<OpenLibSearchBloc>();

    switch (value) {
      case OLSearchType.author:
        openLibrarySearchBloc.add(const OpenLibSearchAuthorEvent());
        break;
      case OLSearchType.title:
        openLibrarySearchBloc.add(const OpenLibSearchTitleEvent());
        break;
      case OLSearchType.isbn:
        openLibrarySearchBloc.add(const OpenLibSearchISBNEvent());
        break;
      default:
        openLibrarySearchBloc.add(const OpenLibSearchGeneralEvent());
        break;
    }

    // TODO: Tái cấu trúc để tránh sử dụng Future.delayed. Cân nhắc sử dụng một phương pháp quản lý state mạnh mẽ hơn để đảm bảo state được cập nhật trước khi bắt đầu tìm kiếm.
    // Delay for the state to be updated
    await Future.delayed(const Duration(milliseconds: 100));

    _startNewSearch();
  }

  // Used when search results are empty
  void _addBookManually() {
    FocusManager.instance.primaryFocus?.unfocus();

    final searchType = _getOLSearchTypeEnum(
      context.read<OpenLibSearchBloc>().state,
    );

    final book = Book(
      title: searchType == OLSearchType.title ? _searchController.text : '',
      author: searchType == OLSearchType.author ? _searchController.text : '',
      status: BookStatus.finished,
      isbn: searchType == OLSearchType.isbn ? _searchController.text : null,
      readings: List<Reading>.empty(growable: true),
      tags: 'owned',
      dateAdded: DateTime.now(),
      dateModified: DateTime.now(),
    );

    _editBookCubit.setBook(book);

    // TODO: Kích hoạt lại điều hướng đến màn hình thêm sách thủ công (AddBookScreen).
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const BookEditorScreen(fromOpenLibrary: true),
      ),
    );
  }

  void _onChooseEditionPressed(OLSearchResultDoc item) {
    FocusManager.instance.primaryFocus?.unfocus();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchOLEditionsScreen(
          status: widget.status,
          editions: item.editionKey!,
          title: item.title!,
          subtitle: item.subtitle,
          author: (item.authorName != null && item.authorName!.isNotEmpty)
              ? item.authorName![0]
              : '',
          pagesMedian: item.medianPages,
          isbn: item.isbn,
          olid: item.key,
          firstPublishYear: item.firstPublishYear,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _editBookCubit = context.read<EditBookCubit>();
    if (widget.scan) {
      // TODO: Bỏ bình luận lời gọi _startScanner() để kích hoạt quét khi màn hình khởi tạo.
      // _startScanner();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _pagingController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return KeyboardDismissible(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.add_search.tr(),
            style: const TextStyle(fontSize: 18),
          ),
          actions: [
            IconButton(
              // TODO: Kết nối nút này với phương thức _startScanner.
              // onPressed: _startScanner,
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.solidCamera, size: 18),
            ),
          ],
        ),
        body: BlocBuilder<OpenLibBloc, OpenLibState>(
          builder: (context, state) {
            final canSearch = state is OpenLibReadyState;
            return Column(
              children: [
                _buildSearchField(context, canSearch),
                _buildSearchTypesRadio(canSearch),
                _buildDivider(),
                if (state is OpenLibLoadingState)
                  LoadingAnimationWidget.fourRotatingDots(
                    color: context.colorScheme.primary,
                    size: 40,
                  ),
                _buildNumberOfResults(),
                (canSearch)
                    ? Expanded(
                        child: _searchingISBN
                            ? _buildFirstPageProgressIndicator(context)
                            : _searchingISBNError
                            ? _buildNoItemsFoundIndicator()
                            : _buildSearchResultsList(),
                      )
                    : _buildReconect(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildReconect() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(LocaleKeys.no_internet_connection.tr()),
          const SizedBox(height: 16),
          ElevatedButton(
            child: Text(LocaleKeys.retry.tr()),
            onPressed: () {
              context.read<OpenLibBloc>().add(ReconnectInternetEvent());
            },
          ),
        ],
      ),
    );
  }

  Scrollbar _buildSearchResultsList() {
    return Scrollbar(
      child: PagingListener(
        controller: _pagingController,
        builder: (context, state, fetchNextPage) =>
            PagedListView<int, OLSearchResultDoc>(
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate<OLSearchResultDoc>(
                firstPageProgressIndicatorBuilder: (_) =>
                    _buildFirstPageProgressIndicator(context),
                newPageProgressIndicatorBuilder: (_) =>
                    _buildNewPageProgressIndicator(context),
                noItemsFoundIndicatorBuilder: (_) =>
                    _buildNoItemsFoundIndicator(),
                itemBuilder: (context, item, index) => _buildResultCard(item),
              ),
            ),
      ),
    );
  }

  Center _buildFirstPageProgressIndicator(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: context.colorScheme.primary,
        size: 42,
      ),
    );
  }

  Builder _buildResultCard(OLSearchResultDoc item) {
    return Builder(
      builder: (context) {
        return BookCardOL(
          title: item.title ?? '',
          subtitle: item.subtitle,
          author: (item.authorName != null && item.authorName!.isNotEmpty)
              ? item.authorName![0]
              : '',
          coverKey: item.coverEditionKey,
          editions: item.editionKey,
          pagesMedian: item.medianPages,
          firstPublishYear: item.firstPublishYear,
          onAddBookPressed: () => _saveNoEdition(
            editions: item.editionKey!,
            title: item.title ?? '',
            subtitle: item.subtitle,
            author: (item.authorName != null && item.authorName!.isNotEmpty)
                ? item.authorName![0]
                : '',
            pagesMedian: item.medianPages,
            isbn: item.isbn,
            olid: item.key,
            firstPublishYear: item.firstPublishYear,
            cover: item.coverI,
          ),
          onChooseEditionPressed: () => _onChooseEditionPressed(item),
        );
      },
    );
  }

  Center _buildNoItemsFoundIndicator() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(cornerRadius),
            onTap: _addBookManually,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    LocaleKeys.no_search_results.tr(),
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    LocaleKeys.click_to_add_book_manually.tr(),
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center _buildNewPageProgressIndicator(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: context.colorScheme.primary,
          size: 42,
        ),
      ),
    );
  }

  Widget _buildNumberOfResults() {
    return (numberOfResults != null && numberOfResults! > 0)
        ? Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$numberOfResults ${LocaleKeys.results_lowercase.tr()}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }

  Padding _buildDivider() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Divider(height: 3),
    );
  }

  Align _buildSearchTypesRadio(bool canSearch) {
    return Align(
      alignment: Alignment.centerLeft,
      child: BlocBuilder<OpenLibSearchBloc, OpenLibSearchState>(
        builder: (context, state) {
          return Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              for (var i = 0; i < 4; i++) ...[
                if (i != 0) const SizedBox(width: 5),
                OLSearchRadio(
                  canSearch: canSearch,
                  searchType: OLSearchType.values[i],
                  activeSearchType: _getOLSearchTypeEnum(state),
                  onChanged: _changeSearchType,
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  Padding _buildSearchField(BuildContext context, bool canSearch) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
      child: Row(
        children: [
          Expanded(
            child: BookTextField(
              controller: _searchController,
              keyboardType: TextInputType.name,
              maxLength: 99,
              autofocus: true,
              textInputAction: TextInputAction.search,
              textCapitalization: TextCapitalization.sentences,
              onSubmitted: (_) => _startNewSearch(),
              enable: canSearch,
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: canSearch ? _startNewSearch : null,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: context.colorScheme.primary,
                foregroundColor: context.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(cornerRadius),
                ),
              ),
              child: Text(
                LocaleKeys.search.tr(),
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
