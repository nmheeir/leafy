import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/data/models/book.dart';
import 'package:leafy/ui/books/widgets/cards/book_card_grid.dart';
import 'package:leafy/ui/books/widgets/cards/book_card_grid_detail.dart';

// Ghi chú: Việc điều hướng (Navigator.push) và quản lý sách hiện tại (CurrentBookCubit)
// nên được xử lý bên trong callback onBookTap ở widget cha.

class BooksGrid extends StatefulWidget {
  const BooksGrid({
    super.key,
    required this.books,
    required this.listNumber,
    required this.allBooksCount,
    required this.gridType,
    required this.gridSize,
    required this.titleOverCover,
    // --- CÁC THAM SỐ MỚI THAY THẾ BLOC ---
    required this.selectedBookIds,
    required this.onBookTap,
    required this.onBookLongPress,
  });

  final List<Book> books;
  final int listNumber;
  final int allBooksCount;
  final DisplayType gridType;
  final int gridSize;
  final bool titleOverCover;

  // --- TRẠNG THÁI VÀ CALLBACKS TỪ BÊN NGOÀI ---
  final List<int> selectedBookIds;
  final void Function(Book book, String heroTag) onBookTap;
  final void Function(Book book) onBookLongPress;

  @override
  State<BooksGrid> createState() => _BooksGridState();
}

class _BooksGridState extends State<BooksGrid>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return CustomScrollView(
      slivers: [
        // NumberOfBooks(
        //   filteredBooksCount: widget.books.length,
        //   allBooksCount: widget.allBooksCount,
        // ),
        // Loại bỏ BlocBuilder, truyền trực tiếp danh sách selectedBookIds
        _buildGrid(list: widget.selectedBookIds),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildGrid({required List<int> list}) {
    // ...existing code...
    bool multiSelectMode = list.isNotEmpty;

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 90),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.gridSize,
          childAspectRatio:
              widget.gridType == DisplayType.detailedGrid &&
                  !widget.titleOverCover
              ? 1 / 1.7
              : 1 / 1.5,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          final book = widget.books[index];
          final heroTag = 'tag_${widget.listNumber}_${book.id}';
          final isSelected = multiSelectMode && list.contains(book.id);

          Color borderColor = isSelected
              ? Theme.of(context).colorScheme.secondary
              : Colors.transparent;
          final double borderWidth = isSelected ? 3.0 : 0.0;

          return Container(
            decoration: multiSelectMode
                ? BoxDecoration(
                    border: Border.all(color: borderColor, width: borderWidth),
                    borderRadius: BorderRadius.circular(10),
                  )
                : null,
            child: Stack(
              fit: StackFit.expand,
              children: [
                _buildCard(index, heroTag),
                _buildMultiSelectOverlay(isSelected, index, heroTag),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMultiSelectOverlay(bool isSelected, int index, String heroTag) {
    if (!isSelected) {
      return const SizedBox();
    }
    final book = widget.books[index];

    return InkWell(
      // Gọi callback được truyền từ widget cha
      onTap: () => widget.onBookTap(book, heroTag),
      onLongPress: () => widget.onBookLongPress(book),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withAlpha(150),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(int index, String heroTag) {
    final book = widget.books[index];

    // Loại bỏ BlocBuilder, sử dụng trực tiếp widget.gridType
    if (widget.gridType == DisplayType.detailedGrid) {
      return BookCardGridDetailed(
        book: book,
        heroTag: heroTag,
        addBottomPadding: (widget.books.length == index + 1),
        // Truyền trực tiếp cờ showTitleOverCover
        showTitleOverCover: widget.titleOverCover,
        // Gọi callback được truyền từ widget cha
        onPressed: () => widget.onBookTap(book, heroTag),
        onLongPressed: () => widget.onBookLongPress(book),
      );
    } else {
      return BookCardGrid(
        book: book,
        heroTag: heroTag,
        addBottomPadding: (widget.books.length == index + 1),
        // Gọi callback được truyền từ widget cha
        onPressed: () => widget.onBookTap(book, heroTag),
        onLongPressed: () => widget.onBookLongPress(book),
      );
    }
  }
}
