import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart'; // context.colorScheme
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/bloc/local_search/local_search_bloc.dart'; // Import Bloc mới
import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/ui/book/book_screen.dart';
import 'package:leafy/ui/book_editor/widgets/form_fields/book_text_field.dart';
import 'package:leafy/ui/books/widgets/cards/book_card_list.dart';
import 'package:leafy/ui/common/keyboard_dismissable.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(
      () => _onSearchChanged(_searchController.text),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    context.localSearchBloc.close();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    context.localSearchBloc.add(LocalSearchEvent.queryChanged(query));
  }

  @override
  Widget build(BuildContext context) {
    // Cung cấp Bloc cho cây widget con
    return BlocProvider.value(
      value: context.localSearchBloc,
      child: KeyboardDismissible(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              LocaleKeys.search_in_books.tr(),
              style: const TextStyle(fontSize: 18),
            ),
          ),
          body: Column(
            children: [
              _buildSearchBar(),
              Expanded(child: _buildSearchResults()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: BookTextField(
        controller: _searchController,
        keyboardType: TextInputType.name,
        maxLength: 99,
        autofocus: true,
        textInputAction: TextInputAction.search,
        textCapitalization: TextCapitalization.sentences,
        hint: LocaleKeys.search_in_books.tr(),
      ),
    );
  }

  Widget _buildSearchResults() {
    return BlocBuilder<LocalSearchBloc, LocalSearchState>(
      builder: (context, state) {
        return state.when(
          // 1. Trạng thái ban đầu (chưa nhập gì)
          initial: () => Center(
            child: Text(
              LocaleKeys.search_in_books.tr(),
              style: TextStyle(color: context.colorScheme.onSurfaceVariant),
            ),
          ),

          // 2. Trạng thái đang tìm kiếm (Debounce xong, đang query DB)
          loading: () => const Center(child: CircularProgressIndicator()),

          // 3. Trạng thái tìm thấy không có kết quả
          empty: () => Center(
            child: Text(
              // LocaleKeys.no_books_found.tr(),
              'No books found',
              style: TextStyle(color: context.colorScheme.onSurfaceVariant),
            ),
          ),

          // 4. Trạng thái lỗi
          failure: (message) => Center(child: Text(message)),

          // 5. Trạng thái hiển thị danh sách kết quả
          loaded: (books) => _buildList(books),
        );
      },
    );
  }

  Widget _buildList(List<Book> books) {
    return ListView.builder(
      itemCount: books.length,
      padding: const EdgeInsets.only(bottom: 20),
      itemBuilder: (context, index) {
        final book = books[index];
        // NOTE: nếu test không thấy đúng thì uncommnent đi
        // final heroTag = 'tag_$index';
        final heroTag = 'search_tag_${book.id}_$index';

        return BookCardList(
          book: book,
          heroTag: heroTag,
          addBottomPadding: index == books.length - 1,
          cardColor: context.colorScheme.secondaryContainer.withValues(
            alpha: 150,
          ), // Fix withAlpha deprecation nếu dùng Flutter mới
          onPressed: () {
            if (book.id == null) return;

            // --- NAVIGATION LOGIC ---
            // Không dùng CurrentBookCubit nữa. Truyền trực tiếp ID/Book.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookScreen(
                  heroTag: heroTag,
                  // Giả sử BookScreen đã được update để nhận tham số này
                  // bookId: book.id!,
                  // previewBook: book,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
