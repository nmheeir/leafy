import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';

@injectable
class RestoreBookUseCase implements UseCase<Book, int> {
  final BookRepository bookRepository;

  RestoreBookUseCase(this.bookRepository);

  @override
  Future<Either<Failure, Book>> call(int params) async {
    return await bookRepository.restoreBook(params);
  }
}
