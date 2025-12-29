// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/core/utils/helpers/blurhash_util.dart';
import 'package:leafy/di/injection.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/repositories/repository.dart';
import 'package:leafy/domain/services/open_library_service.dart';
import 'package:leafy/logic/cubit/current_book_cubit.dart';
import 'package:leafy/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class BookCubit extends Cubit {
  final Repository _repository;

  BookCubit(this._repository) : super(null) {
    _initLoad();
  }

  final BehaviorSubject<List<Book>> _booksFetcher =
      BehaviorSubject<List<Book>>();
  final BehaviorSubject<List<Book>> _finishedBooksFetcher =
      BehaviorSubject<List<Book>>();
  final BehaviorSubject<List<Book>> _inProgressBooksFetcher =
      BehaviorSubject<List<Book>>();
  final BehaviorSubject<List<Book>> _toReadBooksFetcher =
      BehaviorSubject<List<Book>>();
  final BehaviorSubject<List<Book>> _deletedBooksFetcher =
      BehaviorSubject<List<Book>>();
  final BehaviorSubject<List<Book>> _unfinishedBooksFetcher =
      BehaviorSubject<List<Book>>();
  final BehaviorSubject<List<Book>> _searchBooksFetcher =
      BehaviorSubject<List<Book>>();
  final BehaviorSubject<List<int>> _finishedYearsFetcher =
      BehaviorSubject<List<int>>();
  final BehaviorSubject<List<String>> _tagsFetcher =
      BehaviorSubject<List<String>>();
  final BehaviorSubject<List<String>> _authorsFetcher =
      BehaviorSubject<List<String>>();
  final BehaviorSubject<Book?> _bookFetcher = BehaviorSubject<Book?>();
  final BehaviorSubject<List<Book>?> _booksWithSameTagFetcher =
      BehaviorSubject<List<Book>?>();
  final BehaviorSubject<List<Book>?> _booksWithSameAuthorFetcher =
      BehaviorSubject<List<Book>?>();

  Stream<List<Book>> get allBooks => _booksFetcher.stream;
  Stream<List<Book>> get finishedBooks => _finishedBooksFetcher.stream;
  Stream<List<Book>> get inProgressBooks => _inProgressBooksFetcher.stream;
  Stream<List<Book>> get toReadBooks => _toReadBooksFetcher.stream;
  Stream<List<Book>> get deletedBooks => _deletedBooksFetcher.stream;
  Stream<List<Book>> get unfinishedBooks => _unfinishedBooksFetcher.stream;
  Stream<List<Book>> get searchBooks => _searchBooksFetcher.stream;
  Stream<List<int>> get finishedYears => _finishedYearsFetcher.stream;
  Stream<List<String>> get tags => _tagsFetcher.stream;
  Stream<List<String>> get authors => _authorsFetcher.stream;
  Stream<List<Book>?> get booksWithSameTag => _booksWithSameTagFetcher.stream;
  Stream<List<Book>?> get booksWithSameAuthor =>
      _booksWithSameAuthorFetcher.stream;

  Stream<Book?> get book => _bookFetcher.stream;

  Future<void> _initLoad() async {
    if (!await _checkIfCoverMigrationDone()) {
      await _migrateCoversFromDatabaseToStorage();
    }

    getFinishedBooks();
    getInProgressBooks();
    getToReadBooks();
    getUnfinishedBooks();
    getAllBooks();
  }

  // NOTE: chưa thấy getTag và getAuthor được sử dụng
  Future<void> getAllBooks({
    bool getTags = true,
    bool getAuthors = true,
  }) async {
    List<Book> books = await _repository.getAllNotDeletedBooks();
    _booksFetcher.sink.add(books);

    if (getTags) {
      _tagsFetcher.sink.add(_getTags(books));
    }

    if (getAuthors) {
      _authorsFetcher.sink.add(_getAuthors(books));
    }
  }

  Future<void> removeAllBooks() async {
    await _repository.removeAllBooks();

    await getAllBooks();
    await getAllBooksByStatus();
  }

  Future<void> getAllBooksByStatus() async {
    await getFinishedBooks();
    await getInProgressBooks();
    await getToReadBooks();
    await getUnfinishedBooks();
  }

  Future<void> getFinishedBooks() async {
    List<Book> books = await _repository.getBooks(0);

    _finishedBooksFetcher.sink.add(books);
    _finishedYearsFetcher.sink.add(_getFinishedYears(books));
  }

  Future<void> getInProgressBooks() async {
    List<Book> books = await _repository.getBooks(1);
    _inProgressBooksFetcher.sink.add(books);
  }

  Future<void> getToReadBooks() async {
    List<Book> books = await _repository.getBooks(2);
    _toReadBooksFetcher.sink.add(books);
  }

  Future<void> getDeletedBooks() async {
    List<Book> books = await _repository.getDeletedBooks();
    _deletedBooksFetcher.sink.add(books);
  }

  Future<void> getUnfinishedBooks() async {
    List<Book> books = await _repository.getBooks(3);
    _unfinishedBooksFetcher.sink.add(books);
  }

  // NOTE: đã move qua search book use case
  Future<void> getSearchBooks(String query) async {
    if (query.isEmpty) {
      final books = await _repository.getAllNotDeletedBooks();
      _searchBooksFetcher.sink.add(books);
    } else {
      List<Book> books = await _repository.searchBooks(query);
      _searchBooksFetcher.sink.add(books);
    }
  }

  // NOTE: đã move qua book actor cubit
  Future<int> addBook(
    Book book, {
    bool refreshBooks = true,
    Uint8List? cover,
  }) async {
    debugPrint('[BookCubit] addBook started for book: ${book.title}');
    final bookID = await _repository.insertBook(book);
    debugPrint('[BookCubit] Book inserted with ID: $bookID');

    await _saveCoverToStorage(bookID, cover);
    debugPrint('[BookCubit] Cover saved to storage for book ID: $bookID');

    if (refreshBooks) {
      debugPrint('[BookCubit] Refreshing book lists...');
      getAllBooksByStatus();
      getAllBooks();
      debugPrint('[BookCubit] Book lists refreshed.');
    }
    debugPrint('[BookCubit] addBook finished, returning ID: $bookID');
    return bookID;
  }

  // NOTE: Chưa được sử dụng
  Future<List<int>> importAdditionalBooks(List<Book> books) async {
    final importedBookIDs = List<int>.empty(growable: true);

    for (var book in books) {
      final id = await _repository.insertBook(book);
      importedBookIDs.add(id);
    }

    getAllBooksByStatus();
    getAllBooks();

    return importedBookIDs;
  }

  // NOTE: đã move qua book actor cubit
  Future _saveCoverToStorage(int? bookID, Uint8List? cover) async {
    if (bookID == null || cover == null) return;

    final file = File('${appDocumentsDirectory.path}/$bookID.jpg');
    await file.writeAsBytes(cover);
  }

  // NOTE: đã move qua book actor cubit
  Future<void> updateBook(
    Book book, {
    Uint8List? cover,
    BuildContext? context,
  }) async {
    _repository.updateBook(book);
    await _saveCoverToStorage(book.id!, cover);

    if (context != null) {
      // This looks bad but we need to wait for cover to be saved to storage
      // before updating current book
      context.read<CurrentBookCubit>().setBook(book.copyWith());
    }

    emit(null);

    getBook(book.id!);
    getAllBooksByStatus();
    getAllBooks();
  }

  // NOTE: đã move qua book actor cubit
  Future<void> bulkUpdateBookFormat(Set<int> ids, BookFormat bookFormat) async {
    _repository.bulkUpdateBookFormat(ids, bookFormat);
    getAllBooksByStatus();
    getAllBooks();
  }

  // NOTE: đã move qua book actor cubit
  Future<void> bulkUpdateBookAuthor(Set<int> ids, String author) async {
    _repository.bulkUpdateBookAuthor(ids, author);
    getAllBooksByStatus();
    getAllBooks();
  }

  // NOTE: đã move qua library cubit
  Future<void> deleteBook(int id) async {
    _repository.deleteBook(id);
    getAllBooksByStatus();
    getAllBooks();
  }

  // NOTE: đã move qua library cubit
  Future<Book?> getBook(int id) async {
    Book? book = await _repository.getBook(id);
    _bookFetcher.sink.add(book);

    return book;
  }

  // NOTE: đã move qua library cubit
  List<int> _getFinishedYears(List<Book> books) {
    final yearsSet = <int>{};

    for (final book in books) {
      for (final reading in book.readings) {
        if (reading.finishDate != null) {
          yearsSet.add(reading.finishDate!.year);
        }
      }
    }

    final yearsList = yearsSet.toList();
    yearsList.sort((a, b) => b.compareTo(a));

    return yearsList;
  }

  // NOTE: đã move qua library cubit
  List<String> _getTags(List<Book> books) {
    final tags = List<String>.empty(growable: true);

    for (var book in books) {
      if (book.tags != null) {
        for (var tag in book.tags!.split('|||||')) {
          if (!tags.contains(tag)) {
            tags.add(tag);
          }
        }
      }
    }

    tags.sort((a, b) => a.compareTo(b));

    return tags;
  }

  // NOTE: đã move qua library cubit
  List<String> _getAuthors(List<Book> books) {
    final authors = List<String>.empty(growable: true);

    for (var book in books) {
      if (!authors.contains(book.author)) {
        authors.add(book.author);
      }
    }

    authors.sort((a, b) => a.compareTo(b));

    return authors;
  }

  Future<bool> _checkIfCoverMigrationDone() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? check = prefs.getBool(SharedPreferencesKeys.coverMigrationDone);

    return check == true ? true : false;
  }

  Future<void> _migrateCoversFromDatabaseToStorage() async {
    List<Book> allBooks = await _repository.getAllBooks();

    for (var book in allBooks) {
      if (book.cover != null) {
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/${book.id}.jpg');

        await file.writeAsBytes(book.cover!);

        Book updatedBook = book.copyWithNullCover();
        updatedBook = book.copyWith(hasCover: true);

        await _repository.updateBook(updatedBook);
      }
    }

    await _saveCoverMigrationStatus();
  }

  Future<void> _saveCoverMigrationStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedPreferencesKeys.coverMigrationDone, true);
  }

  // NOTE: hàm này chưa được sử dụng
  Future<void> getBooksWithSameTag(String tag) async {
    _booksWithSameTagFetcher.sink.add(null);

    List<Book> books = await _repository.getBooksWithSameTag(tag);

    _booksWithSameTagFetcher.sink.add(books);
  }

  Future<void> getBooksWithSameAuthor(String author) async {
    _booksWithSameAuthorFetcher.sink.add(null);

    List<Book> books = await _repository.getBooksWithSameAuthor(author);

    _booksWithSameAuthorFetcher.sink.add(books);
  }

  // NOTE: sử dụng khi có book chưa có cover (nhưng đã có mã isbn) - book_editor_screen
  Future<bool> downloadCoverByISBN(Book book) async {
    if (book.isbn == null) return false;
    if (book.isbn!.isEmpty) return false;

    final cover = await getIt<OpenLibraryService>().getCover(book.isbn!);
    if (cover == null) return false;

    final file = File('${appDocumentsDirectory.path}/${book.id}.jpg');
    await file.writeAsBytes(cover);

    final blurHash = await generateBlurHash(cover);

    await bookCubit.updateBook(
      book.copyWith(hasCover: true, blurHash: blurHash),
    );

    return true;
  }
}
