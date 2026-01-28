// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TagModel _$TagModelFromJson(Map<String, dynamic> json) => _TagModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  color: (json['color'] as num?)?.toInt(),
  icon: json['icon'] as String?,
  priority: (json['priority'] as num?)?.toInt() ?? 0,
  isSystem: json['is_system'] == null
      ? false
      : const IntToBoolConverter().fromJson((json['is_system'] as num).toInt()),
  category: json['category'] as String?,
  deleted: json['deleted'] == null
      ? false
      : const IntToBoolConverter().fromJson((json['deleted'] as num).toInt()),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$TagModelToJson(_TagModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'color': instance.color,
  'icon': instance.icon,
  'priority': instance.priority,
  'is_system': const IntToBoolConverter().toJson(instance.isSystem),
  'category': instance.category,
  'deleted': const IntToBoolConverter().toJson(instance.deleted),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
