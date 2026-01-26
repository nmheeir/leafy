import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/utils/crypto/crypto_utils.dart';
import 'package:leafy/domain/translation/repository/translation_repository.dart';

@lazySingleton
class GenerateChapterSummaryUseCase {
  final TranslationRepository _repository;

  GenerateChapterSummaryUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required String filePath,
    required int chapterIndex,
    required String content,
  }) async {
    try {
      final fileHash = await CryptoUtils.getFileMd5(filePath);

      // Check cache first
      final existingResult = await _repository.getChapterSummary(
        fileHash: fileHash,
        chapterIndex: chapterIndex,
      );

      return existingResult.fold((failure) => Left(failure), (
        summaryModel,
      ) async {
        if (summaryModel != null) {
          return Right(summaryModel.summaryContent);
        }
        // Not found, generate
        return await _repository.generateAndSaveSummary(
          fileHash: fileHash,
          chapterIndex: chapterIndex,
          content: content,
        );
      });
    } catch (e) {
      return Left(Failure.cache('Could not compute file hash: $e'));
    }
  }
}
