import 'package:equatable/equatable.dart';
import 'package:leafy/core/constants/enums/reader_format.dart';

class AddBookResourceParams extends Equatable {
  final int bookId;
  final String uuid;
  final BookResourceFormat format;
  final String filePath;
  final String? fileHash;
  final int? fileSize;
  final String? language;

  const AddBookResourceParams({
    required this.bookId,
    required this.uuid,
    required this.format,
    required this.filePath,
    this.fileHash,
    this.fileSize,
    this.language,
  });

  @override
  List<Object?> get props => [
    bookId,
    uuid,
    format,
    filePath,
    fileHash,
    fileSize,
    language,
  ];
}
