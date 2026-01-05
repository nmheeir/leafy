// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableOfContent {

@JsonKey(name: "level") int? get level;@JsonKey(name: "label") String? get label;@JsonKey(name: "title") String? get title;@JsonKey(name: "pagenum") String? get pagenum;
/// Create a copy of TableOfContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableOfContentCopyWith<TableOfContent> get copyWith => _$TableOfContentCopyWithImpl<TableOfContent>(this as TableOfContent, _$identity);

  /// Serializes this TableOfContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableOfContent&&(identical(other.level, level) || other.level == level)&&(identical(other.label, label) || other.label == label)&&(identical(other.title, title) || other.title == title)&&(identical(other.pagenum, pagenum) || other.pagenum == pagenum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,level,label,title,pagenum);

@override
String toString() {
  return 'TableOfContent(level: $level, label: $label, title: $title, pagenum: $pagenum)';
}


}

/// @nodoc
abstract mixin class $TableOfContentCopyWith<$Res>  {
  factory $TableOfContentCopyWith(TableOfContent value, $Res Function(TableOfContent) _then) = _$TableOfContentCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "level") int? level,@JsonKey(name: "label") String? label,@JsonKey(name: "title") String? title,@JsonKey(name: "pagenum") String? pagenum
});




}
/// @nodoc
class _$TableOfContentCopyWithImpl<$Res>
    implements $TableOfContentCopyWith<$Res> {
  _$TableOfContentCopyWithImpl(this._self, this._then);

  final TableOfContent _self;
  final $Res Function(TableOfContent) _then;

/// Create a copy of TableOfContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = freezed,Object? label = freezed,Object? title = freezed,Object? pagenum = freezed,}) {
  return _then(_self.copyWith(
level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,pagenum: freezed == pagenum ? _self.pagenum : pagenum // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TableOfContent].
extension TableOfContentPatterns on TableOfContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TableOfContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TableOfContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TableOfContent value)  $default,){
final _that = this;
switch (_that) {
case _TableOfContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TableOfContent value)?  $default,){
final _that = this;
switch (_that) {
case _TableOfContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "level")  int? level, @JsonKey(name: "label")  String? label, @JsonKey(name: "title")  String? title, @JsonKey(name: "pagenum")  String? pagenum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TableOfContent() when $default != null:
return $default(_that.level,_that.label,_that.title,_that.pagenum);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "level")  int? level, @JsonKey(name: "label")  String? label, @JsonKey(name: "title")  String? title, @JsonKey(name: "pagenum")  String? pagenum)  $default,) {final _that = this;
switch (_that) {
case _TableOfContent():
return $default(_that.level,_that.label,_that.title,_that.pagenum);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "level")  int? level, @JsonKey(name: "label")  String? label, @JsonKey(name: "title")  String? title, @JsonKey(name: "pagenum")  String? pagenum)?  $default,) {final _that = this;
switch (_that) {
case _TableOfContent() when $default != null:
return $default(_that.level,_that.label,_that.title,_that.pagenum);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TableOfContent implements TableOfContent {
  const _TableOfContent({@JsonKey(name: "level") this.level, @JsonKey(name: "label") this.label, @JsonKey(name: "title") this.title, @JsonKey(name: "pagenum") this.pagenum});
  factory _TableOfContent.fromJson(Map<String, dynamic> json) => _$TableOfContentFromJson(json);

@override@JsonKey(name: "level") final  int? level;
@override@JsonKey(name: "label") final  String? label;
@override@JsonKey(name: "title") final  String? title;
@override@JsonKey(name: "pagenum") final  String? pagenum;

/// Create a copy of TableOfContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TableOfContentCopyWith<_TableOfContent> get copyWith => __$TableOfContentCopyWithImpl<_TableOfContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TableOfContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TableOfContent&&(identical(other.level, level) || other.level == level)&&(identical(other.label, label) || other.label == label)&&(identical(other.title, title) || other.title == title)&&(identical(other.pagenum, pagenum) || other.pagenum == pagenum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,level,label,title,pagenum);

@override
String toString() {
  return 'TableOfContent(level: $level, label: $label, title: $title, pagenum: $pagenum)';
}


}

/// @nodoc
abstract mixin class _$TableOfContentCopyWith<$Res> implements $TableOfContentCopyWith<$Res> {
  factory _$TableOfContentCopyWith(_TableOfContent value, $Res Function(_TableOfContent) _then) = __$TableOfContentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "level") int? level,@JsonKey(name: "label") String? label,@JsonKey(name: "title") String? title,@JsonKey(name: "pagenum") String? pagenum
});




}
/// @nodoc
class __$TableOfContentCopyWithImpl<$Res>
    implements _$TableOfContentCopyWith<$Res> {
  __$TableOfContentCopyWithImpl(this._self, this._then);

  final _TableOfContent _self;
  final $Res Function(_TableOfContent) _then;

/// Create a copy of TableOfContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = freezed,Object? label = freezed,Object? title = freezed,Object? pagenum = freezed,}) {
  return _then(_TableOfContent(
level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,pagenum: freezed == pagenum ? _self.pagenum : pagenum // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
