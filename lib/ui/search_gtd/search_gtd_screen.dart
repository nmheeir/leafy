import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/data/models/gutendex/gtd_book_result.dart';
import 'package:leafy/domain/services/gutendex_service.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/ui/epub_view/epub_view_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SearchGtdScreen extends StatefulWidget {
  const SearchGtdScreen({super.key});

  @override
  State<SearchGtdScreen> createState() => _SearchGtdScreenState();
}

class _SearchGtdScreenState extends State<SearchGtdScreen> {
  int? _numberOfResults;

  late final _pagingController = PagingController<int, GtdBookResult>(
    getNextPageKey: (state) =>
        state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) => _fetchPage(pageKey),
  );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.search_in_gutendex.tr(),
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          IconButton(
            // TODO: Kết nối nút này với phương thức _startScanner.
            // onPressed: _startScanner,
            onPressed: () {
              print(_numberOfResults);
            },
            icon: const FaIcon(FontAwesomeIcons.solidCamera, size: 18),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(_numberOfResults.toString()),
          Expanded(child: _buildSearchResults()),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return PagingListener(
      controller: _pagingController,
      builder: (context, state, fetchNextPage) {
        return PagedListView(
          state: state,
          fetchNextPage: fetchNextPage,
          builderDelegate: PagedChildBuilderDelegate<GtdBookResult>(
            firstPageProgressIndicatorBuilder: (_) =>
                _buildFirstPageProgressIndicator(context),
            newPageProgressIndicatorBuilder: (_) =>
                _buildNewPageProgressIndicator(context),
            noItemsFoundIndicatorBuilder: (_) => _buildNoItemsFoundIndicator(),
            itemBuilder: (context, item, index) {
              return ListTile(
                title: Text(item.title.toString()),
                contentPadding: EdgeInsets.all(8),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EpubViewScreen(
                      epubUrl: item.formats!.applicationEpubZip!,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<List<GtdBookResult>> _fetchPage(int pageKey) async {
    try {
      final newItems = await GutendexService().getBooks(page: pageKey);

      _numberOfResults = newItems.count;

      return newItems.results;
    } catch (e) {
      return [];
    }
  }

  Center _buildFirstPageProgressIndicator(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: context.colorScheme.primary,
        size: 42,
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

  Center _buildNoItemsFoundIndicator() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(cornerRadius),
            onTap: () {},
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
}
