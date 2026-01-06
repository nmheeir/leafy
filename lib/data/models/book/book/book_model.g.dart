// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookModel _$BookModelFromJson(Map<String, dynamic> json) => _BookModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String,
  subtitle: json['subtitle'] as String?,
  author: json['author'] as String,
  description: _descriptionFromJson(json['description']),
  bookFormat:
      $enumDecodeNullable(_$BookFormatEnumMap, json['book_type']) ??
      BookFormat.paperback,
  status:
      $enumDecodeNullable(_$BookStatusEnumMap, json['status']) ??
      BookStatus.finished,
  rating: (json['rating'] as num?)?.toInt(),
  favorite: json['favorite'] == null
      ? false
      : const IntToBoolConverter().fromJson((json['favorite'] as num).toInt()),
  deleted: json['deleted'] == null
      ? false
      : const IntToBoolConverter().fromJson((json['deleted'] as num).toInt()),
  startDate: json['start_date'] == null
      ? null
      : DateTime.parse(json['start_date'] as String),
  finishDate: json['finish_date'] == null
      ? null
      : DateTime.parse(json['finish_date'] as String),
  dateAdded: DateTime.parse(json['date_added'] as String),
  dateModified: DateTime.parse(json['date_modified'] as String),
  pages: (json['pages'] as num?)?.toInt(),
  publicationYear: (json['publication_year'] as num?)?.toInt(),
  isbn: json['isbn'] as String?,
  olid: json['olid'] as String?,
  tags: json['tags'] as String?,
  myReview: json['my_review'] as String?,
  notes: json['notes'] as String?,
  hasCover: json['has_cover'] == null
      ? false
      : const IntToBoolConverter().fromJson((json['has_cover'] as num).toInt()),
  blurHash: json['blur_hash'] as String?,
);

Map<String, dynamic> _$BookModelToJson(_BookModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'author': instance.author,
      'description': instance.description,
      'book_type': _$BookFormatEnumMap[instance.bookFormat]!,
      'status': _$BookStatusEnumMap[instance.status]!,
      'rating': instance.rating,
      'favorite': const IntToBoolConverter().toJson(instance.favorite),
      'deleted': const IntToBoolConverter().toJson(instance.deleted),
      'start_date': instance.startDate?.toIso8601String(),
      'finish_date': instance.finishDate?.toIso8601String(),
      'date_added': instance.dateAdded.toIso8601String(),
      'date_modified': instance.dateModified.toIso8601String(),
      'pages': instance.pages,
      'publication_year': instance.publicationYear,
      'isbn': instance.isbn,
      'olid': instance.olid,
      'tags': instance.tags,
      'my_review': instance.myReview,
      'notes': instance.notes,
      'has_cover': const IntToBoolConverter().toJson(instance.hasCover),
      'blur_hash': instance.blurHash,
    };

const _$BookFormatEnumMap = {
  BookFormat.paperback: 'paperback',
  BookFormat.hardcover: 'hardcover',
  BookFormat.ebook: 'ebook',
  BookFormat.audiobook: 'audiobook',
};

const _$BookStatusEnumMap = {
  BookStatus.finished: 'finished',
  BookStatus.inProgress: 'inProgress',
  BookStatus.forLater: 'forLater',
  BookStatus.unfinished: 'unfinished',
};
