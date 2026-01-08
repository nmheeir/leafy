import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/gutendex/entities/gtd_book.dart';
import 'package:leafy/domain/gutendex/repositories/gutendex_repository.dart';

@injectable
class GtdGetBookUseCase implements UseCase<GtdBook, int> {
  final GutendexRepository gutendexRepository;

  GtdGetBookUseCase(this.gutendexRepository);

  @override
  Future<Either<Failure, GtdBook>> call(int id) async {
    return await gutendexRepository.getBook(id: id);
  }
}
