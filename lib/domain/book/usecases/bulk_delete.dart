import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';

@injectable
class BulkDeleteUseCase implements UseCase<Unit, Set<int>> {
  final BookRepository bookRepository;

  BulkDeleteUseCase(this.bookRepository);

  @override
  Future<Either<Failure, Unit>> call(Set<int> params) async {
    // NOTE: chỉnh lại kiểm tra danh sách đầu vào
    if (params.isEmpty) return Left(Failure.unexpected());

    return await bookRepository.bulkDeleteBooks(params);
  }
}
