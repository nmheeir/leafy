// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookModel {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'title') String get title;@JsonKey(name: 'subtitle') String? get subtitle;@JsonKey(name: 'author') String get author;@JsonKey(fromJson: _descriptionFromJson) String? get description;@JsonKey(name: 'book_type') BookFormat get bookFormat;@JsonKey(name: 'status') BookStatus get status;@JsonKey(name: 'rating') int? get rating;@IntToBoolConverter()@JsonKey(name: 'favorite') bool get favorite;@IntToBoolConverter()@JsonKey(name: 'deleted') bool get deleted;@JsonKey(name: 'start_date') DateTime? get startDate;@JsonKey(name: 'finish_date') DateTime? get finishDate;@JsonKey(name: 'date_added') DateTime get dateAdded;@JsonKey(name: 'date_modified') DateTime get dateModified;@JsonKey(name: 'pages') int? get pages;@JsonKey(name: 'publication_year') int? get publicationYear;@JsonKey(name: 'isbn') String? get isbn;@JsonKey(name: 'olid') String? get olid;@JsonKey(name: 'tags') String? get tags;@JsonKey(name: 'my_review') String? get myReview;@JsonKey(name: 'notes') String? get notes;@IntToBoolConverter()@JsonKey(name: 'has_cover') bool get hasCover;@JsonKey(name: 'blur_hash') String? get blurHash;
/// Create a copy of BookModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookModelCopyWith<BookModel> get copyWith => _$BookModelCopyWithImpl<BookModel>(this as BookModel, _$identity);

  /// Serializes this BookModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.author, author) || other.author == author)&&(identical(other.description, description) || other.description == description)&&(identical(other.bookFormat, bookFormat) || other.bookFormat == bookFormat)&&(identical(other.status, status) || other.status == status)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.finishDate, finishDate) || other.finishDate == finishDate)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.publicationYear, publicationYear) || other.publicationYear == publicationYear)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.olid, olid) || other.olid == olid)&&(identical(other.tags, tags) || other.tags == tags)&&(identical(other.myReview, myReview) || other.myReview == myReview)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.hasCover, hasCover) || other.hasCover == hasCover)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,subtitle,author,description,bookFormat,status,rating,favorite,deleted,startDate,finishDate,dateAdded,dateModified,pages,publicationYear,isbn,olid,tags,myReview,notes,hasCover,blurHash]);

@override
String toString() {
  return 'BookModel(id: $id, title: $title, subtitle: $subtitle, author: $author, description: $description, bookFormat: $bookFormat, status: $status, rating: $rating, favorite: $favorite, deleted: $deleted, startDate: $startDate, finishDate: $finishDate, dateAdded: $dateAdded, dateModified: $dateModified, pages: $pages, publicationYear: $publicationYear, isbn: $isbn, olid: $olid, tags: $tags, myReview: $myReview, notes: $notes, hasCover: $hasCover, blurHash: $blurHash)';
}


}

