// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookTagModel _$BookTagModelFromJson(Map<String, dynamic> json) =>
    _BookTagModel(
      id: (json['id'] as num?)?.toInt(),
      bookId: (json['book_id'] as num).toInt(),
      tagId: (json['tag_id'] as num).toInt(),
      orderIndex: (json['order_index'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$BookTagModelToJson(_BookTagModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'book_id': instance.bookId,
      'tag_id': instance.tagId,
      'order_index': instance.orderIndex,
      'created_at': instance.createdAt.toIso8601String(),
    };
