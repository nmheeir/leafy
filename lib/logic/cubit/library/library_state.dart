part of 'library_cubit.dart';

@freezed
class LibraryState with _$LibraryState {
  const factory LibraryState.initial() = _Initial;
  const factory LibraryState.loading() = _Loading;
  const factory LibraryState.loaded({required List<Book> allBooks}) = _Loaded;
  const factory LibraryState.error() = _Error;

  const LibraryState._();

  List<String> get allTags {
    return maybeWhen(
      loaded: (books) {
        final tags = <String>{};
        for (var book in books) {
          if (book.tags != null) tags.addAll(book.tags!.split('|||||'));
        }
        return tags.toList()..sort();
      },
      orElse: () => [],
    );
  }

  /// Lấy danh sách tất cả tác giả (không trùng lặp, sắp xếp A-Z)
  List<String> get allAuthors {
    return maybeWhen(
      loaded: (books) {
        // 1. Dùng Set để lọc trùng lặp
        final uniqueAuthors = <String>{};

        for (final book in books) {
          if (book.author.isNotEmpty) {
            uniqueAuthors.add(book.author);
          }
        }

        // 2. Chuyển về List và sắp xếp
        final sortedAuthors = uniqueAuthors.toList();
        sortedAuthors.sort((a, b) => a.compareTo(b));

        return sortedAuthors;
      },
      orElse: () => [],
    );
  }

  /// Lấy danh sách các năm đã đọc xong sách (không trùng lặp, sắp xếp giảm dần: 2024, 2023...)
  List<int> get finishedYears {
    return maybeWhen(
      loaded: (books) {
        final uniqueYears = <int>{};

        for (final book in books) {
          // Duyệt qua lịch sử đọc của từng cuốn sách
          for (final reading in book.readings) {
            // Chỉ lấy năm nếu đã có ngày đọc xong
            if (reading.finishDate != null) {
              uniqueYears.add(reading.finishDate!.year);
            }
          }
        }

        final sortedYears = uniqueYears.toList();
        sortedYears.sort((a, b) => b.compareTo(a));

        return sortedYears;
      },
      orElse: () => [],
    );
  }

  List<Book> get finishedBooks => maybeWhen(
    loaded: (books) =>
        books.where((b) => b.status == BookStatus.finished).toList(),
    orElse: () => [],
  );

  List<Book> get inProgressBooks => maybeWhen(
    loaded: (books) =>
        books.where((b) => b.status == BookStatus.inProgress).toList(),
    orElse: () => [],
  );

  List<Book> get toReadBooks => maybeWhen(
    loaded: (books) =>
        books.where((b) => b.status == BookStatus.forLater).toList(),
    orElse: () => [],
  );

  List<Book> get unfinishedBooks => maybeWhen(
    loaded: (books) =>
        books.where((b) => b.status == BookStatus.unfinished).toList(),
    orElse: () => [],
  );
}