/// @nodoc
abstract mixin class $BookModelCopyWith<$Res>  {
  factory $BookModelCopyWith(BookModel value, $Res Function(BookModel) _then) = _$BookModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'title') String title,@JsonKey(name: 'subtitle') String? subtitle,@JsonKey(name: 'author') String author,@JsonKey(fromJson: _descriptionFromJson) String? description,@JsonKey(name: 'book_type') BookFormat bookFormat,@JsonKey(name: 'status') BookStatus status,@JsonKey(name: 'rating') int? rating,@IntToBoolConverter()@JsonKey(name: 'favorite') bool favorite,@IntToBoolConverter()@JsonKey(name: 'deleted') bool deleted,@JsonKey(name: 'start_date') DateTime? startDate,@JsonKey(name: 'finish_date') DateTime? finishDate,@JsonKey(name: 'date_added') DateTime dateAdded,@JsonKey(name: 'date_modified') DateTime dateModified,@JsonKey(name: 'pages') int? pages,@JsonKey(name: 'publication_year') int? publicationYear,@JsonKey(name: 'isbn') String? isbn,@JsonKey(name: 'olid') String? olid,@JsonKey(name: 'tags') String? tags,@JsonKey(name: 'my_review') String? myReview,@JsonKey(name: 'notes') String? notes,@IntToBoolConverter()@JsonKey(name: 'has_cover') bool hasCover,@JsonKey(name: 'blur_hash') String? blurHash
});




}
/// @nodoc
class _$BookModelCopyWithImpl<$Res>
    implements $BookModelCopyWith<$Res> {
  _$BookModelCopyWithImpl(this._self, this._then);

  final BookModel _self;
  final $Res Function(BookModel) _then;

/// Create a copy of BookModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? subtitle = freezed,Object? author = null,Object? description = freezed,Object? bookFormat = null,Object? status = null,Object? rating = freezed,Object? favorite = null,Object? deleted = null,Object? startDate = freezed,Object? finishDate = freezed,Object? dateAdded = null,Object? dateModified = null,Object? pages = freezed,Object? publicationYear = freezed,Object? isbn = freezed,Object? olid = freezed,Object? tags = freezed,Object? myReview = freezed,Object? notes = freezed,Object? hasCover = null,Object? blurHash = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,bookFormat: null == bookFormat ? _self.bookFormat : bookFormat // ignore: cast_nullable_to_non_nullable
as BookFormat,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookStatus,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,finishDate: freezed == finishDate ? _self.finishDate : finishDate // ignore: cast_nullable_to_non_nullable
as DateTime?,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime,dateModified: null == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as DateTime,pages: freezed == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int?,publicationYear: freezed == publicationYear ? _self.publicationYear : publicationYear // ignore: cast_nullable_to_non_nullable
as int?,isbn: freezed == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String?,olid: freezed == olid ? _self.olid : olid // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as String?,myReview: freezed == myReview ? _self.myReview : myReview // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,hasCover: null == hasCover ? _self.hasCover : hasCover // ignore: cast_nullable_to_non_nullable
as bool,blurHash: freezed == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookModel].
extension BookModelPatterns on BookModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookModel value)  $default,){
final _that = this;
switch (_that) {
case _BookModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'title')  String title, @JsonKey(name: 'subtitle')  String? subtitle, @JsonKey(name: 'author')  String author, @JsonKey(fromJson: _descriptionFromJson)  String? description, @JsonKey(name: 'book_type')  BookFormat bookFormat, @JsonKey(name: 'status')  BookStatus status, @JsonKey(name: 'rating')  int? rating, @IntToBoolConverter()@JsonKey(name: 'favorite')  bool favorite, @IntToBoolConverter()@JsonKey(name: 'deleted')  bool deleted, @JsonKey(name: 'start_date')  DateTime? startDate, @JsonKey(name: 'finish_date')  DateTime? finishDate, @JsonKey(name: 'date_added')  DateTime dateAdded, @JsonKey(name: 'date_modified')  DateTime dateModified, @JsonKey(name: 'pages')  int? pages, @JsonKey(name: 'publication_year')  int? publicationYear, @JsonKey(name: 'isbn')  String? isbn, @JsonKey(name: 'olid')  String? olid, @JsonKey(name: 'tags')  String? tags, @JsonKey(name: 'my_review')  String? myReview, @JsonKey(name: 'notes')  String? notes, @IntToBoolConverter()@JsonKey(name: 'has_cover')  bool hasCover, @JsonKey(name: 'blur_hash')  String? blurHash)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookModel() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.author,_that.description,_that.bookFormat,_that.status,_that.rating,_that.favorite,_that.deleted,_that.startDate,_that.finishDate,_that.dateAdded,_that.dateModified,_that.pages,_that.publicationYear,_that.isbn,_that.olid,_that.tags,_that.myReview,_that.notes,_that.hasCover,_that.blurHash);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'title')  String title, @JsonKey(name: 'subtitle')  String? subtitle, @JsonKey(name: 'author')  String author, @JsonKey(fromJson: _descriptionFromJson)  String? description, @JsonKey(name: 'book_type')  BookFormat bookFormat, @JsonKey(name: 'status')  BookStatus status, @JsonKey(name: 'rating')  int? rating, @IntToBoolConverter()@JsonKey(name: 'favorite')  bool favorite, @IntToBoolConverter()@JsonKey(name: 'deleted')  bool deleted, @JsonKey(name: 'start_date')  DateTime? startDate, @JsonKey(name: 'finish_date')  DateTime? finishDate, @JsonKey(name: 'date_added')  DateTime dateAdded, @JsonKey(name: 'date_modified')  DateTime dateModified, @JsonKey(name: 'pages')  int? pages, @JsonKey(name: 'publication_year')  int? publicationYear, @JsonKey(name: 'isbn')  String? isbn, @JsonKey(name: 'olid')  String? olid, @JsonKey(name: 'tags')  String? tags, @JsonKey(name: 'my_review')  String? myReview, @JsonKey(name: 'notes')  String? notes, @IntToBoolConverter()@JsonKey(name: 'has_cover')  bool hasCover, @JsonKey(name: 'blur_hash')  String? blurHash)  $default,) {final _that = this;
switch (_that) {
case _BookModel():
return $default(_that.id,_that.title,_that.subtitle,_that.author,_that.description,_that.bookFormat,_that.status,_that.rating,_that.favorite,_that.deleted,_that.startDate,_that.finishDate,_that.dateAdded,_that.dateModified,_that.pages,_that.publicationYear,_that.isbn,_that.olid,_that.tags,_that.myReview,_that.notes,_that.hasCover,_that.blurHash);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'title')  String title, @JsonKey(name: 'subtitle')  String? subtitle, @JsonKey(name: 'author')  String author, @JsonKey(fromJson: _descriptionFromJson)  String? description, @JsonKey(name: 'book_type')  BookFormat bookFormat, @JsonKey(name: 'status')  BookStatus status, @JsonKey(name: 'rating')  int? rating, @IntToBoolConverter()@JsonKey(name: 'favorite')  bool favorite, @IntToBoolConverter()@JsonKey(name: 'deleted')  bool deleted, @JsonKey(name: 'start_date')  DateTime? startDate, @JsonKey(name: 'finish_date')  DateTime? finishDate, @JsonKey(name: 'date_added')  DateTime dateAdded, @JsonKey(name: 'date_modified')  DateTime dateModified, @JsonKey(name: 'pages')  int? pages, @JsonKey(name: 'publication_year')  int? publicationYear, @JsonKey(name: 'isbn')  String? isbn, @JsonKey(name: 'olid')  String? olid, @JsonKey(name: 'tags')  String? tags, @JsonKey(name: 'my_review')  String? myReview, @JsonKey(name: 'notes')  String? notes, @IntToBoolConverter()@JsonKey(name: 'has_cover')  bool hasCover, @JsonKey(name: 'blur_hash')  String? blurHash)?  $default,) {final _that = this;
switch (_that) {
case _BookModel() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.author,_that.description,_that.bookFormat,_that.status,_that.rating,_that.favorite,_that.deleted,_that.startDate,_that.finishDate,_that.dateAdded,_that.dateModified,_that.pages,_that.publicationYear,_that.isbn,_that.olid,_that.tags,_that.myReview,_that.notes,_that.hasCover,_that.blurHash);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookModel extends BookModel {
  const _BookModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'title') required this.title, @JsonKey(name: 'subtitle') this.subtitle, @JsonKey(name: 'author') required this.author, @JsonKey(fromJson: _descriptionFromJson) this.description, @JsonKey(name: 'book_type') this.bookFormat = BookFormat.paperback, @JsonKey(name: 'status') this.status = BookStatus.finished, @JsonKey(name: 'rating') this.rating, @IntToBoolConverter()@JsonKey(name: 'favorite') this.favorite = false, @IntToBoolConverter()@JsonKey(name: 'deleted') this.deleted = false, @JsonKey(name: 'start_date') this.startDate, @JsonKey(name: 'finish_date') this.finishDate, @JsonKey(name: 'date_added') required this.dateAdded, @JsonKey(name: 'date_modified') required this.dateModified, @JsonKey(name: 'pages') this.pages, @JsonKey(name: 'publication_year') this.publicationYear, @JsonKey(name: 'isbn') this.isbn, @JsonKey(name: 'olid') this.olid, @JsonKey(name: 'tags') this.tags, @JsonKey(name: 'my_review') this.myReview, @JsonKey(name: 'notes') this.notes, @IntToBoolConverter()@JsonKey(name: 'has_cover') this.hasCover = false, @JsonKey(name: 'blur_hash') this.blurHash}): super._();
  factory _BookModel.fromJson(Map<String, dynamic> json) => _$BookModelFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'title') final  String title;
