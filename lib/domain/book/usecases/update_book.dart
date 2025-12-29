import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';
import 'package:leafy/domain/book/usecases/params/update_book_param.dart';

@injectable
class UpdateBookUseCase implements UseCase<Unit, UpdateBookParams> {
  final BookRepository bookRepository;

  UpdateBookUseCase(this.bookRepository);

  // NOTE: sau này có thể thêm bussiness logic vào trong các use case
  @override
  Future<Either<Failure, Unit>> call(UpdateBookParams params) async {
    return await bookRepository.updateBook(params);
  }
}
