import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/models/translation/translation_model.dart';
import 'package:leafy/data/models/translation/summary_model.dart';

abstract class TranslationRepository {
  Future<Either<Failure, TranslationModel>> getTranslatedChapter({
    required String fileHash,
    required int chapterIndex,
    required List<String> originalContent,
    required String targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
  });

  Future<Either<Failure, SummaryModel?>> getChapterSummary({
    required String fileHash,
    required int chapterIndex,
  });

  Future<Either<Failure, List<SummaryModel>>> getContextSummaries({
    required String fileHash,
    required int currentChapterIndex,
    required int windowSize,
  });

  Future<Either<Failure, String>> generateAndSaveSummary({
    required String fileHash,
    required int chapterIndex,
    required String content,
  });

  Future<Either<Failure, void>> saveSummary({
    required String fileHash,
    required int chapterIndex,
    required String content,
  });
}
