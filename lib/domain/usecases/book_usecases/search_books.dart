import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/entities/book.dart';
import 'package:leafy/domain/repositories/book_repository.dart';

@injectable
class SearchBooks {
  final BookRepository bookRepository;

  SearchBooks(this.bookRepository);

  Future<Either<Failure, List<Book>>> call(String query) async {
    return await bookRepository.searchBooks(query);
  }
}
