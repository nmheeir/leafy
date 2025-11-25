import 'package:flutter/material.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/data/models/book.dart';
import 'package:leafy/ui/books/widgets/cards/book_card_list_compact.dart';

// Ghi chú: Logic điều hướng và quản lý trạng thái lựa chọn
// nên được xử lý trong các callback ở widget cha.

// Giả định rằng BookCardList và BookCardListCompact cũng đã được viết lại
// để không dùng BLoC, và chúng ta cần truyền cờ hiển thị cho chúng.
// Đây là một enum ví dụ cho rating display type.
enum RatingDisplayType { bar, number }

class BooksList extends StatefulWidget {
  const BooksList({
    super.key,
    required this.books,
    required this.listNumber,
    this.allBooksCount,
    // --- CÁC THAM SỐ MỚI THAY THẾ BLOC ---
    required this.displayType,
    required this.selectedBookIds,
    required this.onBookTap,
    required this.onBookLongPress,
  });

  final List<Book> books;
  final int listNumber;
  final int? allBooksCount;

  // --- TRẠNG THÁI VÀ CALLBACKS TỪ BÊN NGOÀI ---
  final DisplayType displayType;
  final List<int> selectedBookIds;
  final void Function(Book book, String heroTag) onBookTap;
  final void Function(Book book) onBookLongPress;

  @override
  State<BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<BooksList>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return CustomScrollView(
      slivers: [
        // widget.allBooksCount != null
        //     ? NumberOfBooks(
        //         filteredBooksCount: widget.books.length,
        //         allBooksCount: widget.allBooksCount!,
        //       )
        //     : const SliverToBoxAdapter(),
        // Loại bỏ BlocBuilder, truyền trực tiếp danh sách ID đã chọn
        _buildList(list: widget.selectedBookIds),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildList({required List<int> list}) {
    // ...existing code...
    bool multiSelectMode = list.isNotEmpty;

    const unselectedCardColor = null;
    final selectedCardColor = Theme.of(context).colorScheme.secondaryContainer;

    return SliverList.builder(
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        final book = widget.books[index];
        final heroTag = 'tag_${widget.listNumber}_${book.id}';
        final isSelected = multiSelectMode && list.contains(book.id);
        final color = isSelected ? selectedCardColor : unselectedCardColor;

        // Loại bỏ BlocBuilder, sử dụng tham số displayType
        if (widget.displayType == DisplayType.compactList) {
          return BookCardListCompact(
            book: book,
            heroTag: heroTag,
            cardColor: color,
            addBottomPadding: (widget.books.length == index + 1),
            // Gọi các callback được truyền từ widget cha
            onPressed: () => widget.onBookTap(book, heroTag),
            onLongPressed: () => widget.onBookLongPress(book),
          );
        } else if (widget.displayType == DisplayType.list) {
          // Giả sử BookCardList là phiên bản không có state management
          // và cần được cung cấp các tham số hiển thị.
          // Nếu bạn chưa sửa đổi BookCardList, nó vẫn sẽ hoạt động
          // vì nó tự lắng nghe các BLoC.
          return BookCardListCompact(
            book: book,
            heroTag: heroTag,
            cardColor: color,
            addBottomPadding: (widget.books.length == index + 1),
            // Gọi các callback được truyền từ widget cha
            onPressed: () => widget.onBookTap(book, heroTag),
            onLongPressed: () => widget.onBookLongPress(book),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