@override@JsonKey(name: 'subtitle') final  String? subtitle;
@override@JsonKey(name: 'author') final  String author;
@override@JsonKey(fromJson: _descriptionFromJson) final  String? description;
@override@JsonKey(name: 'book_type') final  BookFormat bookFormat;
@override@JsonKey(name: 'status') final  BookStatus status;
@override@JsonKey(name: 'rating') final  int? rating;
@override@IntToBoolConverter()@JsonKey(name: 'favorite') final  bool favorite;
@override@IntToBoolConverter()@JsonKey(name: 'deleted') final  bool deleted;
@override@JsonKey(name: 'start_date') final  DateTime? startDate;
@override@JsonKey(name: 'finish_date') final  DateTime? finishDate;
@override@JsonKey(name: 'date_added') final  DateTime dateAdded;
@override@JsonKey(name: 'date_modified') final  DateTime dateModified;
@override@JsonKey(name: 'pages') final  int? pages;
@override@JsonKey(name: 'publication_year') final  int? publicationYear;
@override@JsonKey(name: 'isbn') final  String? isbn;
@override@JsonKey(name: 'olid') final  String? olid;
@override@JsonKey(name: 'tags') final  String? tags;
@override@JsonKey(name: 'my_review') final  String? myReview;
@override@JsonKey(name: 'notes') final  String? notes;
@override@IntToBoolConverter()@JsonKey(name: 'has_cover') final  bool hasCover;
@override@JsonKey(name: 'blur_hash') final  String? blurHash;

