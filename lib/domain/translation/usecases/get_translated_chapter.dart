import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
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
    String targetLang = 'vi',
  }) async {
    // 1. Compute File Hash from filePath (or file content if needed, but path usually implies file identity in this app scope)
    // Actually, strictly speaking, fileHash should be MD5 of file content.
    // For now, let's assume we can compute it here or it's passed.
    // Ideally, the Helper or Cubit computes it once.
    // Let's assume we compute MD5 of the file path + modification time or content?
    // The requirement said "MD5 of file EPUB".
    // Let's assume CryptoUtils.getFileMd5(filePath) exists or we implement it.

    // For optimization, maybe we just use the simple hash of the path if deep hashing is too expensive every time.
    // But requirement was MD5.
    // Let's try to calculate it here.

    try {
      final fileHash = await CryptoUtils.getFileMd5(filePath);

      return await _repository.getTranslatedChapter(
        fileHash: fileHash,
        chapterIndex: chapterIndex,
        originalContent: originalContent,
        targetLang: targetLang,
      );
    } catch (e) {
      return Left(Failure.cache('Could not compute file hash: $e'));
    }
  }
}
