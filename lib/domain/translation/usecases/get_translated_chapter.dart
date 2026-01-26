import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/translation_language.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/utils/crypto/crypto_utils.dart';
import 'package:leafy/data/models/translation/translation_model.dart';
import 'package:leafy/domain/translation/repository/translation_repository.dart';

@lazySingleton
class GetTranslatedChapterUseCase {
  final TranslationRepository _repository;

  GetTranslatedChapterUseCase(this._repository);

  Future<Either<Failure, TranslationModel>> call({
    required String filePath, // needed to compute hash
    required int chapterIndex,
    required List<String> originalContent,
    required String bookTitle,
    String? author,
    String? bookSummary,
    TranslationLanguage targetLang = TranslationLanguage.vietnamese,
  }) async {
    try {
      final fileHash = await CryptoUtils.getFileMd5(filePath);

      return await _repository.getTranslatedChapter(
        fileHash: fileHash,
        chapterIndex: chapterIndex,
        originalContent: originalContent,
        targetLang: targetLang,
        bookTitle: bookTitle,
        author: author,
        bookSummary: bookSummary,
      );
    } catch (e) {
      return Left(Failure.cache('Could not compute file hash: $e'));
    }
  }
}
