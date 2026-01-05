import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';

@injectable
class SearchBooksUseCase implements UseCase<List<Book>, String> {
  final BookRepository bookRepository;

  SearchBooksUseCase(this.bookRepository);

  @override
  Future<Either<Failure, List<Book>>> call(String query) async {
    if (query.trim().isEmpty) {
      return const Right([]);
    }
    return await bookRepository.searchBooks(query);
  }
}
