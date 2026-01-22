import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/translation/entities/translation_and_summary.dart';
import 'package:leafy/domain/translation/repository/translation_repository.dart';

@injectable
class TranslateAndSummarizeChapterUseCase
    implements
        UseCase<TranslationAndSummary, TranslateAndSummarizeChapterParams> {
  final TranslationRepository _repository;

  TranslateAndSummarizeChapterUseCase(this._repository);

  @override
  Future<Either<Failure, TranslationAndSummary>> call(
    TranslateAndSummarizeChapterParams params,
  ) {
    return _repository.translateAndSummarizeChapter(
      fileHash: params.fileHash,
      chapterIndex: params.chapterIndex,
      originalContent: params.originalContent,
      targetLang: params.targetLang,
      bookTitle: params.bookTitle,
      author: params.author,
      bookSummary: params.bookSummary,
    );
  }
}

class TranslateAndSummarizeChapterParams {
  final String fileHash;
  final int chapterIndex;
  final List<String> originalContent;
  final String targetLang;
  final String bookTitle;
  final String? author;
  final String? bookSummary;

  TranslateAndSummarizeChapterParams({
    required this.fileHash,
    required this.chapterIndex,
    required this.originalContent,
    required this.targetLang,
    required this.bookTitle,
    this.author,
    this.bookSummary,
  });
}
