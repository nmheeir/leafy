// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TranslationModel {

 int? get id;@JsonKey(name: 'file_hash') String get fileHash;@JsonKey(name: 'chapter_index') int get chapterIndex;@JsonKey(name: 'target_lang') String get targetLang;// JSON string -> Map<String, String> conversion handles at DB layer usually,
// but here we model the generic key-value map for content.
// For sqflite, we might need a custom converter if we want automatic string<->map.
// Let's assume we pass the Map directly here and handle stringify in DataSource.
@JsonKey(name: 'translated_content') Map<String, String> get translatedContent;@JsonKey(name: 'last_updated') int? get lastUpdated;
/// Create a copy of TranslationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslationModelCopyWith<TranslationModel> get copyWith => _$TranslationModelCopyWithImpl<TranslationModel>(this as TranslationModel, _$identity);

  /// Serializes this TranslationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fileHash, fileHash) || other.fileHash == fileHash)&&(identical(other.chapterIndex, chapterIndex) || other.chapterIndex == chapterIndex)&&(identical(other.targetLang, targetLang) || other.targetLang == targetLang)&&const DeepCollectionEquality().equals(other.translatedContent, translatedContent)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileHash,chapterIndex,targetLang,const DeepCollectionEquality().hash(translatedContent),lastUpdated);

