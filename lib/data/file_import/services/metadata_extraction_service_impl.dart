import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:image/image.dart' as img;
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:leafy/core/constants/enums/reader_format.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/local/epub_reader_local_datasource.dart';
import 'package:leafy/domain/file_import/entities/processed_file.dart';
import 'package:leafy/domain/file_import/services/metadata_extraction_service.dart';
import 'package:pdfrx/pdfrx.dart';

@LazySingleton(as: MetadataExtractionService)
class MetadataExtractionServiceImpl implements MetadataExtractionService {
  final EpubReaderLocalDataSource _epubDataSource;

  MetadataExtractionServiceImpl(this._epubDataSource);

  @override
  Future<Either<Failure, FileMetadata>> extractMetadata({
    required ProcessedFile file,
    required BookResourceFormat format,
  }) async {
    try {
      switch (format) {
        case BookResourceFormat.epub:
          return _extractEpub(file.savedPath);
        case BookResourceFormat.pdf:
          return _extractPdf(file.savedPath);
        case BookResourceFormat.audio:
          return _extractAudio(file.savedPath);
        default:
          return const Right(FileMetadata());
      }
    } catch (e) {
      return Left(Failure.parse('Failed to extract metadata: ${e.toString()}'));
    }
  }

  Future<Either<Failure, FileMetadata>> _extractEpub(String path) async {
    try {
      final epubBook = await _epubDataSource.parseEpub(path);
      return Right(
        FileMetadata(
          title: epubBook.title,
          author: epubBook.author,
          coverBytes: epubBook.coverImage,
        ),
      );
    } catch (e) {
      return Left(Failure.parse(e.toString()));
    }
  }

  Future<Either<Failure, FileMetadata>> _extractPdf(String path) async {
    try {
      final doc = await PdfDocument.openFile(path);
      final pageCount = doc.pages.length;

      Uint8List? coverBytes;
      if (pageCount > 0) {
        final page = doc.pages[0];
        final width = 500;
        final height = (width * page.height / page.width).toInt();

        final pageImage = await page.render(width: width, height: height);

        if (pageImage != null) {
          final image = img.Image.fromBytes(
            width: width,
            height: height,
            bytes: pageImage.pixels.buffer,
            order: img.ChannelOrder.rgba,
            numChannels: 4,
          );

          final pngBytes = img.encodePng(image);
          coverBytes = Uint8List.fromList(pngBytes);
        }
      }

      return Right(FileMetadata(pages: pageCount, coverBytes: coverBytes));
    } catch (e) {
      return Left(Failure.parse(e.toString()));
    }
  }

  Future<Either<Failure, FileMetadata>> _extractAudio(String path) async {
    final player = AudioPlayer();
    try {
      final duration = await player.setFilePath(path);
      return Right(FileMetadata(durationSeconds: duration?.inSeconds));
    } catch (e) {
      return Left(Failure.parse(e.toString()));
    } finally {
      await player.dispose();
    }
  }
}
