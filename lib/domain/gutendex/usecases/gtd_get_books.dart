import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/data/models/gutendex/gtd_books_result/gtd_books_result_model.dart';
import 'package:leafy/domain/gutendex/repositories/gutendex_repository.dart';
import 'package:leafy/domain/gutendex/usecases/gtd_get_books_params.dart';

@injectable
class GtdGetBooksUseCase implements UseCase<GtdBooksResultModel, GtdGetBooksParams> {
  final GutendexRepository gutendexRepository;

  GtdGetBooksUseCase(this.gutendexRepository);

  @override
  Future<Either<Failure, GtdBooksResultModel>> call(GtdGetBooksParams params) {
    return gutendexRepository.getBooks(
      page: params.page,
      authorYearStart: params.authorYearStart,
      authorYearEnd: params.authorYearEnd,
      copyright: params.copyright,
      ids: params.ids,
      languages: params.languages,
      mimeType: params.mimeType,
      search: params.search,
      sort: params.sort,
      topic: params.topic,
    );
  }
}
