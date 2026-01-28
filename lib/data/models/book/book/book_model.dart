import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/core/utils/converters/int_to_bool_converter.dart';
import 'package:leafy/domain/book/entities/book.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
abstract class BookModel with _$BookModel {
  const BookModel._();

  const factory BookModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'subtitle') String? subtitle,
    @JsonKey(name: 'author') required String author,
    @JsonKey(fromJson: _descriptionFromJson) String? description,

    @JsonKey(name: 'book_format')
    @Default(BookFormat.paperback)
    BookFormat bookFormat,

    @JsonKey(name: 'status') @Default(BookStatus.finished) BookStatus status,

    @JsonKey(name: 'rating') int? rating,

    @IntToBoolConverter()
    @JsonKey(name: 'favorite')
    @Default(false)
    bool favorite,

    @IntToBoolConverter()
    @JsonKey(name: 'deleted')
    @Default(false)
    bool deleted,

    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'finish_date') DateTime? finishDate,
    @JsonKey(name: 'date_added') required DateTime dateAdded,
    @JsonKey(name: 'date_modified') required DateTime dateModified,

    @JsonKey(name: 'pages') int? pages,
    @JsonKey(name: 'publication_year') int? publicationYear,
    @JsonKey(name: 'tags') String? tags,
    @JsonKey(name: 'my_review') String? myReview,
    @JsonKey(name: 'notes') String? notes,

    @IntToBoolConverter()
    @JsonKey(name: 'has_cover')
    @Default(false)
    bool hasCover,

    @JsonKey(name: 'blur_hash') String? blurHash,
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  factory BookModel.fromEntity(Book entity) {
    return BookModel(
      title: entity.title,
      author: entity.author,
      dateAdded: entity.dateAdded,
      dateModified: entity.dateModified,
      blurHash: entity.blurHash,
      bookFormat: entity.bookFormat,
      deleted: entity.deleted,
      description: entity.description,
      favorite: entity.favorite,
      hasCover: entity.hasCover,
      id: entity.id,
      myReview: entity.myReview,
      notes: entity.notes,
      pages: entity.pages,
      publicationYear: entity.publicationYear,
      rating: entity.rating,
      status: entity.status,
      subtitle: entity.subtitle,
      tags: entity.tags,
      startDate: entity.startDate,
      finishDate: entity.finishDate,
    );
  }

  Book toEntity() {
    return Book(
      id: id,
      title: title,
      subtitle: subtitle,
      author: author,
      description: description,
      status: status,
      favorite: favorite,
      deleted: deleted,
      rating: rating,
      pages: pages,
      publicationYear: publicationYear,
      tags: tags,
      myReview: myReview,
      notes: notes,
      blurHash: blurHash,
      bookFormat: bookFormat,
      hasCover: hasCover,
      dateAdded: dateAdded,
      dateModified: dateModified,
      startDate: startDate,
      finishDate: finishDate,
    );
  }
}

String? _descriptionFromJson(dynamic json) {
  if (json == null) return null;
  // Trường hợp 1: Trả về String trực tiếp
  if (json is String) return json;
  // Trường hợp 2: Trả về Map (Object) -> lấy value
  if (json is Map<String, dynamic>) {
    return json['value'] as String?;
  }
  return null;
}
