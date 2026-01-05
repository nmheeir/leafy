import 'package:diacritic/diacritic.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/data/models/book/utils/utils.dart';
import 'package:leafy/logic/bloc/sort_bloc/sort_state.dart';

class BookListProcessor {
  // Hàm duy nhất UI cần gọi
  static List<Book> process({
    required List<Book> books,
    required SortState sortState,
  }) {
    var list = [...books]; // Tạo bản sao để tránh mutate list gốc

    // 1. Filter Favorite
    if (sortState.onlyFavorite) {
      list = list.where((b) => b.favorite).toList();
    }

    // 2. Filter Years
    if (sortState.years != null) {
      final yearsList = sortState.years!.split(Constants.tagDelimeter);
      list = list.where((book) {
        return book.readings.any(
          (r) =>
              r.finishDate != null &&
              yearsList.contains(r.finishDate!.year.toString()),
        );
      }).toList();
    }

    // 3. Filter Tags
    if (sortState.tags != null) {
      list = _filterTags(
        list: list,
        tags: sortState.tags!,
        asAnd: sortState.filterTagsAsAnd,
        filterOut: sortState.filterOutTags,
      );
    }

    // 4. Filter Book Type
    if (sortState.bookType != null) {
      list = list.where((b) => b.bookFormat == sortState.bookType).toList();
    }

    // 5. Sorting
    return _sort(
      list: list,
      sortType: sortState.sortType,
      isAsc: sortState.isAsc,
    );
  }

  static List<Book> _filterTags({
    required List<Book> list,
    required String tags,
    required bool asAnd,
    required bool filterOut,
  }) {
    final selectedTags = tags.split(Constants.tagDelimeter);

    return list.where((book) {
      if (book.tags == null) {
        return filterOut; // Nếu lọc bỏ tag mà sách ko có tag -> giữ lại
      }

      final bookTags = book.tags!.split(Constants.tagDelimeter);

      if (filterOut) {
        // Loại bỏ nếu chứa bất kỳ tag nào trong selectedTags
        return !bookTags.any((t) => selectedTags.contains(t));
      } else {
        if (asAnd) {
          // Phải chứa TẤT CẢ selectedTags
          return selectedTags.every((t) => bookTags.contains(t));
        } else {
          // Chỉ cần chứa MỘT TRONG CÁC selectedTags
          return bookTags.any((t) => selectedTags.contains(t));
        }
      }
    }).toList();
  }

  static List<Book> _sort({
    required List<Book> list,
    required SortType sortType,
    required bool isAsc,
  }) {
    final comparator = switch (sortType) {
      SortType.byTitle => _byTitle,
      SortType.byAuthor => _byAuthor,
      SortType.byRating => _byRating,
      SortType.byPages => _byPages,
      SortType.byStartDate => _byStartDate,
      SortType.byFinishDate => _byFinishDate,
      SortType.byPublicationYear => _byPublicationYear,
      SortType.byDateAdded => _byDateAdded,
      SortType.byDateModified => _byDateModified,
    };

    list.sort((a, b) {
      final result = comparator(a, b);
      return isAsc ? result : -result;
    });

    return list;
  }

  /* ----------------- helpers ----------------- */

  static int _compareString(String a, String b) => removeDiacritics(
    a.toLowerCase(),
  ).compareTo(removeDiacritics(b.toLowerCase()));

  static int _compareNullableInt(int? a, int? b) {
    if (a == null && b == null) return 0;
    if (a == null) return 1;
    if (b == null) return -1;
    return a.compareTo(b);
  }

  static int _compareNullableDate(DateTime? a, DateTime? b) {
    if (a == null && b == null) return 0;
    if (a == null) return 1;
    if (b == null) return -1;
    return a.millisecondsSinceEpoch.compareTo(b.millisecondsSinceEpoch);
  }

  static int _fallback(Book a, Book b) {
    int r = _compareNullableInt(a.publicationYear, b.publicationYear);
    if (r != 0) return r;
    return _compareString(a.title, b.title);
  }

  /* ----------------- comparators ----------------- */

  static int _byTitle(Book a, Book b) => _compareString(a.title, b.title);

  static int _byAuthor(Book a, Book b) {
    int r = _compareString(a.author, b.author);
    if (r != 0) return r;
    return _fallback(a, b);
  }

  static int _byRating(Book a, Book b) {
    int r = _compareNullableInt(a.rating, b.rating);
    if (r != 0) return r;
    return _fallback(a, b);
  }

  static int _byPages(Book a, Book b) {
    int r = _compareNullableInt(a.pages, b.pages);
    if (r != 0) return r;
    return _fallback(a, b);
  }

  static int _byPublicationYear(Book a, Book b) {
    int r = _compareNullableInt(a.publicationYear, b.publicationYear);
    if (r != 0) return r;
    return _compareString(a.title, b.title);
  }

  static int _byDateAdded(Book a, Book b) {
    int r = _compareNullableDate(a.dateAdded, b.dateAdded);
    if (r != 0) return r;
    return _fallback(a, b);
  }

  static int _byDateModified(Book a, Book b) {
    int r = _compareNullableDate(a.dateModified, b.dateModified);
    if (r != 0) return r;
    return _fallback(a, b);
  }

  static int _byStartDate(Book a, Book b) {
    final aDate = getLatestStartDate(a);
    final bDate = getLatestStartDate(b);

    int r = _compareNullableDate(aDate, bDate);
    if (r != 0) return r;
    return _fallback(a, b);
  }

  static int _byFinishDate(Book a, Book b) {
    final aDate = getLatestFinishDate(a);
    final bDate = getLatestFinishDate(b);

    int r = _compareNullableDate(aDate, bDate);
    if (r != 0) return r;
    return _fallback(a, b);
  }
}
