// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reader_progress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReaderProgressModel {

/// FK → book_resources.id
/// 1 resource = 1 progress (PRIMARY KEY)
@JsonKey(name: 'resource_id') int get resourceId;/// Vị trí đọc:
/// - EPUB: CFI
/// - PDF: page
/// - HTML: anchor
 String? get locator;/// % hoàn thành (0.0 – 1.0)
@JsonKey(name: 'progress_pct') double get progressPct;/// Timestamp lần đọc cuối (millisecondsSinceEpoch)
@IntToDatetimeCoverter()@JsonKey(name: 'last_read_at') DateTime? get lastReadAt;
/// Create a copy of ReaderProgressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReaderProgressModelCopyWith<ReaderProgressModel> get copyWith => _$ReaderProgressModelCopyWithImpl<ReaderProgressModel>(this as ReaderProgressModel, _$identity);

  /// Serializes this ReaderProgressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReaderProgressModel&&(identical(other.resourceId, resourceId) || other.resourceId == resourceId)&&(identical(other.locator, locator) || other.locator == locator)&&(identical(other.progressPct, progressPct) || other.progressPct == progressPct)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resourceId,locator,progressPct,lastReadAt);

@override
String toString() {
  return 'ReaderProgressModel(resourceId: $resourceId, locator: $locator, progressPct: $progressPct, lastReadAt: $lastReadAt)';
}


}

/// @nodoc
abstract mixin class $ReaderProgressModelCopyWith<$Res>  {
  factory $ReaderProgressModelCopyWith(ReaderProgressModel value, $Res Function(ReaderProgressModel) _then) = _$ReaderProgressModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'resource_id') int resourceId, String? locator,@JsonKey(name: 'progress_pct') double progressPct,@IntToDatetimeCoverter()@JsonKey(name: 'last_read_at') DateTime? lastReadAt
});




}
/// @nodoc
class _$ReaderProgressModelCopyWithImpl<$Res>
    implements $ReaderProgressModelCopyWith<$Res> {
  _$ReaderProgressModelCopyWithImpl(this._self, this._then);

  final ReaderProgressModel _self;
  final $Res Function(ReaderProgressModel) _then;

/// Create a copy of ReaderProgressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resourceId = null,Object? locator = freezed,Object? progressPct = null,Object? lastReadAt = freezed,}) {
  return _then(_self.copyWith(
resourceId: null == resourceId ? _self.resourceId : resourceId // ignore: cast_nullable_to_non_nullable
as int,locator: freezed == locator ? _self.locator : locator // ignore: cast_nullable_to_non_nullable
as String?,progressPct: null == progressPct ? _self.progressPct : progressPct // ignore: cast_nullable_to_non_nullable
as double,lastReadAt: freezed == lastReadAt ? _self.lastReadAt : lastReadAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReaderProgressModel].
extension ReaderProgressModelPatterns on ReaderProgressModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReaderProgressModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReaderProgressModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReaderProgressModel value)  $default,){
final _that = this;
switch (_that) {
case _ReaderProgressModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReaderProgressModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReaderProgressModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'resource_id')  int resourceId,  String? locator, @JsonKey(name: 'progress_pct')  double progressPct, @IntToDatetimeCoverter()@JsonKey(name: 'last_read_at')  DateTime? lastReadAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReaderProgressModel() when $default != null:
return $default(_that.resourceId,_that.locator,_that.progressPct,_that.lastReadAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'resource_id')  int resourceId,  String? locator, @JsonKey(name: 'progress_pct')  double progressPct, @IntToDatetimeCoverter()@JsonKey(name: 'last_read_at')  DateTime? lastReadAt)  $default,) {final _that = this;
switch (_that) {
case _ReaderProgressModel():
return $default(_that.resourceId,_that.locator,_that.progressPct,_that.lastReadAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'resource_id')  int resourceId,  String? locator, @JsonKey(name: 'progress_pct')  double progressPct, @IntToDatetimeCoverter()@JsonKey(name: 'last_read_at')  DateTime? lastReadAt)?  $default,) {final _that = this;
switch (_that) {
case _ReaderProgressModel() when $default != null:
return $default(_that.resourceId,_that.locator,_that.progressPct,_that.lastReadAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReaderProgressModel extends ReaderProgressModel {
  const _ReaderProgressModel({@JsonKey(name: 'resource_id') required this.resourceId, this.locator, @JsonKey(name: 'progress_pct') this.progressPct = 0.0, @IntToDatetimeCoverter()@JsonKey(name: 'last_read_at') this.lastReadAt}): super._();
  factory _ReaderProgressModel.fromJson(Map<String, dynamic> json) => _$ReaderProgressModelFromJson(json);

/// FK → book_resources.id
/// 1 resource = 1 progress (PRIMARY KEY)
@override@JsonKey(name: 'resource_id') final  int resourceId;
/// Vị trí đọc:
/// - EPUB: CFI
/// - PDF: page
/// - HTML: anchor
@override final  String? locator;
/// % hoàn thành (0.0 – 1.0)
@override@JsonKey(name: 'progress_pct') final  double progressPct;
/// Timestamp lần đọc cuối (millisecondsSinceEpoch)
@override@IntToDatetimeCoverter()@JsonKey(name: 'last_read_at') final  DateTime? lastReadAt;

/// Create a copy of ReaderProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReaderProgressModelCopyWith<_ReaderProgressModel> get copyWith => __$ReaderProgressModelCopyWithImpl<_ReaderProgressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReaderProgressModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReaderProgressModel&&(identical(other.resourceId, resourceId) || other.resourceId == resourceId)&&(identical(other.locator, locator) || other.locator == locator)&&(identical(other.progressPct, progressPct) || other.progressPct == progressPct)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resourceId,locator,progressPct,lastReadAt);

@override
String toString() {
  return 'ReaderProgressModel(resourceId: $resourceId, locator: $locator, progressPct: $progressPct, lastReadAt: $lastReadAt)';
}


}

/// @nodoc
abstract mixin class _$ReaderProgressModelCopyWith<$Res> implements $ReaderProgressModelCopyWith<$Res> {
  factory _$ReaderProgressModelCopyWith(_ReaderProgressModel value, $Res Function(_ReaderProgressModel) _then) = __$ReaderProgressModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'resource_id') int resourceId, String? locator,@JsonKey(name: 'progress_pct') double progressPct,@IntToDatetimeCoverter()@JsonKey(name: 'last_read_at') DateTime? lastReadAt
});




}
/// @nodoc
class __$ReaderProgressModelCopyWithImpl<$Res>
    implements _$ReaderProgressModelCopyWith<$Res> {
  __$ReaderProgressModelCopyWithImpl(this._self, this._then);

  final _ReaderProgressModel _self;
  final $Res Function(_ReaderProgressModel) _then;

/// Create a copy of ReaderProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resourceId = null,Object? locator = freezed,Object? progressPct = null,Object? lastReadAt = freezed,}) {
  return _then(_ReaderProgressModel(
resourceId: null == resourceId ? _self.resourceId : resourceId // ignore: cast_nullable_to_non_nullable
as int,locator: freezed == locator ? _self.locator : locator // ignore: cast_nullable_to_non_nullable
as String?,progressPct: null == progressPct ? _self.progressPct : progressPct // ignore: cast_nullable_to_non_nullable
as double,lastReadAt: freezed == lastReadAt ? _self.lastReadAt : lastReadAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
