import 'package:fpdart/fpdart.dart';
import 'package:googleai_dart/googleai_dart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/local/translation_local_datasource.dart';
import 'package:leafy/data/datasources/remote/translation_remote_datasource.dart';
import 'package:leafy/data/models/translation/summary_model.dart';
import 'package:leafy/data/models/translation/translation_model.dart';
import 'package:leafy/domain/translation/repository/translation_repository.dart';

@LazySingleton(as: TranslationRepository)
class TranslationRepositoryImpl implements TranslationRepository {
  final TranslationLocalDataSource _localDataSource;
  final TranslationRemoteDataSource _remoteDataSource;

  TranslationRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<Either<Failure, SummaryModel?>> getChapterSummary({
    required String fileHash,
    required int chapterIndex,
  }) async {
    try {
      final summaries = await _localDataSource.getSummaries(
        fileHash,
        chapterIndex,
        chapterIndex,
      );
      if (summaries.isNotEmpty) {
        return Right(summaries.first);
      }
      return const Right(null);
    } catch (e) {
      return Left(Failure.cache(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TranslationModel>> getTranslatedChapter({
    required String fileHash,
    required int chapterIndex,
    required List<String> originalContent,
    required String targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
  }) async {
    try {
      final local = await _localDataSource.getTranslation(
        fileHash,
        chapterIndex,
        targetLang,
      );

      if (local != null) {
        return Right(local);
      }

      final contextSummaries = await _localDataSource.getSummaries(
        fileHash,
        (chapterIndex - 5).clamp(1, chapterIndex),
        chapterIndex - 1,
      );
      final contextString = contextSummaries
          .map((s) => s.summaryContent)
          .join('\n');

      final translatedMap = await _remoteDataSource.translateChapter(
        originalParagraphs: originalContent,
        context: contextString,
        targetLang: targetLang,
        bookTitle: bookTitle,
        author: author,
        bookSummary: bookSummary,
      );

      final newTranslation = TranslationModel(
        fileHash: fileHash,
        chapterIndex: chapterIndex,
        targetLang: targetLang,
        translatedContent: translatedMap,
        lastUpdated: DateTime.now().millisecondsSinceEpoch,
      );

      await _localDataSource.saveTranslation(newTranslation);

      return Right(newTranslation);
    } on RateLimitException catch (e) {
      return Left(Failure.rateLimit(e.toString()));
    } on Exception catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SummaryModel>>> getContextSummaries({
    required String fileHash,
    required int currentChapterIndex,
    required int windowSize,
  }) async {
    try {
      final start = (currentChapterIndex - windowSize).clamp(
        1,
        currentChapterIndex,
      );
      final end = currentChapterIndex - 1;

      if (start > end) return const Right([]);

      final summaries = await _localDataSource.getSummaries(
        fileHash,
        start,
        end,
      );
      return Right(summaries);
    } on RateLimitException catch (e) {
      return Left(Failure.rateLimit(e.toString()));
    } on Exception catch (e) {
      return Left(Failure.cache(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> generateAndSaveSummary({
    required String fileHash,
    required int chapterIndex,
    required String content,
  }) async {
    try {
      final summary = await _remoteDataSource.summarizeContent(
        content: content,
      );

      await saveSummary(
        fileHash: fileHash,
        chapterIndex: chapterIndex,
        content: summary,
      );

      return Right(summary);
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveSummary({
    required String fileHash,
    required int chapterIndex,
    required String content,
  }) async {
    try {
      await _localDataSource.saveSummary(
        SummaryModel(
          fileHash: fileHash,
          chapterIndex: chapterIndex,
          summaryContent: content,
          lastUpdated: DateTime.now().millisecondsSinceEpoch,
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(Failure.cache(e.toString()));
    }
  }
}
