import 'package:equatable/equatable.dart';
import 'package:leafy/core/constants/enums/reader_format.dart';
import 'package:leafy/core/constants/enums/storage_type.dart';

class AddBookResourceParams extends Equatable {
  final int bookId;
  final String uuid;
  final BookResourceFormat format;
  final String filePath;
  final String? fileHash;
  final int? fileSize;
  final String? language;
  final StorageType storageType;
  final String? url;

  const AddBookResourceParams({
    required this.bookId,
    required this.uuid,
    required this.format,
    required this.filePath,
    required this.storageType,
    this.fileHash,
    this.fileSize,
    this.language,
    this.url,
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
    storageType,
    url,
  ];
}
