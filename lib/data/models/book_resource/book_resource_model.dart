import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/core/constants/enums/reader_format.dart';
import 'package:leafy/core/constants/enums/storage_type.dart';
import 'package:leafy/core/utils/converters/book_resource_format_converter.dart';
import 'package:leafy/core/utils/converters/int_to_datetime_coverter.dart';
import 'package:leafy/core/utils/converters/storage_type_converter.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';

part 'book_resource_model.freezed.dart';
part 'book_resource_model.g.dart';

@freezed
abstract class BookResourceModel with _$BookResourceModel {
  const factory BookResourceModel({
    int? id,
    required String uuid,

    @JsonKey(name: 'book_id') required int bookId,

    @BookResourceFormatConverter() required BookResourceFormat format,

    @JsonKey(name: 'storage_type')
    @StorageTypeConverter()
    required StorageType storageType,

    String? url,

    @JsonKey(name: 'file_path') String? filePath,

    @JsonKey(name: 'file_hash') String? fileHash,

    @JsonKey(name: 'file_size') int? fileSize,

    String? language,

    @JsonKey(name: 'created_at') @IntToDatetimeCoverter() DateTime? createdAt,
  }) = _BookResourceModel;

  factory BookResourceModel.fromJson(Map<String, dynamic> json) =>
      _$BookResourceModelFromJson(json);

  const BookResourceModel._();

  BookResource toEntity() {
    return BookResource(
      id: id,
      uuid: uuid,
      format: format,
      filePath: filePath,
      fileSize: fileSize,
      language: language,
      createdAt: createdAt,
      storageType: storageType,
      url: url,
    );
  }
}
