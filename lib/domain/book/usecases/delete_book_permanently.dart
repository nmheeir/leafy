import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';

@injectable
class DeleteBookPermanentlyUseCase implements UseCase<Unit, int> {
  final BookRepository _repository;

  DeleteBookPermanentlyUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(int params) async {
    return _repository.deleteBook(params);
  }
}
