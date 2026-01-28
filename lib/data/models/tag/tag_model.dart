import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/core/utils/converters/int_to_bool_converter.dart';
import 'package:leafy/domain/tag/entities/tag.dart';

part 'tag_model.freezed.dart';
part 'tag_model.g.dart';

@freezed
abstract class TagModel with _$TagModel {
  const TagModel._();

  const factory TagModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'color') int? color,
    @JsonKey(name: 'icon') String? icon,
    @JsonKey(name: 'priority') @Default(0) int priority,
    @IntToBoolConverter()
    @JsonKey(name: 'is_system')
    @Default(false)
    bool isSystem,
    @JsonKey(name: 'category') String? category,
    @IntToBoolConverter()
    @JsonKey(name: 'deleted')
    @Default(false)
    bool deleted,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _TagModel;

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);

  factory TagModel.fromEntity(Tag entity) {
    return TagModel(
      id: entity.id,
      name: entity.name,
      color: entity.color,
      icon: entity.icon,
      priority: entity.priority,
      isSystem: entity.isSystem,
      category: entity.category,
      deleted: entity.deleted,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  Tag toEntity() {
    return Tag(
      id: id,
      name: name,
      color: color,
      icon: icon,
      priority: priority,
      isSystem: isSystem,
      category: category,
      deleted: deleted,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
