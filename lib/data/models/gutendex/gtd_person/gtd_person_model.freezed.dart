// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gtd_person_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GtdPersonModel {

 String? get name;@JsonKey(name: 'birth_year') int? get birthYear;@JsonKey(name: 'death_year') int? get deathYear;
/// Create a copy of GtdPersonModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GtdPersonModelCopyWith<GtdPersonModel> get copyWith => _$GtdPersonModelCopyWithImpl<GtdPersonModel>(this as GtdPersonModel, _$identity);

  /// Serializes this GtdPersonModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GtdPersonModel&&(identical(other.name, name) || other.name == name)&&(identical(other.birthYear, birthYear) || other.birthYear == birthYear)&&(identical(other.deathYear, deathYear) || other.deathYear == deathYear));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,birthYear,deathYear);

@override
String toString() {
  return 'GtdPersonModel(name: $name, birthYear: $birthYear, deathYear: $deathYear)';
}


}

/// @nodoc
abstract mixin class $GtdPersonModelCopyWith<$Res>  {
  factory $GtdPersonModelCopyWith(GtdPersonModel value, $Res Function(GtdPersonModel) _then) = _$GtdPersonModelCopyWithImpl;
@useResult
$Res call({
 String? name,@JsonKey(name: 'birth_year') int? birthYear,@JsonKey(name: 'death_year') int? deathYear
});




}
/// @nodoc
class _$GtdPersonModelCopyWithImpl<$Res>
    implements $GtdPersonModelCopyWith<$Res> {
  _$GtdPersonModelCopyWithImpl(this._self, this._then);

  final GtdPersonModel _self;
  final $Res Function(GtdPersonModel) _then;

/// Create a copy of GtdPersonModel
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


/// Adds pattern-matching-related methods to [GtdPersonModel].
extension GtdPersonModelPatterns on GtdPersonModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GtdPersonModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GtdPersonModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GtdPersonModel value)  $default,){
final _that = this;
switch (_that) {
case _GtdPersonModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GtdPersonModel value)?  $default,){
final _that = this;
switch (_that) {
case _GtdPersonModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name, @JsonKey(name: 'birth_year')  int? birthYear, @JsonKey(name: 'death_year')  int? deathYear)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GtdPersonModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name, @JsonKey(name: 'birth_year')  int? birthYear, @JsonKey(name: 'death_year')  int? deathYear)  $default,) {final _that = this;
switch (_that) {
case _GtdPersonModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name, @JsonKey(name: 'birth_year')  int? birthYear, @JsonKey(name: 'death_year')  int? deathYear)?  $default,) {final _that = this;
switch (_that) {
case _GtdPersonModel() when $default != null:
return $default(_that.name,_that.birthYear,_that.deathYear);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GtdPersonModel extends GtdPersonModel {
  const _GtdPersonModel({required this.name, @JsonKey(name: 'birth_year') required this.birthYear, @JsonKey(name: 'death_year') required this.deathYear}): super._();
  factory _GtdPersonModel.fromJson(Map<String, dynamic> json) => _$GtdPersonModelFromJson(json);

@override final  String? name;
@override@JsonKey(name: 'birth_year') final  int? birthYear;
@override@JsonKey(name: 'death_year') final  int? deathYear;

/// Create a copy of GtdPersonModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GtdPersonModelCopyWith<_GtdPersonModel> get copyWith => __$GtdPersonModelCopyWithImpl<_GtdPersonModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GtdPersonModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GtdPersonModel&&(identical(other.name, name) || other.name == name)&&(identical(other.birthYear, birthYear) || other.birthYear == birthYear)&&(identical(other.deathYear, deathYear) || other.deathYear == deathYear));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,birthYear,deathYear);

@override
String toString() {
  return 'GtdPersonModel(name: $name, birthYear: $birthYear, deathYear: $deathYear)';
}


}

/// @nodoc
abstract mixin class _$GtdPersonModelCopyWith<$Res> implements $GtdPersonModelCopyWith<$Res> {
  factory _$GtdPersonModelCopyWith(_GtdPersonModel value, $Res Function(_GtdPersonModel) _then) = __$GtdPersonModelCopyWithImpl;
@override @useResult
$Res call({
 String? name,@JsonKey(name: 'birth_year') int? birthYear,@JsonKey(name: 'death_year') int? deathYear
});




}
/// @nodoc
class __$GtdPersonModelCopyWithImpl<$Res>
    implements _$GtdPersonModelCopyWith<$Res> {
  __$GtdPersonModelCopyWithImpl(this._self, this._then);

  final _GtdPersonModel _self;
  final $Res Function(_GtdPersonModel) _then;

/// Create a copy of GtdPersonModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? birthYear = freezed,Object? deathYear = freezed,}) {
  return _then(_GtdPersonModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,birthYear: freezed == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int?,deathYear: freezed == deathYear ? _self.deathYear : deathYear // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
