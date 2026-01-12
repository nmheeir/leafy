// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_resource_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookResourceModel {

 int? get id; String get uuid;@JsonKey(name: 'book_id') int get bookId;@BookResourceFormatConverter() BookResourceFormat get format;@JsonKey(name: 'storage_type')@StorageTypeConverter() StorageType get storageType; String? get url;@JsonKey(name: 'file_path') String? get filePath;@JsonKey(name: 'file_hash') String? get fileHash;@JsonKey(name: 'file_size') int? get fileSize; String? get language;@JsonKey(name: 'created_at')@IntToDatetimeCoverter() DateTime? get createdAt;
/// Create a copy of BookResourceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookResourceModelCopyWith<BookResourceModel> get copyWith => _$BookResourceModelCopyWithImpl<BookResourceModel>(this as BookResourceModel, _$identity);

  /// Serializes this BookResourceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookResourceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.format, format) || other.format == format)&&(identical(other.storageType, storageType) || other.storageType == storageType)&&(identical(other.url, url) || other.url == url)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.fileHash, fileHash) || other.fileHash == fileHash)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.language, language) || other.language == language)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uuid,bookId,format,storageType,url,filePath,fileHash,fileSize,language,createdAt);

@override
String toString() {
  return 'BookResourceModel(id: $id, uuid: $uuid, bookId: $bookId, format: $format, storageType: $storageType, url: $url, filePath: $filePath, fileHash: $fileHash, fileSize: $fileSize, language: $language, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BookResourceModelCopyWith<$Res>  {
  factory $BookResourceModelCopyWith(BookResourceModel value, $Res Function(BookResourceModel) _then) = _$BookResourceModelCopyWithImpl;
@useResult
$Res call({
 int? id, String uuid,@JsonKey(name: 'book_id') int bookId,@BookResourceFormatConverter() BookResourceFormat format,@JsonKey(name: 'storage_type')@StorageTypeConverter() StorageType storageType, String? url,@JsonKey(name: 'file_path') String? filePath,@JsonKey(name: 'file_hash') String? fileHash,@JsonKey(name: 'file_size') int? fileSize, String? language,@JsonKey(name: 'created_at')@IntToDatetimeCoverter() DateTime? createdAt
});




}
/// @nodoc
class _$BookResourceModelCopyWithImpl<$Res>
    implements $BookResourceModelCopyWith<$Res> {
  _$BookResourceModelCopyWithImpl(this._self, this._then);

  final BookResourceModel _self;
  final $Res Function(BookResourceModel) _then;

/// Create a copy of BookResourceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uuid = null,Object? bookId = null,Object? format = null,Object? storageType = null,Object? url = freezed,Object? filePath = freezed,Object? fileHash = freezed,Object? fileSize = freezed,Object? language = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as int,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as BookResourceFormat,storageType: null == storageType ? _self.storageType : storageType // ignore: cast_nullable_to_non_nullable
as StorageType,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,filePath: freezed == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String?,fileHash: freezed == fileHash ? _self.fileHash : fileHash // ignore: cast_nullable_to_non_nullable
as String?,fileSize: freezed == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookResourceModel].
extension BookResourceModelPatterns on BookResourceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookResourceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookResourceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookResourceModel value)  $default,){
final _that = this;
switch (_that) {
case _BookResourceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookResourceModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookResourceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String uuid, @JsonKey(name: 'book_id')  int bookId, @BookResourceFormatConverter()  BookResourceFormat format, @JsonKey(name: 'storage_type')@StorageTypeConverter()  StorageType storageType,  String? url, @JsonKey(name: 'file_path')  String? filePath, @JsonKey(name: 'file_hash')  String? fileHash, @JsonKey(name: 'file_size')  int? fileSize,  String? language, @JsonKey(name: 'created_at')@IntToDatetimeCoverter()  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookResourceModel() when $default != null:
return $default(_that.id,_that.uuid,_that.bookId,_that.format,_that.storageType,_that.url,_that.filePath,_that.fileHash,_that.fileSize,_that.language,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String uuid, @JsonKey(name: 'book_id')  int bookId, @BookResourceFormatConverter()  BookResourceFormat format, @JsonKey(name: 'storage_type')@StorageTypeConverter()  StorageType storageType,  String? url, @JsonKey(name: 'file_path')  String? filePath, @JsonKey(name: 'file_hash')  String? fileHash, @JsonKey(name: 'file_size')  int? fileSize,  String? language, @JsonKey(name: 'created_at')@IntToDatetimeCoverter()  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _BookResourceModel():
return $default(_that.id,_that.uuid,_that.bookId,_that.format,_that.storageType,_that.url,_that.filePath,_that.fileHash,_that.fileSize,_that.language,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String uuid, @JsonKey(name: 'book_id')  int bookId, @BookResourceFormatConverter()  BookResourceFormat format, @JsonKey(name: 'storage_type')@StorageTypeConverter()  StorageType storageType,  String? url, @JsonKey(name: 'file_path')  String? filePath, @JsonKey(name: 'file_hash')  String? fileHash, @JsonKey(name: 'file_size')  int? fileSize,  String? language, @JsonKey(name: 'created_at')@IntToDatetimeCoverter()  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BookResourceModel() when $default != null:
return $default(_that.id,_that.uuid,_that.bookId,_that.format,_that.storageType,_that.url,_that.filePath,_that.fileHash,_that.fileSize,_that.language,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookResourceModel extends BookResourceModel {
  const _BookResourceModel({this.id, required this.uuid, @JsonKey(name: 'book_id') required this.bookId, @BookResourceFormatConverter() required this.format, @JsonKey(name: 'storage_type')@StorageTypeConverter() required this.storageType, this.url, @JsonKey(name: 'file_path') this.filePath, @JsonKey(name: 'file_hash') this.fileHash, @JsonKey(name: 'file_size') this.fileSize, this.language, @JsonKey(name: 'created_at')@IntToDatetimeCoverter() this.createdAt}): super._();
  factory _BookResourceModel.fromJson(Map<String, dynamic> json) => _$BookResourceModelFromJson(json);

@override final  int? id;
@override final  String uuid;
@override@JsonKey(name: 'book_id') final  int bookId;
@override@BookResourceFormatConverter() final  BookResourceFormat format;
@override@JsonKey(name: 'storage_type')@StorageTypeConverter() final  StorageType storageType;
@override final  String? url;
@override@JsonKey(name: 'file_path') final  String? filePath;
@override@JsonKey(name: 'file_hash') final  String? fileHash;
@override@JsonKey(name: 'file_size') final  int? fileSize;
@override final  String? language;
@override@JsonKey(name: 'created_at')@IntToDatetimeCoverter() final  DateTime? createdAt;

/// Create a copy of BookResourceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookResourceModelCopyWith<_BookResourceModel> get copyWith => __$BookResourceModelCopyWithImpl<_BookResourceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookResourceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookResourceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.format, format) || other.format == format)&&(identical(other.storageType, storageType) || other.storageType == storageType)&&(identical(other.url, url) || other.url == url)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.fileHash, fileHash) || other.fileHash == fileHash)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.language, language) || other.language == language)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uuid,bookId,format,storageType,url,filePath,fileHash,fileSize,language,createdAt);

@override
String toString() {
  return 'BookResourceModel(id: $id, uuid: $uuid, bookId: $bookId, format: $format, storageType: $storageType, url: $url, filePath: $filePath, fileHash: $fileHash, fileSize: $fileSize, language: $language, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BookResourceModelCopyWith<$Res> implements $BookResourceModelCopyWith<$Res> {
  factory _$BookResourceModelCopyWith(_BookResourceModel value, $Res Function(_BookResourceModel) _then) = __$BookResourceModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String uuid,@JsonKey(name: 'book_id') int bookId,@BookResourceFormatConverter() BookResourceFormat format,@JsonKey(name: 'storage_type')@StorageTypeConverter() StorageType storageType, String? url,@JsonKey(name: 'file_path') String? filePath,@JsonKey(name: 'file_hash') String? fileHash,@JsonKey(name: 'file_size') int? fileSize, String? language,@JsonKey(name: 'created_at')@IntToDatetimeCoverter() DateTime? createdAt
});




}
/// @nodoc
class __$BookResourceModelCopyWithImpl<$Res>
    implements _$BookResourceModelCopyWith<$Res> {
  __$BookResourceModelCopyWithImpl(this._self, this._then);

  final _BookResourceModel _self;
  final $Res Function(_BookResourceModel) _then;

/// Create a copy of BookResourceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uuid = null,Object? bookId = null,Object? format = null,Object? storageType = null,Object? url = freezed,Object? filePath = freezed,Object? fileHash = freezed,Object? fileSize = freezed,Object? language = freezed,Object? createdAt = freezed,}) {
  return _then(_BookResourceModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as int,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as BookResourceFormat,storageType: null == storageType ? _self.storageType : storageType // ignore: cast_nullable_to_non_nullable
as StorageType,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,filePath: freezed == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String?,fileHash: freezed == fileHash ? _self.fileHash : fileHash // ignore: cast_nullable_to_non_nullable
as String?,fileSize: freezed == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
