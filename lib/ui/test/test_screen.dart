import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/bloc/sort_bloc/sort_bloc.dart';
import 'package:leafy/logic/bloc/sort_bloc/sort_state.dart';
import 'package:leafy/logic/cubit/book_list_order_cubit.dart';
import 'package:leafy/logic/cubit/display_cubit.dart';
import 'package:leafy/logic/cubit/library/library_cubit.dart';
import 'package:leafy/logic/utils/book_list_processor.dart';
import 'package:leafy/ui/books/widgets/books_tag_chip.dart';
import 'package:leafy/ui/books/widgets/empty_books_list.dart';
import 'package:leafy/ui/books/widgets/layouts/books_grid.dart';
import 'package:leafy/ui/books/widgets/layouts/books_list.dart';

class TestBooksScreen extends StatefulWidget {
  const TestBooksScreen({super.key});

  @override
  State<TestBooksScreen> createState() => _TestBooksScreenState();
}

class _TestBooksScreenState extends State<TestBooksScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _chipScrollController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // TabController length nên lấy động theo bookListsOrder nếu có thể,
    // nhưng hiện tại để cứng 4 cũng ổn nếu logic không đổi.
    _tabController = TabController(length: 4, vsync: this);
    _chipScrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _chipScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // Lắng nghe thứ tự tab
    return BlocBuilder<BookListsOrderCubit, List<BookStatus>>(
      builder: (context, bookListsOrder) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            // Thanh Chips chọn Tab
            SingleChildScrollView(
              controller: _chipScrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _buildTabChips(context, bookListsOrder),
              ),
            ),
            const SizedBox(height: 8),
            // Nội dung chính
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: _buildTabs(context, bookListsOrder),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Hàm xây dựng danh sách các Tab
  List<Widget> _buildTabs(
    BuildContext context,
    List<BookStatus> bookListsOrder,
  ) {
    return bookListsOrder.map((status) {
      switch (status) {
        case BookStatus.finished:
          return _buildGenericBooksTab<SortFinishedBooksBloc>(
            listGetter: (state) =>
                state.finishedBooks, // Lấy data từ LibraryState
            listNumber: 0,
          );
        case BookStatus.inProgress:
          return _buildGenericBooksTab<SortInProgressBooksBloc>(
            listGetter: (state) => state.inProgressBooks,
            listNumber: 1,
          );
        case BookStatus.forLater:
          return _buildGenericBooksTab<SortForLaterBooksBloc>(
            listGetter: (state) => state.toReadBooks,
            listNumber: 2,
          );
        case BookStatus.unfinished:
          return _buildGenericBooksTab<SortUnfinishedBooksBloc>(
            listGetter: (state) => state.unfinishedBooks,
            listNumber: 3,
          );
      }
    }).toList();
  }

  /// Hàm Generic để build Tab. Giúp giảm lặp code (DRY).
  /// [TSortBloc]: Loại Bloc sort tương ứng (vd: SortFinishedBooksBloc)
  /// [listGetter]: Hàm lấy list sách tương ứng từ LibraryState
  Widget _buildGenericBooksTab<TSortBloc extends BlocBase<SortState>>({
    required List<Book> Function(LibraryState) listGetter,
    required int listNumber,
  }) {
    // 1. Lắng nghe cấu hình Sort/Filter của Tab này
    return BlocBuilder<TSortBloc, SortState>(
      builder: (context, sortState) {
        // 2. Lắng nghe dữ liệu sách từ LibraryCubit
        return BlocBuilder<LibraryCubit, LibraryState>(
          builder: (context, libraryState) {
            return libraryState.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: () => Center(child: Text('Error')), // Hiển thị lỗi nếu có
              loaded: (allBooks) {
                // Lấy danh sách gốc theo status (ví dụ: Finished Books)
                final rawList = listGetter(libraryState);

                if (rawList.isEmpty) {
                  return const EmptyBooksList();
                }

                // Áp dụng Sort & Filter thông qua Helper Class
                final processedList = BookListProcessor.process(
                  books: rawList,
                  sortState: sortState,
                );

                if (processedList.isEmpty) {
                  return const EmptyBooksList(); // Rỗng sau khi filter
                }

                // 3. Hiển thị UI (List hoặc Grid)
                return BlocBuilder<DisplayCubit, DisplayState>(
                  builder: (context, displayState) {
                    if (_displayIsGrid(displayState)) {
                      return BooksGrid(
                        books: processedList,
                        listNumber: listNumber,
                        allBooksCount: processedList.length,
                        gridType: displayState.type,
                        gridSize: displayState.gridSize,
                        titleOverCover: displayState.showTitleOverCover,
                      );
                    } else {
                      return BooksList(
                        books: processedList,
                        listNumber: listNumber,
                        allBooksCount: processedList.length,
                      );
                    }
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  bool _displayIsGrid(DisplayState state) {
    return state.type == DisplayType.grid ||
        state.type == DisplayType.detailedGrid;
  }

  List<Widget> _buildTabChips(BuildContext context, List<BookStatus> order) {
    // Logic tạo chip giữ nguyên, chỉ mapping enum sang UI
    return order.asMap().entries.map((entry) {
      final index = entry.key;
      final status = entry.value;
      String title = '';

      switch (status) {
        case BookStatus.finished:
          title = LocaleKeys.books_finished.tr();
          break;
        case BookStatus.inProgress:
          title = LocaleKeys.books_in_progress.tr();
          break;
        case BookStatus.forLater:
          title = LocaleKeys.books_for_later.tr();
          break;
        case BookStatus.unfinished:
          title = LocaleKeys.books_unfinished.tr();
          break;
      }

      return Padding(
        padding: const EdgeInsets.only(
          right: 10,
        ), // Gộp SizedBox vào đây cho gọn
        child: BooksTagChip(
          index: index,
          tabController: _tabController,
          title: title,
        ),
      );
    }).toList();
  }
}
