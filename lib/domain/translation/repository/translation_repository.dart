import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/models/translation/translation_model.dart';
import 'package:leafy/data/models/translation/summary_model.dart';
import 'package:leafy/domain/translation/entities/translation_and_summary.dart';
import 'package:leafy/domain/translation/entities/translation_update.dart';

abstract class TranslationRepository {
  /// Tries to get translation from local cache ONLY.
  Future<Either<Failure, TranslationModel?>> getLocalTranslatedChapter({
    required String fileHash,
    required int chapterIndex,
    required String targetLang,
  });

  /// Streams translation from remote updates.
  Stream<Either<Failure, TranslationUpdate>> streamTranslateChapter({
    required String fileHash,
    required int chapterIndex,
    required List<String> originalContent,
    required String targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
  });

  /// NOTE: Gets from cache or remote (keeps existing behavior for compatibility if needed,
  /// but we are moving to streaming).
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

  Future<Either<Failure, TranslationAndSummary>> translateAndSummarizeChapter({
    required String fileHash,
    required int chapterIndex,
    required List<String> originalContent,
    required String targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
  });
}
