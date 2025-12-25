import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/bloc/open_lib/open_lib_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// Core imports
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/generated/locale_keys.g.dart';

// Domain/Data imports
import 'package:leafy/logic/bloc/search/search_bloc.dart';

// UI Widgets
import 'package:leafy/ui/book_editor/widgets/form_fields/book_text_field.dart';
import 'package:leafy/ui/common/keyboard_dismissable.dart';
import 'package:leafy/ui/search_ol/widgets/book_card_ol.dart';
import 'package:leafy/ui/search_ol/widgets/ol_search_radio.dart';

class TestSearchOLScreen extends StatefulWidget {
  const TestSearchOLScreen({super.key});

  @override
  State<TestSearchOLScreen> createState() => _TestSearchOLScreenState();
}

class _TestSearchOLScreenState extends State<TestSearchOLScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // 1. Lắng nghe sự kiện cuộn để load more
    _scrollController.addListener(_onScroll);

    // 2. Khôi phục text tìm kiếm nếu Bloc vẫn giữ state cũ (khi back lại màn hình)
    final currentState = context.read<SearchBloc>().state;
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
      context.read<SearchBloc>().add(const SearchEvent.loadMore());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    // Trigger khi cuộn được 90% danh sách
    return currentScroll >= (maxScroll * 0.9);
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
      child: BlocBuilder<SearchBloc, SearchState>(
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
                      context.read<SearchBloc>().add(
                        SearchEvent.typeChanged(val),
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
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        // TRẠNG THÁI 1: Màn hình chờ ban đầu
        if (state.status == SearchStatus.initial) {
          return Center(child: Text(LocaleKeys.search.tr()));
        }

        // TRẠNG THÁI 2: Đang tải lần đầu tiên (Load query mới)
        if (state.status == SearchStatus.loading && state.books.isEmpty) {
          return Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              color: Theme.of(context).primaryColor,
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
                    context.read<SearchBloc>().add(
                      SearchEvent.queryChanged(_searchController.text),
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
        return ListView.builder(
          controller: _scrollController,
          itemCount: state.hasReachedMax
              ? state.books.length
              : state.books.length + 1,
          itemBuilder: (context, index) {
            // Render cái xoay xoay ở dưới cùng khi đang Load More
            if (index >= state.books.length) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                ),
              );
            }

            final item = state.books[index];

            // Render Book Card
            return BookCardOL(
              title: item.title ?? '',
              subtitle: item.subtitle,
              author: (item.authorName?.isNotEmpty == true)
                  ? item.authorName![0]
                  : '',
              coverKey: item.coverEditionKey,
              editions: item.editionKey,
              pagesMedian: item.medianPages,
              firstPublishYear: item.firstPublishYear,
              onChooseEditionPressed: () {},
              onAddBookPressed: () {},
            );
          },
        );
      },
    );
  }

  // BUG: clear text in search field do not modified state in bloc
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

  void _startNewSearch() {
    context.read<SearchBloc>().add(
      SearchEvent.queryChanged(_searchController.text),
    );
  }

  Padding _buildDivider() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Divider(height: 3),
    );
  }
}
