part of 'library_cubit.dart';

@freezed
class LibraryState with _$LibraryState {
  const factory LibraryState.initial() = _Initial;
  const factory LibraryState.loading() = _Loading;
  const factory LibraryState.loaded({required List<Book> allBooks}) = _Loaded;
  const factory LibraryState.error() = _Error;

  const LibraryState._();

  // NOTE: Tags are now managed through the Tag system (separate tags table).
  // Use GetAllActiveTagsUseCase to get all tags instead of this getter.
  // This getter is kept for backward compatibility but returns empty list.
  List<String> get allTags => [];

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
          // Lấy năm từ finishDate trực tiếp
          if (book.finishDate != null) {
            uniqueYears.add(book.finishDate!.year);
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
