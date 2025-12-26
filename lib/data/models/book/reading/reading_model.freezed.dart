// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReadingModel {

@JsonKey(name: 'start_date') DateTime? get startDate;@JsonKey(name: 'end_date') DateTime? get finishDate;@JsonKey(name: 'reading_time_ms') int get readingTimeMs;
/// Create a copy of ReadingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadingModelCopyWith<ReadingModel> get copyWith => _$ReadingModelCopyWithImpl<ReadingModel>(this as ReadingModel, _$identity);

  /// Serializes this ReadingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadingModel&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.finishDate, finishDate) || other.finishDate == finishDate)&&(identical(other.readingTimeMs, readingTimeMs) || other.readingTimeMs == readingTimeMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,finishDate,readingTimeMs);

@override
String toString() {
  return 'ReadingModel(startDate: $startDate, finishDate: $finishDate, readingTimeMs: $readingTimeMs)';
}


}

/// @nodoc
abstract mixin class $ReadingModelCopyWith<$Res>  {
  factory $ReadingModelCopyWith(ReadingModel value, $Res Function(ReadingModel) _then) = _$ReadingModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'start_date') DateTime? startDate,@JsonKey(name: 'end_date') DateTime? finishDate,@JsonKey(name: 'reading_time_ms') int readingTimeMs
});




}
/// @nodoc
class _$ReadingModelCopyWithImpl<$Res>
    implements $ReadingModelCopyWith<$Res> {
  _$ReadingModelCopyWithImpl(this._self, this._then);

  final ReadingModel _self;
  final $Res Function(ReadingModel) _then;

/// Create a copy of ReadingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = freezed,Object? finishDate = freezed,Object? readingTimeMs = null,}) {
  return _then(_self.copyWith(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,finishDate: freezed == finishDate ? _self.finishDate : finishDate // ignore: cast_nullable_to_non_nullable
as DateTime?,readingTimeMs: null == readingTimeMs ? _self.readingTimeMs : readingTimeMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReadingModel].
extension ReadingModelPatterns on ReadingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReadingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReadingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReadingModel value)  $default,){
final _that = this;
switch (_that) {
case _ReadingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReadingModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReadingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'start_date')  DateTime? startDate, @JsonKey(name: 'end_date')  DateTime? finishDate, @JsonKey(name: 'reading_time_ms')  int readingTimeMs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReadingModel() when $default != null:
return $default(_that.startDate,_that.finishDate,_that.readingTimeMs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'start_date')  DateTime? startDate, @JsonKey(name: 'end_date')  DateTime? finishDate, @JsonKey(name: 'reading_time_ms')  int readingTimeMs)  $default,) {final _that = this;
switch (_that) {
case _ReadingModel():
return $default(_that.startDate,_that.finishDate,_that.readingTimeMs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'start_date')  DateTime? startDate, @JsonKey(name: 'end_date')  DateTime? finishDate, @JsonKey(name: 'reading_time_ms')  int readingTimeMs)?  $default,) {final _that = this;
switch (_that) {
case _ReadingModel() when $default != null:
return $default(_that.startDate,_that.finishDate,_that.readingTimeMs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReadingModel extends ReadingModel {
  const _ReadingModel({@JsonKey(name: 'start_date') this.startDate, @JsonKey(name: 'end_date') this.finishDate, @JsonKey(name: 'reading_time_ms') this.readingTimeMs = 0}): super._();
  factory _ReadingModel.fromJson(Map<String, dynamic> json) => _$ReadingModelFromJson(json);

@override@JsonKey(name: 'start_date') final  DateTime? startDate;
@override@JsonKey(name: 'end_date') final  DateTime? finishDate;
@override@JsonKey(name: 'reading_time_ms') final  int readingTimeMs;

/// Create a copy of ReadingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadingModelCopyWith<_ReadingModel> get copyWith => __$ReadingModelCopyWithImpl<_ReadingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReadingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadingModel&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.finishDate, finishDate) || other.finishDate == finishDate)&&(identical(other.readingTimeMs, readingTimeMs) || other.readingTimeMs == readingTimeMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,finishDate,readingTimeMs);

@override
String toString() {
  return 'ReadingModel(startDate: $startDate, finishDate: $finishDate, readingTimeMs: $readingTimeMs)';
}


}

/// @nodoc
abstract mixin class _$ReadingModelCopyWith<$Res> implements $ReadingModelCopyWith<$Res> {
  factory _$ReadingModelCopyWith(_ReadingModel value, $Res Function(_ReadingModel) _then) = __$ReadingModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'start_date') DateTime? startDate,@JsonKey(name: 'end_date') DateTime? finishDate,@JsonKey(name: 'reading_time_ms') int readingTimeMs
});




}
/// @nodoc
class __$ReadingModelCopyWithImpl<$Res>
    implements _$ReadingModelCopyWith<$Res> {
  __$ReadingModelCopyWithImpl(this._self, this._then);

  final _ReadingModel _self;
  final $Res Function(_ReadingModel) _then;

/// Create a copy of ReadingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = freezed,Object? finishDate = freezed,Object? readingTimeMs = null,}) {
  return _then(_ReadingModel(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,finishDate: freezed == finishDate ? _self.finishDate : finishDate // ignore: cast_nullable_to_non_nullable
as DateTime?,readingTimeMs: null == readingTimeMs ? _self.readingTimeMs : readingTimeMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
