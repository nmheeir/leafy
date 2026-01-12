// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epub_chapter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EpubChapterModel {

@JsonKey(name: 'chapterId') String get id; String get title; String get body;
/// Create a copy of EpubChapterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpubChapterModelCopyWith<EpubChapterModel> get copyWith => _$EpubChapterModelCopyWithImpl<EpubChapterModel>(this as EpubChapterModel, _$identity);

  /// Serializes this EpubChapterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpubChapterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body);

@override
String toString() {
  return 'EpubChapterModel(id: $id, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class $EpubChapterModelCopyWith<$Res>  {
  factory $EpubChapterModelCopyWith(EpubChapterModel value, $Res Function(EpubChapterModel) _then) = _$EpubChapterModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'chapterId') String id, String title, String body
});




}
/// @nodoc
class _$EpubChapterModelCopyWithImpl<$Res>
    implements $EpubChapterModelCopyWith<$Res> {
  _$EpubChapterModelCopyWithImpl(this._self, this._then);

  final EpubChapterModel _self;
  final $Res Function(EpubChapterModel) _then;

/// Create a copy of EpubChapterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? body = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EpubChapterModel].
extension EpubChapterModelPatterns on EpubChapterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpubChapterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpubChapterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpubChapterModel value)  $default,){
final _that = this;
switch (_that) {
case _EpubChapterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpubChapterModel value)?  $default,){
final _that = this;
switch (_that) {
case _EpubChapterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'chapterId')  String id,  String title,  String body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpubChapterModel() when $default != null:
return $default(_that.id,_that.title,_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'chapterId')  String id,  String title,  String body)  $default,) {final _that = this;
switch (_that) {
case _EpubChapterModel():
return $default(_that.id,_that.title,_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'chapterId')  String id,  String title,  String body)?  $default,) {final _that = this;
switch (_that) {
case _EpubChapterModel() when $default != null:
return $default(_that.id,_that.title,_that.body);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EpubChapterModel extends EpubChapterModel {
  const _EpubChapterModel({@JsonKey(name: 'chapterId') required this.id, required this.title, required this.body}): super._();
  factory _EpubChapterModel.fromJson(Map<String, dynamic> json) => _$EpubChapterModelFromJson(json);

@override@JsonKey(name: 'chapterId') final  String id;
@override final  String title;
@override final  String body;

/// Create a copy of EpubChapterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpubChapterModelCopyWith<_EpubChapterModel> get copyWith => __$EpubChapterModelCopyWithImpl<_EpubChapterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpubChapterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpubChapterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body);

@override
String toString() {
  return 'EpubChapterModel(id: $id, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class _$EpubChapterModelCopyWith<$Res> implements $EpubChapterModelCopyWith<$Res> {
  factory _$EpubChapterModelCopyWith(_EpubChapterModel value, $Res Function(_EpubChapterModel) _then) = __$EpubChapterModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'chapterId') String id, String title, String body
});




}
/// @nodoc
class __$EpubChapterModelCopyWithImpl<$Res>
    implements _$EpubChapterModelCopyWith<$Res> {
  __$EpubChapterModelCopyWithImpl(this._self, this._then);

  final _EpubChapterModel _self;
  final $Res Function(_EpubChapterModel) _then;

/// Create a copy of EpubChapterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,}) {
  return _then(_EpubChapterModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
