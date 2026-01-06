import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';
import 'package:leafy/domain/book/usecases/params/add_book_usecase_param.dart';

@injectable
class AddBookUseCase implements UseCase<Book, AddBookParams> {
  final BookRepository _bookRepository;

  const AddBookUseCase(this._bookRepository);

  @override
  Future<Either<Failure, Book>> call(AddBookParams params) async {
    return _bookRepository.addBook(params);
  }
}
