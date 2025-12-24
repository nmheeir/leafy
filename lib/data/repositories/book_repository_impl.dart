import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/remote/ol_remote_data_source.dart';
import 'package:leafy/domain/entities/book.dart';
import 'package:leafy/domain/repositories/book_repository.dart';

@LazySingleton(as: BookRepository)
class BookRepositoryImpl implements BookRepository {
  final OlRemoteDataSource olRemoteDataSource;

  BookRepositoryImpl(this.olRemoteDataSource);
  
  @override
  Future<Either<Failure, List<Book>>> getAllBooks() {
    // TODO: implement getAllBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> getAllNotDeletedBooks() {
    // TODO: implement getAllNotDeletedBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> getBooksByStatus(int status) {
    // TODO: implement getBooksByStatus
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> getDeletedBooks() {
    // TODO: implement getDeletedBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> searchBooks(String query) {
    // TODO: implement searchBooks
    throw UnimplementedError();
  }
}
