// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'classifications.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Classifications {

@JsonKey(name: 'dewey_decimal_class') List<String>? get deweyDecimalClass;@JsonKey(name: 'lc_classifications') List<String>? get lcClassifications;
/// Create a copy of Classifications
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClassificationsCopyWith<Classifications> get copyWith => _$ClassificationsCopyWithImpl<Classifications>(this as Classifications, _$identity);

  /// Serializes this Classifications to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Classifications&&const DeepCollectionEquality().equals(other.deweyDecimalClass, deweyDecimalClass)&&const DeepCollectionEquality().equals(other.lcClassifications, lcClassifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(deweyDecimalClass),const DeepCollectionEquality().hash(lcClassifications));

@override
String toString() {
  return 'Classifications(deweyDecimalClass: $deweyDecimalClass, lcClassifications: $lcClassifications)';
}


}

/// @nodoc
abstract mixin class $ClassificationsCopyWith<$Res>  {
  factory $ClassificationsCopyWith(Classifications value, $Res Function(Classifications) _then) = _$ClassificationsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'dewey_decimal_class') List<String>? deweyDecimalClass,@JsonKey(name: 'lc_classifications') List<String>? lcClassifications
});




}
/// @nodoc
class _$ClassificationsCopyWithImpl<$Res>
    implements $ClassificationsCopyWith<$Res> {
  _$ClassificationsCopyWithImpl(this._self, this._then);

  final Classifications _self;
  final $Res Function(Classifications) _then;

/// Create a copy of Classifications
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deweyDecimalClass = freezed,Object? lcClassifications = freezed,}) {
  return _then(_self.copyWith(
deweyDecimalClass: freezed == deweyDecimalClass ? _self.deweyDecimalClass : deweyDecimalClass // ignore: cast_nullable_to_non_nullable
as List<String>?,lcClassifications: freezed == lcClassifications ? _self.lcClassifications : lcClassifications // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Classifications].
extension ClassificationsPatterns on Classifications {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Classifications value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Classifications() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Classifications value)  $default,){
final _that = this;
switch (_that) {
case _Classifications():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Classifications value)?  $default,){
final _that = this;
switch (_that) {
case _Classifications() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'dewey_decimal_class')  List<String>? deweyDecimalClass, @JsonKey(name: 'lc_classifications')  List<String>? lcClassifications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Classifications() when $default != null:
return $default(_that.deweyDecimalClass,_that.lcClassifications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'dewey_decimal_class')  List<String>? deweyDecimalClass, @JsonKey(name: 'lc_classifications')  List<String>? lcClassifications)  $default,) {final _that = this;
switch (_that) {
case _Classifications():
return $default(_that.deweyDecimalClass,_that.lcClassifications);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'dewey_decimal_class')  List<String>? deweyDecimalClass, @JsonKey(name: 'lc_classifications')  List<String>? lcClassifications)?  $default,) {final _that = this;
switch (_that) {
case _Classifications() when $default != null:
return $default(_that.deweyDecimalClass,_that.lcClassifications);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Classifications implements Classifications {
   _Classifications({@JsonKey(name: 'dewey_decimal_class') final  List<String>? deweyDecimalClass, @JsonKey(name: 'lc_classifications') final  List<String>? lcClassifications}): _deweyDecimalClass = deweyDecimalClass,_lcClassifications = lcClassifications;
  factory _Classifications.fromJson(Map<String, dynamic> json) => _$ClassificationsFromJson(json);

 final  List<String>? _deweyDecimalClass;
@override@JsonKey(name: 'dewey_decimal_class') List<String>? get deweyDecimalClass {
  final value = _deweyDecimalClass;
  if (value == null) return null;
  if (_deweyDecimalClass is EqualUnmodifiableListView) return _deweyDecimalClass;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _lcClassifications;
@override@JsonKey(name: 'lc_classifications') List<String>? get lcClassifications {
  final value = _lcClassifications;
  if (value == null) return null;
  if (_lcClassifications is EqualUnmodifiableListView) return _lcClassifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Classifications
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClassificationsCopyWith<_Classifications> get copyWith => __$ClassificationsCopyWithImpl<_Classifications>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClassificationsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Classifications&&const DeepCollectionEquality().equals(other._deweyDecimalClass, _deweyDecimalClass)&&const DeepCollectionEquality().equals(other._lcClassifications, _lcClassifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_deweyDecimalClass),const DeepCollectionEquality().hash(_lcClassifications));

@override
String toString() {
  return 'Classifications(deweyDecimalClass: $deweyDecimalClass, lcClassifications: $lcClassifications)';
}


}

/// @nodoc
abstract mixin class _$ClassificationsCopyWith<$Res> implements $ClassificationsCopyWith<$Res> {
  factory _$ClassificationsCopyWith(_Classifications value, $Res Function(_Classifications) _then) = __$ClassificationsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'dewey_decimal_class') List<String>? deweyDecimalClass,@JsonKey(name: 'lc_classifications') List<String>? lcClassifications
});




}
/// @nodoc
class __$ClassificationsCopyWithImpl<$Res>
    implements _$ClassificationsCopyWith<$Res> {
  __$ClassificationsCopyWithImpl(this._self, this._then);

  final _Classifications _self;
  final $Res Function(_Classifications) _then;

/// Create a copy of Classifications
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deweyDecimalClass = freezed,Object? lcClassifications = freezed,}) {
  return _then(_Classifications(
deweyDecimalClass: freezed == deweyDecimalClass ? _self._deweyDecimalClass : deweyDecimalClass // ignore: cast_nullable_to_non_nullable
as List<String>?,lcClassifications: freezed == lcClassifications ? _self._lcClassifications : lcClassifications // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
