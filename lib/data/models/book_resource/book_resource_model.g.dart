// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_resource_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookResourceModel _$BookResourceModelFromJson(Map<String, dynamic> json) =>
    _BookResourceModel(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String,
      bookId: (json['book_id'] as num).toInt(),
      format: const BookResourceFormatConverter().fromJson(
        json['format'] as String,
      ),
      storageType: const StorageTypeConverter().fromJson(
        json['storage_type'] as String,
      ),
      url: json['url'] as String?,
      filePath: json['file_path'] as String?,
      fileHash: json['file_hash'] as String?,
      fileSize: (json['file_size'] as num?)?.toInt(),
      language: json['language'] as String?,
      createdAt: const IntToDatetimeCoverter().fromJson(
        (json['created_at'] as num?)?.toInt(),
      ),
    );

Map<String, dynamic> _$BookResourceModelToJson(_BookResourceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'book_id': instance.bookId,
      'format': const BookResourceFormatConverter().toJson(instance.format),
      'storage_type': const StorageTypeConverter().toJson(instance.storageType),
      'url': instance.url,
      'file_path': instance.filePath,
      'file_hash': instance.fileHash,
      'file_size': instance.fileSize,
      'language': instance.language,
      'created_at': const IntToDatetimeCoverter().toJson(instance.createdAt),
    };
