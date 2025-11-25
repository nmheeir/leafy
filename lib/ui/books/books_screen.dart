import 'package:flutter/material.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/data/models/book.dart';
import 'package:leafy/ui/books/widgets/books_tag_chip.dart';
import 'package:leafy/ui/books/widgets/empty_books_list.dart';
import 'package:leafy/ui/books/widgets/layouts/books_grid.dart';
import 'package:leafy/ui/books/widgets/layouts/books_list.dart';

/// Một widget chỉ để hiển thị, không chứa logic nghiệp vụ.
/// Nó nhận vào dữ liệu đã được xử lý và các callback để hiển thị danh sách sách.
class BooksScreen extends StatefulWidget {
  const BooksScreen({
    super.key,
    required this.bookListsOrder,
    this.booksForTabs = const {},
    this.allBooksCountForTabs = const {},
    this.displayType = DisplayType.list,
    this.gridSize = 2,
    this.showTitleOverCover = false,
    this.selectedBookIds = const [],
    required this.onBookTap,
    required this.onBookLongPress,
  });

  /// Thứ tự của các tab hiển thị.
  final List<BookStatus> bookListsOrder;

  /// Một Map chứa danh sách các cuốn sách đã được lọc và sắp xếp cho mỗi tab.
  /// Mặc định là một Map rỗng.
  final Map<BookStatus, List<Book>> booksForTabs;

  /// Một Map chứa tổng số sách (trước khi lọc) cho mỗi tab.
  /// Mặc định là một Map rỗng.
  final Map<BookStatus, int> allBooksCountForTabs;

  /// Kiểu hiển thị (danh sách, lưới, v.v.).
  /// Mặc định là dạng danh sách.
  final DisplayType displayType;

  /// Số cột khi hiển thị dạng lưới. Mặc định là 2.
  final int gridSize;

  /// Có hiển thị tiêu đề đè lên ảnh bìa hay không (chỉ áp dụng cho dạng lưới).
  /// Mặc định là false.
  final bool showTitleOverCover;

  /// Danh sách ID của các sách đang được chọn.
  /// Mặc định là một danh sách rỗng.
  final List<int> selectedBookIds;

  /// Callback được gọi khi một cuốn sách được nhấn.
  final void Function(Book book, String heroTag) onBookTap;

  /// Callback được gọi khi một cuốn sách được nhấn giữ.
  final void Function(Book book) onBookLongPress;

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _chipScrollController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.bookListsOrder.length, vsync: this);
    _chipScrollController = ScrollController();
  }

  @override
  void didUpdateWidget(BooksScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Cập nhật TabController nếu số lượng tab thay đổi
    if (oldWidget.bookListsOrder.length != widget.bookListsOrder.length) {
      _tabController.dispose();
      _tabController =
          TabController(length: widget.bookListsOrder.length, vsync: this);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _chipScrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        SingleChildScrollView(
          controller: _chipScrollController,
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _buildTabChips(context, widget.bookListsOrder),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: _buildTabs(context, widget.bookListsOrder),
          ),
        ),
      ],
    );
  }

  Widget _buildBooksTabView({
    required int listNumber,
    required List<Book> books,
    required int allBooksCount,
  }) {
    if (books.isEmpty) {
      return const EmptyBooksList();
    }

    final bool isGrid = widget.displayType == DisplayType.grid ||
        widget.displayType == DisplayType.detailedGrid;

    if (isGrid) {
      return BooksGrid(
        books: books,
        listNumber: listNumber,
        allBooksCount: allBooksCount,
        gridType: widget.displayType,
        gridSize: widget.gridSize,
        titleOverCover: widget.showTitleOverCover,
        // Giả sử BooksGrid đã được sửa đổi để không dùng BLoC
        selectedBookIds: widget.selectedBookIds,
        onBookTap: widget.onBookTap,
        onBookLongPress: widget.onBookLongPress,
      );
    } else {
      return BooksList(
        books: books,
        listNumber: listNumber,
        allBooksCount: allBooksCount,
        // Giả sử BooksList đã được sửa đổi để không dùng BLoC
        displayType: widget.displayType,
        selectedBookIds: widget.selectedBookIds,
        onBookTap: widget.onBookTap,
        onBookLongPress: widget.onBookLongPress,
      );
    }
  }

  List<Widget> _buildTabChips(
    BuildContext context,
    List<BookStatus> bookListsOrder,
  ) {
    List<Widget> tabChips = [];
    int index = 0;

    for (var status in bookListsOrder) {
      String title;
      switch (status) {
        case BookStatus.read:
          title = 'Finished';
          break;
        case BookStatus.inProgress:
          title = 'In Progress';
          break;
        case BookStatus.forLater:
          title = 'For Later';
          break;
        case BookStatus.unfinished:
          title = 'Unfinished';
          break;
      }
      tabChips.add(BooksTagChip(
        index: index,
        tabController: _tabController,
        title: title,
      ));
      index++;
    }

    tabChips.add(const SizedBox(width: 10));

    return tabChips;
  }

  List<Widget> _buildTabs(
    BuildContext context,
    List<BookStatus> bookListsOrder,
  ) {
    List<Widget> tabs = [];
    int listNumber = 0;

    for (var status in bookListsOrder) {
      final books = widget.booksForTabs[status] ?? [];
      final allBooksCount = widget.allBooksCountForTabs[status] ?? 0;
      tabs.add(_buildBooksTabView(
        listNumber: listNumber,
        books: books,
        allBooksCount: allBooksCount,
      ));
      listNumber++;
    }

    return tabs;
  }
}