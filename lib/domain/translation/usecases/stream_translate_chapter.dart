import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/translation/entities/translation_update.dart';
import 'package:leafy/domain/translation/repository/translation_repository.dart';
import 'package:logger/logger.dart';
// import 'package:leafy/domain/translation/usecases/generate_chapter_summary.dart';

@injectable
class StreamTranslateChapterUseCase {
  final TranslationRepository _repository;
  final Logger _logger;

  StreamTranslateChapterUseCase(this._repository, this._logger);

  Stream<Either<Failure, TranslationUpdate>> call({
    required String filePath,
    required String fileHash,
    required int chapterIndex,
    required List<String> originalContent,
    String targetLang = 'vi',
    required String bookTitle,
    String? author,
    String? bookSummary,
  }) async* {
    // 1. Check local cache
    final localResult = await _repository.getLocalTranslatedChapter(
      fileHash: fileHash,
      chapterIndex: chapterIndex,
      targetLang: targetLang,
    );

    final localModel = localResult.toOption().toNullable();

    if (localModel != null) {
      // Yield cached paragraphs
      for (final entry in localModel.translatedContent.entries) {
        yield Right(TranslationUpdateData(id: entry.key, text: entry.value));
      }

      // Trigger summary check
      _checkAndGenerateSummary(
        fileHash: fileHash,
        chapterIndex: chapterIndex,
        originalContent: originalContent,
      );
      return;
    }

    // 2. Stream from remote
    yield* _repository.streamTranslateChapter(
      fileHash: fileHash,
      chapterIndex: chapterIndex,
      originalContent: originalContent,
      targetLang: targetLang,
      bookTitle: bookTitle,
      author: author,
      bookSummary: bookSummary,
    );
  }

  Future<void> _checkAndGenerateSummary({
    required String fileHash,
    required int chapterIndex,
    required List<String> originalContent,
  }) async {
    final result = await _repository.getChapterSummary(
      fileHash: fileHash,
      chapterIndex: chapterIndex,
    );

    result.fold(
      (failure) {
        _logger.e('Failed to get summary', error: failure);
      },
      (summary) async {
        if (summary == null) {
          final content = originalContent.join('\n');
          await _repository.generateAndSaveSummary(
            fileHash: fileHash,
            chapterIndex: chapterIndex,
            content: content,
          );
        }
      },
    );
  }
}
