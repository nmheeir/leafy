import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/domain/open_lib/entities/ol_search_result_doc.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/bloc/open_lib/open_lib_bloc.dart';
import 'package:leafy/logic/bloc/open_lib_search/open_lib_search_bloc.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/ui/book_editor/book_editor_args.dart';
import 'package:leafy/ui/book_editor/book_editor_screen.dart';
import 'package:leafy/ui/book_editor/widgets/form_fields/book_text_field.dart';
import 'package:leafy/ui/common/keyboard_dismissable.dart';
import 'package:leafy/ui/search_ol/widgets/book_card_ol.dart';
import 'package:leafy/ui/search_ol/widgets/ol_search_radio.dart';
import 'package:leafy/ui/search_ol_edition/search_ol_edition_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SearchOLScreen extends StatefulWidget {
  const SearchOLScreen({super.key});

  @override
  State<SearchOLScreen> createState() => _SearchOLScreenState();
}

class _SearchOLScreenState extends State<SearchOLScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // 1. Lắng nghe sự kiện cuộn để load more
    _scrollController.addListener(_onScroll);

    // 2. Khôi phục text tìm kiếm nếu Bloc vẫn giữ state cũ (khi back lại màn hình)
    final currentState = context.read<OpenLibSearchBloc>().state;
    if (currentState.currentQuery.isNotEmpty) {
      _searchController.text = currentState.currentQuery;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // --- LOGIC PHÂN TRANG (PAGINATION) ---

  void _onScroll() {
    if (_isBottom) {
      // Bắn event LoadMore khi cuộn xuống đáy
      context.read<OpenLibSearchBloc>().add(
        const OpenLibSearchEvent.loadMore(),
      );
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    // Trigger khi cuộn được 90% danh sách
    return currentScroll >= (maxScroll * 0.9);
  }

  void _startNewSearch() {
    FocusScope.of(context).unfocus();
    context.read<OpenLibSearchBloc>().add(
      OpenLibSearchEvent.queryChanged(_searchController.text),
    );
  }

  void _saveNoEdition(OLSearchResultDoc doc) {
    final BookFormat defaultBookFormat = context.defaultBookFormatCubit.state;

    final List<String> defaultTags = context.defaultBookTagCubit.state;

    context.editBookCubit.initBookFromOpenLibrary(
      title: doc.title ?? '',
      subtitle: doc.subtitle,
      author: (doc.authorName != null && doc.authorName!.isNotEmpty)
          ? doc.authorName![0]
          : '',
      pages: doc.medianPages,
      defaultFormat: defaultBookFormat,
      defaultTags: defaultTags,
    );

    // 3. Navigation
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            BookEditorScreen(args: BookEditorArgs.fromOpenLibrary(doc)),
      ),
    );
  }

  void _onChooseEditionPressed(OLSearchResultDoc item) {
    FocusManager.instance.primaryFocus?.unfocus();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchOLEditionsScreen(
          // TODO: change book status here
          status: BookStatus.finished,
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

  // --- BUILD UI ---

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissible(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.add_search.tr(),
            style: const TextStyle(fontSize: 18),
          ),
        ),
        body: BlocBuilder<OpenLibBloc, OpenLibState>(
          builder: (context, state) {
            final canSearch = state is OpenLibReadyState;
            return Column(
              children: [
                _buildSearchField(context, canSearch),

                _buildSearchTypesRadio(canSearch),

                _buildDivider(),

                // 3. Danh sách kết quả (List Result)
                Expanded(child: _buildSearchResults()),
              ],
            );
          },
        ),
      ),
    );
  }

  Align _buildSearchTypesRadio(bool canSearch) {
    return Align(
      alignment: Alignment.centerLeft,
      child: BlocBuilder<OpenLibSearchBloc, OpenLibSearchState>(
        buildWhen: (prev, curr) => prev.searchType != curr.searchType,
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
                  activeSearchType: state.searchType,
                  onChanged: (val) {
                    if (val != null) {
                      context.read<OpenLibSearchBloc>().add(
                        OpenLibSearchEvent.typeChanged(val),
                      );
                    }
                  },
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  Widget _buildSearchResults() {
    return BlocBuilder<OpenLibSearchBloc, OpenLibSearchState>(
      builder: (context, state) {
        // TRẠNG THÁI 1: Màn hình chờ ban đầu
        if (state.status == SearchStatus.initial) {
          return Center(child: Text(LocaleKeys.search.tr()));
        }

        // TRẠNG THÁI 2: Đang tải lần đầu tiên (Load query mới)
        if (state.status == SearchStatus.loading && state.books.isEmpty) {
          return Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              color: context.colorScheme.primary,
              size: 40,
            ),
          );
        }

        // TRẠNG THÁI 3: Lỗi (Mạng hoặc API)
        if (state.status == SearchStatus.failure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Error: ${state.errorMessage}"),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Retry: Gửi lại query hiện tại
                    context.read<OpenLibSearchBloc>().add(
                      OpenLibSearchEvent.queryChanged(_searchController.text),
                    );
                  },
                  child: Text(LocaleKeys.retry.tr()),
                ),
              ],
            ),
          );
        }

        // TRẠNG THÁI 4: Thành công nhưng không có dữ liệu
        if (state.books.isEmpty) {
          return Center(child: Text(LocaleKeys.no_search_results.tr()));
        }

        // TRẠNG THÁI 5: Hiển thị danh sách
        return Column(
          children: [
            _buildNumberOfResults(state.numberOfResults),

            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: state.hasReachedMax
                    ? state.books.length
                    : state.books.length + 1,
                itemBuilder: (context, index) {
                  // Render load more widget
                  if (index >= state.books.length) {
                    return _buildLoadMoreProgressIndicator();
                  }

                  final doc = state.books[index];

                  // Render Book Card
                  return _buildResultCard(doc);
                },
              ),
            ),
          ],
        );
      },
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
              onClear: () {
                context.read<OpenLibSearchBloc>().add(
                  OpenLibSearchEvent.queryChanged(''),
                );
              },
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

  Padding _buildDivider() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Divider(height: 3),
    );
  }

  Widget _buildNumberOfResults(int numberOfResults) {
    return (numberOfResults > 0)
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

  Widget _buildResultCard(OLSearchResultDoc doc) {
    return BookCardOL(
      title: doc.title ?? '',
      subtitle: doc.subtitle,
      author: (doc.authorName != null && doc.authorName!.isNotEmpty)
          ? doc.authorName![0]
          : '',
      coverKey: doc.coverI,
      editions: doc.editionKey,
      pagesMedian: doc.medianPages,
      firstPublishYear: doc.firstPublishYear,
      onAddBookPressed: () => _saveNoEdition(doc),
      onChooseEditionPressed: () => _onChooseEditionPressed(doc),
    );
  }

  Widget _buildLoadMoreProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: context.colorScheme.primary,
          size: 30,
        ),
      ),
    );
  }
}
