import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/domain/tag/entities/book_tag.dart';

part 'book_tag_model.freezed.dart';
part 'book_tag_model.g.dart';

@freezed
abstract class BookTagModel with _$BookTagModel {
  const BookTagModel._();

  const factory BookTagModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'book_id') required int bookId,
    @JsonKey(name: 'tag_id') required int tagId,
    @JsonKey(name: 'order_index') @Default(0) int orderIndex,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _BookTagModel;

  factory BookTagModel.fromJson(Map<String, dynamic> json) =>
      _$BookTagModelFromJson(json);

  factory BookTagModel.fromEntity(BookTag entity) {
    return BookTagModel(
      id: entity.id,
      bookId: entity.bookId,
      tagId: entity.tagId,
      orderIndex: entity.orderIndex,
      createdAt: entity.createdAt,
    );
  }

  BookTag toEntity() {
    return BookTag(
      id: id,
      bookId: bookId,
      tagId: tagId,
      orderIndex: orderIndex,
      createdAt: createdAt,
    );
  }
}