/// Create a copy of BookModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookModelCopyWith<_BookModel> get copyWith => __$BookModelCopyWithImpl<_BookModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.author, author) || other.author == author)&&(identical(other.description, description) || other.description == description)&&(identical(other.bookFormat, bookFormat) || other.bookFormat == bookFormat)&&(identical(other.status, status) || other.status == status)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.finishDate, finishDate) || other.finishDate == finishDate)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.publicationYear, publicationYear) || other.publicationYear == publicationYear)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.olid, olid) || other.olid == olid)&&(identical(other.tags, tags) || other.tags == tags)&&(identical(other.myReview, myReview) || other.myReview == myReview)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.hasCover, hasCover) || other.hasCover == hasCover)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,subtitle,author,description,bookFormat,status,rating,favorite,deleted,startDate,finishDate,dateAdded,dateModified,pages,publicationYear,isbn,olid,tags,myReview,notes,hasCover,blurHash]);

@override
String toString() {
  return 'BookModel(id: $id, title: $title, subtitle: $subtitle, author: $author, description: $description, bookFormat: $bookFormat, status: $status, rating: $rating, favorite: $favorite, deleted: $deleted, startDate: $startDate, finishDate: $finishDate, dateAdded: $dateAdded, dateModified: $dateModified, pages: $pages, publicationYear: $publicationYear, isbn: $isbn, olid: $olid, tags: $tags, myReview: $myReview, notes: $notes, hasCover: $hasCover, blurHash: $blurHash)';
}


}

/// @nodoc
abstract mixin class _$BookModelCopyWith<$Res> implements $BookModelCopyWith<$Res> {
  factory _$BookModelCopyWith(_BookModel value, $Res Function(_BookModel) _then) = __$BookModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'title') String title,@JsonKey(name: 'subtitle') String? subtitle,@JsonKey(name: 'author') String author,@JsonKey(fromJson: _descriptionFromJson) String? description,@JsonKey(name: 'book_type') BookFormat bookFormat,@JsonKey(name: 'status') BookStatus status,@JsonKey(name: 'rating') int? rating,@IntToBoolConverter()@JsonKey(name: 'favorite') bool favorite,@IntToBoolConverter()@JsonKey(name: 'deleted') bool deleted,@JsonKey(name: 'start_date') DateTime? startDate,@JsonKey(name: 'finish_date') DateTime? finishDate,@JsonKey(name: 'date_added') DateTime dateAdded,@JsonKey(name: 'date_modified') DateTime dateModified,@JsonKey(name: 'pages') int? pages,@JsonKey(name: 'publication_year') int? publicationYear,@JsonKey(name: 'isbn') String? isbn,@JsonKey(name: 'olid') String? olid,@JsonKey(name: 'tags') String? tags,@JsonKey(name: 'my_review') String? myReview,@JsonKey(name: 'notes') String? notes,@IntToBoolConverter()@JsonKey(name: 'has_cover') bool hasCover,@JsonKey(name: 'blur_hash') String? blurHash
});




}
/// @nodoc
class __$BookModelCopyWithImpl<$Res>
    implements _$BookModelCopyWith<$Res> {
  __$BookModelCopyWithImpl(this._self, this._then);

  final _BookModel _self;
  final $Res Function(_BookModel) _then;

/// Create a copy of BookModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? subtitle = freezed,Object? author = null,Object? description = freezed,Object? bookFormat = null,Object? status = null,Object? rating = freezed,Object? favorite = null,Object? deleted = null,Object? startDate = freezed,Object? finishDate = freezed,Object? dateAdded = null,Object? dateModified = null,Object? pages = freezed,Object? publicationYear = freezed,Object? isbn = freezed,Object? olid = freezed,Object? tags = freezed,Object? myReview = freezed,Object? notes = freezed,Object? hasCover = null,Object? blurHash = freezed,}) {
  return _then(_BookModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,bookFormat: null == bookFormat ? _self.bookFormat : bookFormat // ignore: cast_nullable_to_non_nullable
as BookFormat,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookStatus,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,finishDate: freezed == finishDate ? _self.finishDate : finishDate // ignore: cast_nullable_to_non_nullable
as DateTime?,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime,dateModified: null == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as DateTime,pages: freezed == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int?,publicationYear: freezed == publicationYear ? _self.publicationYear : publicationYear // ignore: cast_nullable_to_non_nullable
as int?,isbn: freezed == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String?,olid: freezed == olid ? _self.olid : olid // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as String?,myReview: freezed == myReview ? _self.myReview : myReview // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,hasCover: null == hasCover ? _self.hasCover : hasCover // ignore: cast_nullable_to_non_nullable
as bool,blurHash: freezed == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
