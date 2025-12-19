// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gtd_person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GtdPerson {

 String? get name; int? get birthYear; int? get deathYear;
/// Create a copy of GtdPerson
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GtdPersonCopyWith<GtdPerson> get copyWith => _$GtdPersonCopyWithImpl<GtdPerson>(this as GtdPerson, _$identity);

  /// Serializes this GtdPerson to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GtdPerson&&(identical(other.name, name) || other.name == name)&&(identical(other.birthYear, birthYear) || other.birthYear == birthYear)&&(identical(other.deathYear, deathYear) || other.deathYear == deathYear));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,birthYear,deathYear);

@override
String toString() {
  return 'GtdPerson(name: $name, birthYear: $birthYear, deathYear: $deathYear)';
}


}

/// @nodoc
abstract mixin class $GtdPersonCopyWith<$Res>  {
  factory $GtdPersonCopyWith(GtdPerson value, $Res Function(GtdPerson) _then) = _$GtdPersonCopyWithImpl;
@useResult
$Res call({
 String? name, int? birthYear, int? deathYear
});




}
/// @nodoc
class _$GtdPersonCopyWithImpl<$Res>
    implements $GtdPersonCopyWith<$Res> {
  _$GtdPersonCopyWithImpl(this._self, this._then);

  final GtdPerson _self;
  final $Res Function(GtdPerson) _then;

/// Create a copy of GtdPerson
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? birthYear = freezed,Object? deathYear = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,birthYear: freezed == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int?,deathYear: freezed == deathYear ? _self.deathYear : deathYear // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GtdPerson].
extension GtdPersonPatterns on GtdPerson {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GtdPerson value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GtdPerson() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GtdPerson value)  $default,){
final _that = this;
switch (_that) {
case _GtdPerson():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GtdPerson value)?  $default,){
final _that = this;
switch (_that) {
case _GtdPerson() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  int? birthYear,  int? deathYear)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GtdPerson() when $default != null:
return $default(_that.name,_that.birthYear,_that.deathYear);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  int? birthYear,  int? deathYear)  $default,) {final _that = this;
switch (_that) {
case _GtdPerson():
return $default(_that.name,_that.birthYear,_that.deathYear);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  int? birthYear,  int? deathYear)?  $default,) {final _that = this;
switch (_that) {
case _GtdPerson() when $default != null:
return $default(_that.name,_that.birthYear,_that.deathYear);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GtdPerson implements GtdPerson {
  const _GtdPerson({required this.name, required this.birthYear, required this.deathYear});
  factory _GtdPerson.fromJson(Map<String, dynamic> json) => _$GtdPersonFromJson(json);

@override final  String? name;
@override final  int? birthYear;
@override final  int? deathYear;

/// Create a copy of GtdPerson
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GtdPersonCopyWith<_GtdPerson> get copyWith => __$GtdPersonCopyWithImpl<_GtdPerson>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GtdPersonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GtdPerson&&(identical(other.name, name) || other.name == name)&&(identical(other.birthYear, birthYear) || other.birthYear == birthYear)&&(identical(other.deathYear, deathYear) || other.deathYear == deathYear));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,birthYear,deathYear);

@override
String toString() {
  return 'GtdPerson(name: $name, birthYear: $birthYear, deathYear: $deathYear)';
}


}

/// @nodoc
abstract mixin class _$GtdPersonCopyWith<$Res> implements $GtdPersonCopyWith<$Res> {
  factory _$GtdPersonCopyWith(_GtdPerson value, $Res Function(_GtdPerson) _then) = __$GtdPersonCopyWithImpl;
@override @useResult
$Res call({
 String? name, int? birthYear, int? deathYear
});




}
/// @nodoc
class __$GtdPersonCopyWithImpl<$Res>
    implements _$GtdPersonCopyWith<$Res> {
  __$GtdPersonCopyWithImpl(this._self, this._then);

  final _GtdPerson _self;
  final $Res Function(_GtdPerson) _then;

/// Create a copy of GtdPerson
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? birthYear = freezed,Object? deathYear = freezed,}) {
  return _then(_GtdPerson(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,birthYear: freezed == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int?,deathYear: freezed == deathYear ? _self.deathYear : deathYear // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
