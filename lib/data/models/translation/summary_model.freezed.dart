// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SummaryModel {

 int? get id;@JsonKey(name: 'file_hash') String get fileHash;@JsonKey(name: 'chapter_index') int get chapterIndex;@JsonKey(name: 'summary_content') String get summaryContent;@JsonKey(name: 'last_updated') int? get lastUpdated;
/// Create a copy of SummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryModelCopyWith<SummaryModel> get copyWith => _$SummaryModelCopyWithImpl<SummaryModel>(this as SummaryModel, _$identity);

  /// Serializes this SummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fileHash, fileHash) || other.fileHash == fileHash)&&(identical(other.chapterIndex, chapterIndex) || other.chapterIndex == chapterIndex)&&(identical(other.summaryContent, summaryContent) || other.summaryContent == summaryContent)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileHash,chapterIndex,summaryContent,lastUpdated);

@override
String toString() {
  return 'SummaryModel(id: $id, fileHash: $fileHash, chapterIndex: $chapterIndex, summaryContent: $summaryContent, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $SummaryModelCopyWith<$Res>  {
  factory $SummaryModelCopyWith(SummaryModel value, $Res Function(SummaryModel) _then) = _$SummaryModelCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'file_hash') String fileHash,@JsonKey(name: 'chapter_index') int chapterIndex,@JsonKey(name: 'summary_content') String summaryContent,@JsonKey(name: 'last_updated') int? lastUpdated
});




}
/// @nodoc
class _$SummaryModelCopyWithImpl<$Res>
    implements $SummaryModelCopyWith<$Res> {
  _$SummaryModelCopyWithImpl(this._self, this._then);

  final SummaryModel _self;
  final $Res Function(SummaryModel) _then;

/// Create a copy of SummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? fileHash = null,Object? chapterIndex = null,Object? summaryContent = null,Object? lastUpdated = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fileHash: null == fileHash ? _self.fileHash : fileHash // ignore: cast_nullable_to_non_nullable
as String,chapterIndex: null == chapterIndex ? _self.chapterIndex : chapterIndex // ignore: cast_nullable_to_non_nullable
as int,summaryContent: null == summaryContent ? _self.summaryContent : summaryContent // ignore: cast_nullable_to_non_nullable
as String,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SummaryModel].
extension SummaryModelPatterns on SummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _SummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _SummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'file_hash')  String fileHash, @JsonKey(name: 'chapter_index')  int chapterIndex, @JsonKey(name: 'summary_content')  String summaryContent, @JsonKey(name: 'last_updated')  int? lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummaryModel() when $default != null:
return $default(_that.id,_that.fileHash,_that.chapterIndex,_that.summaryContent,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'file_hash')  String fileHash, @JsonKey(name: 'chapter_index')  int chapterIndex, @JsonKey(name: 'summary_content')  String summaryContent, @JsonKey(name: 'last_updated')  int? lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _SummaryModel():
return $default(_that.id,_that.fileHash,_that.chapterIndex,_that.summaryContent,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'file_hash')  String fileHash, @JsonKey(name: 'chapter_index')  int chapterIndex, @JsonKey(name: 'summary_content')  String summaryContent, @JsonKey(name: 'last_updated')  int? lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _SummaryModel() when $default != null:
return $default(_that.id,_that.fileHash,_that.chapterIndex,_that.summaryContent,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SummaryModel implements SummaryModel {
  const _SummaryModel({this.id, @JsonKey(name: 'file_hash') required this.fileHash, @JsonKey(name: 'chapter_index') required this.chapterIndex, @JsonKey(name: 'summary_content') required this.summaryContent, @JsonKey(name: 'last_updated') this.lastUpdated});
  factory _SummaryModel.fromJson(Map<String, dynamic> json) => _$SummaryModelFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'file_hash') final  String fileHash;
@override@JsonKey(name: 'chapter_index') final  int chapterIndex;
@override@JsonKey(name: 'summary_content') final  String summaryContent;
@override@JsonKey(name: 'last_updated') final  int? lastUpdated;

/// Create a copy of SummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummaryModelCopyWith<_SummaryModel> get copyWith => __$SummaryModelCopyWithImpl<_SummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fileHash, fileHash) || other.fileHash == fileHash)&&(identical(other.chapterIndex, chapterIndex) || other.chapterIndex == chapterIndex)&&(identical(other.summaryContent, summaryContent) || other.summaryContent == summaryContent)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileHash,chapterIndex,summaryContent,lastUpdated);

@override
String toString() {
  return 'SummaryModel(id: $id, fileHash: $fileHash, chapterIndex: $chapterIndex, summaryContent: $summaryContent, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$SummaryModelCopyWith<$Res> implements $SummaryModelCopyWith<$Res> {
  factory _$SummaryModelCopyWith(_SummaryModel value, $Res Function(_SummaryModel) _then) = __$SummaryModelCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'file_hash') String fileHash,@JsonKey(name: 'chapter_index') int chapterIndex,@JsonKey(name: 'summary_content') String summaryContent,@JsonKey(name: 'last_updated') int? lastUpdated
});




}
/// @nodoc
class __$SummaryModelCopyWithImpl<$Res>
    implements _$SummaryModelCopyWith<$Res> {
  __$SummaryModelCopyWithImpl(this._self, this._then);

  final _SummaryModel _self;
  final $Res Function(_SummaryModel) _then;

/// Create a copy of SummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fileHash = null,Object? chapterIndex = null,Object? summaryContent = null,Object? lastUpdated = freezed,}) {
  return _then(_SummaryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fileHash: null == fileHash ? _self.fileHash : fileHash // ignore: cast_nullable_to_non_nullable
as String,chapterIndex: null == chapterIndex ? _self.chapterIndex : chapterIndex // ignore: cast_nullable_to_non_nullable
as int,summaryContent: null == summaryContent ? _self.summaryContent : summaryContent // ignore: cast_nullable_to_non_nullable
as String,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
