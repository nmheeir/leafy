import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/entities/book_read_stat.dart';
import 'package:leafy/domain/book/entities/book_yearly_stat.dart';

class StatsResult {
  final List<int> years;

  final List<Book> finishedBooks;
  final List<Book> inProgressBooks;
  final List<Book> forLaterBooks;
  final List<Book> unfinishedBooks;

  final List<BookReadStat> finishedBooksByMonthAllTypes;
  final List<BookReadStat> finishedBooksByMonthPaperbackBooks;
  final List<BookReadStat> finishedBooksByMonthHardcoverBooks;
  final List<BookReadStat> finishedBooksByMonthEbooks;
  final List<BookReadStat> finishedBooksByMonthAudiobooks;

  final List<BookReadStat> finishedPagesByMonthAllTypes;
  final List<BookReadStat> finishedPagesByMonthPaperbackBooks;
  final List<BookReadStat> finishedPagesByMonthHardcoverBooks;
  final List<BookReadStat> finishedPagesByMonthEbooks;
  final List<BookReadStat> finishedPagesByMonthAudiobooks;

  final int finishedBooksAll;
  final int finishedPagesAll;

  final List<BookYearlyStat> averageRating;
  final List<BookYearlyStat> averagePages;
  final List<BookYearlyStat> averageReadingTime;

  final List<BookYearlyStat> longestBook;
  final List<BookYearlyStat> shortestBook;
  final List<BookYearlyStat> fastestBook;
  final List<BookYearlyStat> slowestBook;

  const StatsResult({
    required this.years,
    required this.finishedBooks,
    required this.inProgressBooks,
    required this.forLaterBooks,
    required this.unfinishedBooks,
    required this.finishedBooksByMonthAllTypes,
    required this.finishedBooksByMonthPaperbackBooks,
    required this.finishedBooksByMonthHardcoverBooks,
    required this.finishedBooksByMonthEbooks,
    required this.finishedBooksByMonthAudiobooks,
    required this.finishedPagesByMonthAllTypes,
    required this.finishedPagesByMonthPaperbackBooks,
    required this.finishedPagesByMonthHardcoverBooks,
    required this.finishedPagesByMonthEbooks,
    required this.finishedPagesByMonthAudiobooks,
    required this.finishedBooksAll,
    required this.finishedPagesAll,
    required this.averageRating,
    required this.averagePages,
    required this.averageReadingTime,
    required this.longestBook,
    required this.shortestBook,
    required this.fastestBook,
    required this.slowestBook,
  });
}
