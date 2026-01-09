import 'package:equatable/equatable.dart';
import 'package:leafy/core/constants/enums/reader_format.dart';
import 'package:leafy/core/constants/enums/storage_type.dart';

class BookResource extends Equatable {
  final String uuid; // ID ổn định cho UI / deep link
  final BookResourceFormat format; // epub / pdf / html
  final String? filePath; // mở file
  final int? fileSize;
  final String? language;
  final DateTime? createdAt;
  final StorageType storageType;
  final String? url;

  const BookResource({
    required this.uuid,
    required this.format,
    this.filePath,
    this.fileSize,
    this.language,
    this.createdAt,
    this.storageType = StorageType.local,
    this.url,
  });

  @override
  List<Object?> get props => [uuid, format, filePath];
}
