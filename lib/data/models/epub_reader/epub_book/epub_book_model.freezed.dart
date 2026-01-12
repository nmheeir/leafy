// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epub_book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EpubBookModel {

 String get fileName; String get title; String get author; String get language;@Uint8ListConverter() Uint8List? get coverImage;@JsonKey(name: 'chapters') List<EpubChapterModel> get chapters; List<EpubImageModel> get images;
/// Create a copy of EpubBookModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpubBookModelCopyWith<EpubBookModel> get copyWith => _$EpubBookModelCopyWithImpl<EpubBookModel>(this as EpubBookModel, _$identity);

  /// Serializes this EpubBookModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpubBookModel&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other.coverImage, coverImage)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileName,title,author,language,const DeepCollectionEquality().hash(coverImage),const DeepCollectionEquality().hash(chapters),const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'EpubBookModel(fileName: $fileName, title: $title, author: $author, language: $language, coverImage: $coverImage, chapters: $chapters, images: $images)';
}


}

/// @nodoc
abstract mixin class $EpubBookModelCopyWith<$Res>  {
  factory $EpubBookModelCopyWith(EpubBookModel value, $Res Function(EpubBookModel) _then) = _$EpubBookModelCopyWithImpl;
@useResult
$Res call({
 String fileName, String title, String author, String language,@Uint8ListConverter() Uint8List? coverImage,@JsonKey(name: 'chapters') List<EpubChapterModel> chapters, List<EpubImageModel> images
});




}
/// @nodoc
class _$EpubBookModelCopyWithImpl<$Res>
    implements $EpubBookModelCopyWith<$Res> {
  _$EpubBookModelCopyWithImpl(this._self, this._then);

  final EpubBookModel _self;
  final $Res Function(EpubBookModel) _then;

/// Create a copy of EpubBookModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileName = null,Object? title = null,Object? author = null,Object? language = null,Object? coverImage = freezed,Object? chapters = null,Object? images = null,}) {
  return _then(_self.copyWith(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as Uint8List?,chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<EpubChapterModel>,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<EpubImageModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [EpubBookModel].
extension EpubBookModelPatterns on EpubBookModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpubBookModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpubBookModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpubBookModel value)  $default,){
final _that = this;
switch (_that) {
case _EpubBookModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpubBookModel value)?  $default,){
final _that = this;
switch (_that) {
case _EpubBookModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fileName,  String title,  String author,  String language, @Uint8ListConverter()  Uint8List? coverImage, @JsonKey(name: 'chapters')  List<EpubChapterModel> chapters,  List<EpubImageModel> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpubBookModel() when $default != null:
return $default(_that.fileName,_that.title,_that.author,_that.language,_that.coverImage,_that.chapters,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fileName,  String title,  String author,  String language, @Uint8ListConverter()  Uint8List? coverImage, @JsonKey(name: 'chapters')  List<EpubChapterModel> chapters,  List<EpubImageModel> images)  $default,) {final _that = this;
switch (_that) {
case _EpubBookModel():
return $default(_that.fileName,_that.title,_that.author,_that.language,_that.coverImage,_that.chapters,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fileName,  String title,  String author,  String language, @Uint8ListConverter()  Uint8List? coverImage, @JsonKey(name: 'chapters')  List<EpubChapterModel> chapters,  List<EpubImageModel> images)?  $default,) {final _that = this;
switch (_that) {
case _EpubBookModel() when $default != null:
return $default(_that.fileName,_that.title,_that.author,_that.language,_that.coverImage,_that.chapters,_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EpubBookModel extends EpubBookModel {
  const _EpubBookModel({required this.fileName, required this.title, required this.author, required this.language, @Uint8ListConverter() this.coverImage, @JsonKey(name: 'chapters') required final  List<EpubChapterModel> chapters, final  List<EpubImageModel> images = const []}): _chapters = chapters,_images = images,super._();
  factory _EpubBookModel.fromJson(Map<String, dynamic> json) => _$EpubBookModelFromJson(json);

@override final  String fileName;
@override final  String title;
@override final  String author;
@override final  String language;
@override@Uint8ListConverter() final  Uint8List? coverImage;
 final  List<EpubChapterModel> _chapters;
@override@JsonKey(name: 'chapters') List<EpubChapterModel> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}

 final  List<EpubImageModel> _images;
@override@JsonKey() List<EpubImageModel> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of EpubBookModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpubBookModelCopyWith<_EpubBookModel> get copyWith => __$EpubBookModelCopyWithImpl<_EpubBookModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpubBookModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpubBookModel&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other.coverImage, coverImage)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileName,title,author,language,const DeepCollectionEquality().hash(coverImage),const DeepCollectionEquality().hash(_chapters),const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'EpubBookModel(fileName: $fileName, title: $title, author: $author, language: $language, coverImage: $coverImage, chapters: $chapters, images: $images)';
}


}

/// @nodoc
abstract mixin class _$EpubBookModelCopyWith<$Res> implements $EpubBookModelCopyWith<$Res> {
  factory _$EpubBookModelCopyWith(_EpubBookModel value, $Res Function(_EpubBookModel) _then) = __$EpubBookModelCopyWithImpl;
@override @useResult
$Res call({
 String fileName, String title, String author, String language,@Uint8ListConverter() Uint8List? coverImage,@JsonKey(name: 'chapters') List<EpubChapterModel> chapters, List<EpubImageModel> images
});




}
/// @nodoc
class __$EpubBookModelCopyWithImpl<$Res>
    implements _$EpubBookModelCopyWith<$Res> {
  __$EpubBookModelCopyWithImpl(this._self, this._then);

  final _EpubBookModel _self;
  final $Res Function(_EpubBookModel) _then;

/// Create a copy of EpubBookModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileName = null,Object? title = null,Object? author = null,Object? language = null,Object? coverImage = freezed,Object? chapters = null,Object? images = null,}) {
  return _then(_EpubBookModel(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as Uint8List?,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<EpubChapterModel>,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<EpubImageModel>,
  ));
}


}

// dart format on
