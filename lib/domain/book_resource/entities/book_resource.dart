import 'package:equatable/equatable.dart';
import 'package:leafy/core/constants/enums/reader_format.dart';
import 'package:leafy/core/constants/enums/storage_type.dart';

class BookResource extends Equatable {
  final int? id; // ID nội bộ
  final int bookId; // ID sách
  final String uuid; // ID ổn định cho UI / deep link
  final BookResourceFormat format; // epub / pdf / html
  final String? filePath; // mở file
  final int? fileSize;
  final String? language;
  final DateTime? createdAt;
  final StorageType storageType;
  final String? url;

  const BookResource({
    this.id,
    required this.bookId,
    required this.uuid,
    required this.format,
    this.filePath,
    this.fileSize,
    this.language,
    this.createdAt,
    this.storageType = StorageType.local,
    this.url,
    this.readProgress,
  });

  final double? readProgress;

  BookResource copyWith({
    int? id,
    int? bookId,
    String? uuid,
    BookResourceFormat? format,
    String? filePath,
    int? fileSize,
    String? language,
    DateTime? createdAt,
    StorageType? storageType,
    String? url,
    double? readProgress,
  }) {
    return BookResource(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      uuid: uuid ?? this.uuid,
      format: format ?? this.format,
      filePath: filePath ?? this.filePath,
      fileSize: fileSize ?? this.fileSize,
      language: language ?? this.language,
      createdAt: createdAt ?? this.createdAt,
      storageType: storageType ?? this.storageType,
      url: url ?? this.url,
      readProgress: readProgress ?? this.readProgress,
    );
  }

  @override
  List<Object?> get props => [id, bookId, uuid, format, filePath, readProgress];
}