@override
String toString() {
  return 'TranslationModel(id: $id, fileHash: $fileHash, chapterIndex: $chapterIndex, targetLang: $targetLang, translatedContent: $translatedContent, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $TranslationModelCopyWith<$Res>  {
  factory $TranslationModelCopyWith(TranslationModel value, $Res Function(TranslationModel) _then) = _$TranslationModelCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'file_hash') String fileHash,@JsonKey(name: 'chapter_index') int chapterIndex,@JsonKey(name: 'target_lang') String targetLang,@JsonKey(name: 'translated_content') Map<String, String> translatedContent,@JsonKey(name: 'last_updated') int? lastUpdated
});




}
/// @nodoc
class _$TranslationModelCopyWithImpl<$Res>
    implements $TranslationModelCopyWith<$Res> {
  _$TranslationModelCopyWithImpl(this._self, this._then);

  final TranslationModel _self;
  final $Res Function(TranslationModel) _then;

/// Create a copy of TranslationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? fileHash = null,Object? chapterIndex = null,Object? targetLang = null,Object? translatedContent = null,Object? lastUpdated = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fileHash: null == fileHash ? _self.fileHash : fileHash // ignore: cast_nullable_to_non_nullable
as String,chapterIndex: null == chapterIndex ? _self.chapterIndex : chapterIndex // ignore: cast_nullable_to_non_nullable
as int,targetLang: null == targetLang ? _self.targetLang : targetLang // ignore: cast_nullable_to_non_nullable
as String,translatedContent: null == translatedContent ? _self.translatedContent : translatedContent // ignore: cast_nullable_to_non_nullable
as Map<String, String>,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TranslationModel].
extension TranslationModelPatterns on TranslationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TranslationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TranslationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TranslationModel value)  $default,){
final _that = this;
switch (_that) {
case _TranslationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TranslationModel value)?  $default,){
final _that = this;
switch (_that) {
case _TranslationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'file_hash')  String fileHash, @JsonKey(name: 'chapter_index')  int chapterIndex, @JsonKey(name: 'target_lang')  String targetLang, @JsonKey(name: 'translated_content')  Map<String, String> translatedContent, @JsonKey(name: 'last_updated')  int? lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TranslationModel() when $default != null:
return $default(_that.id,_that.fileHash,_that.chapterIndex,_that.targetLang,_that.translatedContent,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'file_hash')  String fileHash, @JsonKey(name: 'chapter_index')  int chapterIndex, @JsonKey(name: 'target_lang')  String targetLang, @JsonKey(name: 'translated_content')  Map<String, String> translatedContent, @JsonKey(name: 'last_updated')  int? lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _TranslationModel():
return $default(_that.id,_that.fileHash,_that.chapterIndex,_that.targetLang,_that.translatedContent,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'file_hash')  String fileHash, @JsonKey(name: 'chapter_index')  int chapterIndex, @JsonKey(name: 'target_lang')  String targetLang, @JsonKey(name: 'translated_content')  Map<String, String> translatedContent, @JsonKey(name: 'last_updated')  int? lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _TranslationModel() when $default != null:
return $default(_that.id,_that.fileHash,_that.chapterIndex,_that.targetLang,_that.translatedContent,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TranslationModel implements TranslationModel {
  const _TranslationModel({this.id, @JsonKey(name: 'file_hash') required this.fileHash, @JsonKey(name: 'chapter_index') required this.chapterIndex, @JsonKey(name: 'target_lang') this.targetLang = 'vi', @JsonKey(name: 'translated_content') required final  Map<String, String> translatedContent, @JsonKey(name: 'last_updated') this.lastUpdated}): _translatedContent = translatedContent;
  factory _TranslationModel.fromJson(Map<String, dynamic> json) => _$TranslationModelFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'file_hash') final  String fileHash;
@override@JsonKey(name: 'chapter_index') final  int chapterIndex;
@override@JsonKey(name: 'target_lang') final  String targetLang;
// JSON string -> Map<String, String> conversion handles at DB layer usually,
// but here we model the generic key-value map for content.
// For sqflite, we might need a custom converter if we want automatic string<->map.
// Let's assume we pass the Map directly here and handle stringify in DataSource.
 final  Map<String, String> _translatedContent;
// JSON string -> Map<String, String> conversion handles at DB layer usually,
// but here we model the generic key-value map for content.
// For sqflite, we might need a custom converter if we want automatic string<->map.
// Let's assume we pass the Map directly here and handle stringify in DataSource.
@override@JsonKey(name: 'translated_content') Map<String, String> get translatedContent {
  if (_translatedContent is EqualUnmodifiableMapView) return _translatedContent;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_translatedContent);
}

@override@JsonKey(name: 'last_updated') final  int? lastUpdated;

/// Create a copy of TranslationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranslationModelCopyWith<_TranslationModel> get copyWith => __$TranslationModelCopyWithImpl<_TranslationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TranslationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TranslationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fileHash, fileHash) || other.fileHash == fileHash)&&(identical(other.chapterIndex, chapterIndex) || other.chapterIndex == chapterIndex)&&(identical(other.targetLang, targetLang) || other.targetLang == targetLang)&&const DeepCollectionEquality().equals(other._translatedContent, _translatedContent)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileHash,chapterIndex,targetLang,const DeepCollectionEquality().hash(_translatedContent),lastUpdated);

@override
String toString() {
  return 'TranslationModel(id: $id, fileHash: $fileHash, chapterIndex: $chapterIndex, targetLang: $targetLang, translatedContent: $translatedContent, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$TranslationModelCopyWith<$Res> implements $TranslationModelCopyWith<$Res> {
  factory _$TranslationModelCopyWith(_TranslationModel value, $Res Function(_TranslationModel) _then) = __$TranslationModelCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'file_hash') String fileHash,@JsonKey(name: 'chapter_index') int chapterIndex,@JsonKey(name: 'target_lang') String targetLang,@JsonKey(name: 'translated_content') Map<String, String> translatedContent,@JsonKey(name: 'last_updated') int? lastUpdated
});




}
/// @nodoc
class __$TranslationModelCopyWithImpl<$Res>
    implements _$TranslationModelCopyWith<$Res> {
  __$TranslationModelCopyWithImpl(this._self, this._then);

  final _TranslationModel _self;
  final $Res Function(_TranslationModel) _then;

/// Create a copy of TranslationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fileHash = null,Object? chapterIndex = null,Object? targetLang = null,Object? translatedContent = null,Object? lastUpdated = freezed,}) {
  return _then(_TranslationModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fileHash: null == fileHash ? _self.fileHash : fileHash // ignore: cast_nullable_to_non_nullable
as String,chapterIndex: null == chapterIndex ? _self.chapterIndex : chapterIndex // ignore: cast_nullable_to_non_nullable
as int,targetLang: null == targetLang ? _self.targetLang : targetLang // ignore: cast_nullable_to_non_nullable
as String,translatedContent: null == translatedContent ? _self._translatedContent : translatedContent // ignore: cast_nullable_to_non_nullable
as Map<String, String>,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
