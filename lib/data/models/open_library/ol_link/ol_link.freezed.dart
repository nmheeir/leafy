// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ol_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OLLink {

@JsonKey(name: "url") String? get url;@JsonKey(name: "type") OLType? get type;@JsonKey(name: "title") String? get title;
/// Create a copy of OLLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OLLinkCopyWith<OLLink> get copyWith => _$OLLinkCopyWithImpl<OLLink>(this as OLLink, _$identity);

  /// Serializes this OLLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OLLink&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,type,title);

@override
String toString() {
  return 'OLLink(url: $url, type: $type, title: $title)';
}


}

/// @nodoc
abstract mixin class $OLLinkCopyWith<$Res>  {
  factory $OLLinkCopyWith(OLLink value, $Res Function(OLLink) _then) = _$OLLinkCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "url") String? url,@JsonKey(name: "type") OLType? type,@JsonKey(name: "title") String? title
});


$OLTypeCopyWith<$Res>? get type;

}
/// @nodoc
class _$OLLinkCopyWithImpl<$Res>
    implements $OLLinkCopyWith<$Res> {
  _$OLLinkCopyWithImpl(this._self, this._then);

  final OLLink _self;
  final $Res Function(OLLink) _then;

/// Create a copy of OLLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = freezed,Object? type = freezed,Object? title = freezed,}) {
  return _then(_self.copyWith(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OLType?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of OLLink
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OLTypeCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $OLTypeCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [OLLink].
extension OLLinkPatterns on OLLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OLLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OLLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OLLink value)  $default,){
final _that = this;
switch (_that) {
case _OLLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OLLink value)?  $default,){
final _that = this;
switch (_that) {
case _OLLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "url")  String? url, @JsonKey(name: "type")  OLType? type, @JsonKey(name: "title")  String? title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OLLink() when $default != null:
return $default(_that.url,_that.type,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "url")  String? url, @JsonKey(name: "type")  OLType? type, @JsonKey(name: "title")  String? title)  $default,) {final _that = this;
switch (_that) {
case _OLLink():
return $default(_that.url,_that.type,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "url")  String? url, @JsonKey(name: "type")  OLType? type, @JsonKey(name: "title")  String? title)?  $default,) {final _that = this;
switch (_that) {
case _OLLink() when $default != null:
return $default(_that.url,_that.type,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OLLink implements OLLink {
  const _OLLink({@JsonKey(name: "url") this.url, @JsonKey(name: "type") this.type, @JsonKey(name: "title") this.title});
  factory _OLLink.fromJson(Map<String, dynamic> json) => _$OLLinkFromJson(json);

@override@JsonKey(name: "url") final  String? url;
@override@JsonKey(name: "type") final  OLType? type;
@override@JsonKey(name: "title") final  String? title;

/// Create a copy of OLLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OLLinkCopyWith<_OLLink> get copyWith => __$OLLinkCopyWithImpl<_OLLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OLLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OLLink&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,type,title);

@override
String toString() {
  return 'OLLink(url: $url, type: $type, title: $title)';
}


}

/// @nodoc
abstract mixin class _$OLLinkCopyWith<$Res> implements $OLLinkCopyWith<$Res> {
  factory _$OLLinkCopyWith(_OLLink value, $Res Function(_OLLink) _then) = __$OLLinkCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "url") String? url,@JsonKey(name: "type") OLType? type,@JsonKey(name: "title") String? title
});


@override $OLTypeCopyWith<$Res>? get type;

}
/// @nodoc
class __$OLLinkCopyWithImpl<$Res>
    implements _$OLLinkCopyWith<$Res> {
  __$OLLinkCopyWithImpl(this._self, this._then);

  final _OLLink _self;
  final $Res Function(_OLLink) _then;

/// Create a copy of OLLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? type = freezed,Object? title = freezed,}) {
  return _then(_OLLink(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OLType?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of OLLink
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OLTypeCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $OLTypeCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}

// dart format on
