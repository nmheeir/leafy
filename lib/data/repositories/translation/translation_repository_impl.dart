import 'package:fpdart/fpdart.dart';
import 'package:googleai_dart/googleai_dart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/translation_language.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/local/translation_local_datasource.dart';
import 'package:leafy/data/datasources/remote/translation_remote_datasource.dart';
import 'package:leafy/data/models/translation/summary_model.dart';
import 'package:leafy/data/models/translation/translation_model.dart';
import 'package:leafy/domain/translation/entities/translation_and_summary.dart';
import 'package:leafy/domain/translation/entities/translation_update.dart';
import 'package:leafy/domain/translation/repository/translation_repository.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: TranslationRepository)
class TranslationRepositoryImpl implements TranslationRepository {
  final TranslationLocalDataSource _localDataSource;
  final TranslationRemoteDataSource _remoteDataSource;
  final Logger _logger;

  TranslationRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
    this._logger,
  );

  @override
  Future<Either<Failure, TranslationModel?>> getLocalTranslatedChapter({
    required String fileHash,
    required int chapterIndex,
    required TranslationLanguage targetLang,
  }) async {
    try {
      final local = await _localDataSource.getTranslation(
        fileHash,
        chapterIndex,
        targetLang,
      );
      return Right(local);
    } catch (e) {
      return Left(Failure.cache(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, TranslationUpdate>> streamTranslateChapter({
    required String fileHash,
    required int chapterIndex,
    required List<String> originalContent,
    required TranslationLanguage targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
  }) async* {
    try {
      // 1. Prepare context for better translation
      final contextSummaries = await _localDataSource.getSummaries(
        fileHash,
        (chapterIndex - 5).clamp(1, chapterIndex),
        chapterIndex - 1,
      );
      final contextString = contextSummaries
          .map((s) => s.summaryContent)
          .join('\n');

      // 2. Stream from remote
      final Stream<TranslationUpdate> remoteStream = _remoteDataSource
          .streamTranslateChapter(
            originalParagraphs: originalContent,
            context: contextString,
            targetLang: targetLang,
            bookTitle: bookTitle,
            author: author,
            bookSummary: bookSummary,
          );

      // Accumulator to save full result at the end
      final Map<String, String> accumulatedTranslation = {};

      await for (final update in remoteStream) {
        if (update is TranslationUpdateData) {
          accumulatedTranslation[update.id] = update.text;
          yield Right(update);
        } else if (update is TranslationUpdateSummary) {
          _logger.d('TranslationUpdateSummary: $update');
          // Save summary immediately when received
          await _localDataSource.saveSummary(
            SummaryModel(
              fileHash: fileHash,
              chapterIndex: chapterIndex,
              summaryContent: update.summary,
              lastUpdated: DateTime.now().millisecondsSinceEpoch,
            ),
          );
          yield Right(update);
        }
      }

      _logger.d('AccumeulatdTranslation: ${accumulatedTranslation.toString()}');

      // 3. Save accumulated translation to local DB
      if (accumulatedTranslation.isNotEmpty) {
        final newTranslation = TranslationModel(
          fileHash: fileHash,
          chapterIndex: chapterIndex,
          targetLang: targetLang,
          translatedContent: accumulatedTranslation,
          lastUpdated: DateTime.now(),
        );
        _logger.i(newTranslation.toJson());
        await _localDataSource.saveTranslation(newTranslation);
      }
    } catch (e, st) {
      _logger.e('Error: $e\nStackTrace: $st');
      yield Left(Failure.server(e.toString()));
    }
  }

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
    required TranslationLanguage targetLang,
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
        lastUpdated: DateTime.now(),
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

  @override
  Future<Either<Failure, TranslationAndSummary>> translateAndSummarizeChapter({
    required String fileHash,
    required int chapterIndex,
    required List<String> originalContent,
    required TranslationLanguage targetLang,
    required String bookTitle,
    String? author,
    String? bookSummary,
  }) async {
    try {
      // 1. Check cache
      final localTranslation = await _localDataSource.getTranslation(
        fileHash,
        chapterIndex,
        targetLang,
      );
      final localSummaries = await _localDataSource.getSummaries(
        fileHash,
        chapterIndex,
        chapterIndex,
      );
      final localSummary = localSummaries.isNotEmpty
          ? localSummaries.first
          : null;

      if (localTranslation != null && localSummary != null) {
        return Right(
          TranslationAndSummary(
            translation: localTranslation,
            summary: localSummary,
          ),
        );
      }

      // 2. Prepare context
      final contextSummaries = await _localDataSource.getSummaries(
        fileHash,
        (chapterIndex - 5).clamp(1, chapterIndex),
        chapterIndex - 1,
      );
      final contextString = contextSummaries
          .map((s) => s.summaryContent)
          .join('\n');

      // 3. Call Remote
      final result = await _remoteDataSource.translateAndSummarizeChapter(
        originalParagraphs: originalContent,
        context: contextString,
        targetLang: targetLang,
        bookTitle: bookTitle,
        author: author,
        bookSummary: bookSummary,
      );

      // 4. Save results
      final newTranslation = TranslationModel(
        fileHash: fileHash,
        chapterIndex: chapterIndex,
        targetLang: targetLang,
        translatedContent: result.translation,
        lastUpdated: DateTime.now(),
      );

      final newSummary = SummaryModel(
        fileHash: fileHash,
        chapterIndex: chapterIndex,
        summaryContent: result.summary,
        lastUpdated: DateTime.now().millisecondsSinceEpoch,
      );

      await _localDataSource.saveTranslation(newTranslation);
      await _localDataSource.saveSummary(newSummary);

      return Right(
        TranslationAndSummary(translation: newTranslation, summary: newSummary),
      );
    } on RateLimitException catch (e) {
      return Left(Failure.rateLimit(e.toString()));
    } on Exception catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
