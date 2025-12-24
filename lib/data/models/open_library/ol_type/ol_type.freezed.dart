// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ol_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OLType {

@JsonKey(name: "key") String? get key;
/// Create a copy of OLType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OLTypeCopyWith<OLType> get copyWith => _$OLTypeCopyWithImpl<OLType>(this as OLType, _$identity);

  /// Serializes this OLType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OLType&&(identical(other.key, key) || other.key == key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key);

@override
String toString() {
  return 'OLType(key: $key)';
}


}

/// @nodoc
abstract mixin class $OLTypeCopyWith<$Res>  {
  factory $OLTypeCopyWith(OLType value, $Res Function(OLType) _then) = _$OLTypeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "key") String? key
});




}
/// @nodoc
class _$OLTypeCopyWithImpl<$Res>
    implements $OLTypeCopyWith<$Res> {
  _$OLTypeCopyWithImpl(this._self, this._then);

  final OLType _self;
  final $Res Function(OLType) _then;

/// Create a copy of OLType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = freezed,}) {
  return _then(_self.copyWith(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OLType].
extension OLTypePatterns on OLType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OLType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OLType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OLType value)  $default,){
final _that = this;
switch (_that) {
case _OLType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OLType value)?  $default,){
final _that = this;
switch (_that) {
case _OLType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "key")  String? key)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OLType() when $default != null:
return $default(_that.key);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "key")  String? key)  $default,) {final _that = this;
switch (_that) {
case _OLType():
return $default(_that.key);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "key")  String? key)?  $default,) {final _that = this;
switch (_that) {
case _OLType() when $default != null:
return $default(_that.key);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OLType implements OLType {
  const _OLType({@JsonKey(name: "key") this.key});
  factory _OLType.fromJson(Map<String, dynamic> json) => _$OLTypeFromJson(json);

@override@JsonKey(name: "key") final  String? key;

/// Create a copy of OLType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OLTypeCopyWith<_OLType> get copyWith => __$OLTypeCopyWithImpl<_OLType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OLTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OLType&&(identical(other.key, key) || other.key == key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key);

@override
String toString() {
  return 'OLType(key: $key)';
}


}

/// @nodoc
abstract mixin class _$OLTypeCopyWith<$Res> implements $OLTypeCopyWith<$Res> {
  factory _$OLTypeCopyWith(_OLType value, $Res Function(_OLType) _then) = __$OLTypeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "key") String? key
});




}
/// @nodoc
class __$OLTypeCopyWithImpl<$Res>
    implements _$OLTypeCopyWith<$Res> {
  __$OLTypeCopyWithImpl(this._self, this._then);

  final _OLType _self;
  final $Res Function(_OLType) _then;

/// Create a copy of OLType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = freezed,}) {
  return _then(_OLType(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
