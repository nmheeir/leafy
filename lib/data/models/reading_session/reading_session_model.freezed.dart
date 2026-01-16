// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReadingSessionModel {

/// UUID của session đọc (PRIMARY KEY)
 String get id;/// FK → booksTable.id
@JsonKey(name: 'resource_id') int get resourceId;/// Thời điểm bắt đầu đọc (millisecondsSinceEpoch)
@JsonKey(name: 'start_time') int get startTime;/// Thời điểm kết thúc đọc (millisecondsSinceEpoch)
@JsonKey(name: 'end_time') int get endTime;/// Thời gian đọc thực tế (ms)
@JsonKey(name: 'duration_ms') int get durationMs;/// Vị trí đọc lúc bắt đầu
@JsonKey(name: 'start_locator') String? get startLocator;/// Vị trí đọc lúc kết thúc
@JsonKey(name: 'end_locator') String? get endLocator;/// Chương đang đọc (chỉ để tham khảo / thống kê)
@JsonKey(name: 'chapter_index') int? get chapterIndex;
/// Create a copy of ReadingSessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadingSessionModelCopyWith<ReadingSessionModel> get copyWith => _$ReadingSessionModelCopyWithImpl<ReadingSessionModel>(this as ReadingSessionModel, _$identity);

  /// Serializes this ReadingSessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadingSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.resourceId, resourceId) || other.resourceId == resourceId)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs)&&(identical(other.startLocator, startLocator) || other.startLocator == startLocator)&&(identical(other.endLocator, endLocator) || other.endLocator == endLocator)&&(identical(other.chapterIndex, chapterIndex) || other.chapterIndex == chapterIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,resourceId,startTime,endTime,durationMs,startLocator,endLocator,chapterIndex);

@override
String toString() {
  return 'ReadingSessionModel(id: $id, resourceId: $resourceId, startTime: $startTime, endTime: $endTime, durationMs: $durationMs, startLocator: $startLocator, endLocator: $endLocator, chapterIndex: $chapterIndex)';
}


}

/// @nodoc
abstract mixin class $ReadingSessionModelCopyWith<$Res>  {
  factory $ReadingSessionModelCopyWith(ReadingSessionModel value, $Res Function(ReadingSessionModel) _then) = _$ReadingSessionModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'resource_id') int resourceId,@JsonKey(name: 'start_time') int startTime,@JsonKey(name: 'end_time') int endTime,@JsonKey(name: 'duration_ms') int durationMs,@JsonKey(name: 'start_locator') String? startLocator,@JsonKey(name: 'end_locator') String? endLocator,@JsonKey(name: 'chapter_index') int? chapterIndex
});




}
/// @nodoc
class _$ReadingSessionModelCopyWithImpl<$Res>
    implements $ReadingSessionModelCopyWith<$Res> {
  _$ReadingSessionModelCopyWithImpl(this._self, this._then);

  final ReadingSessionModel _self;
  final $Res Function(ReadingSessionModel) _then;

/// Create a copy of ReadingSessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? resourceId = null,Object? startTime = null,Object? endTime = null,Object? durationMs = null,Object? startLocator = freezed,Object? endLocator = freezed,Object? chapterIndex = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,resourceId: null == resourceId ? _self.resourceId : resourceId // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as int,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as int,durationMs: null == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int,startLocator: freezed == startLocator ? _self.startLocator : startLocator // ignore: cast_nullable_to_non_nullable
as String?,endLocator: freezed == endLocator ? _self.endLocator : endLocator // ignore: cast_nullable_to_non_nullable
as String?,chapterIndex: freezed == chapterIndex ? _self.chapterIndex : chapterIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReadingSessionModel].
extension ReadingSessionModelPatterns on ReadingSessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReadingSessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReadingSessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReadingSessionModel value)  $default,){
final _that = this;
switch (_that) {
case _ReadingSessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReadingSessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReadingSessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'resource_id')  int resourceId, @JsonKey(name: 'start_time')  int startTime, @JsonKey(name: 'end_time')  int endTime, @JsonKey(name: 'duration_ms')  int durationMs, @JsonKey(name: 'start_locator')  String? startLocator, @JsonKey(name: 'end_locator')  String? endLocator, @JsonKey(name: 'chapter_index')  int? chapterIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReadingSessionModel() when $default != null:
return $default(_that.id,_that.resourceId,_that.startTime,_that.endTime,_that.durationMs,_that.startLocator,_that.endLocator,_that.chapterIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'resource_id')  int resourceId, @JsonKey(name: 'start_time')  int startTime, @JsonKey(name: 'end_time')  int endTime, @JsonKey(name: 'duration_ms')  int durationMs, @JsonKey(name: 'start_locator')  String? startLocator, @JsonKey(name: 'end_locator')  String? endLocator, @JsonKey(name: 'chapter_index')  int? chapterIndex)  $default,) {final _that = this;
switch (_that) {
case _ReadingSessionModel():
return $default(_that.id,_that.resourceId,_that.startTime,_that.endTime,_that.durationMs,_that.startLocator,_that.endLocator,_that.chapterIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'resource_id')  int resourceId, @JsonKey(name: 'start_time')  int startTime, @JsonKey(name: 'end_time')  int endTime, @JsonKey(name: 'duration_ms')  int durationMs, @JsonKey(name: 'start_locator')  String? startLocator, @JsonKey(name: 'end_locator')  String? endLocator, @JsonKey(name: 'chapter_index')  int? chapterIndex)?  $default,) {final _that = this;
switch (_that) {
case _ReadingSessionModel() when $default != null:
return $default(_that.id,_that.resourceId,_that.startTime,_that.endTime,_that.durationMs,_that.startLocator,_that.endLocator,_that.chapterIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReadingSessionModel implements ReadingSessionModel {
  const _ReadingSessionModel({required this.id, @JsonKey(name: 'resource_id') required this.resourceId, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, @JsonKey(name: 'duration_ms') required this.durationMs, @JsonKey(name: 'start_locator') this.startLocator, @JsonKey(name: 'end_locator') this.endLocator, @JsonKey(name: 'chapter_index') this.chapterIndex});
  factory _ReadingSessionModel.fromJson(Map<String, dynamic> json) => _$ReadingSessionModelFromJson(json);

/// UUID của session đọc (PRIMARY KEY)
@override final  String id;
/// FK → booksTable.id
@override@JsonKey(name: 'resource_id') final  int resourceId;
/// Thời điểm bắt đầu đọc (millisecondsSinceEpoch)
@override@JsonKey(name: 'start_time') final  int startTime;
/// Thời điểm kết thúc đọc (millisecondsSinceEpoch)
@override@JsonKey(name: 'end_time') final  int endTime;
/// Thời gian đọc thực tế (ms)
@override@JsonKey(name: 'duration_ms') final  int durationMs;
/// Vị trí đọc lúc bắt đầu
@override@JsonKey(name: 'start_locator') final  String? startLocator;
/// Vị trí đọc lúc kết thúc
@override@JsonKey(name: 'end_locator') final  String? endLocator;
/// Chương đang đọc (chỉ để tham khảo / thống kê)
@override@JsonKey(name: 'chapter_index') final  int? chapterIndex;

/// Create a copy of ReadingSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadingSessionModelCopyWith<_ReadingSessionModel> get copyWith => __$ReadingSessionModelCopyWithImpl<_ReadingSessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReadingSessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadingSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.resourceId, resourceId) || other.resourceId == resourceId)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs)&&(identical(other.startLocator, startLocator) || other.startLocator == startLocator)&&(identical(other.endLocator, endLocator) || other.endLocator == endLocator)&&(identical(other.chapterIndex, chapterIndex) || other.chapterIndex == chapterIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,resourceId,startTime,endTime,durationMs,startLocator,endLocator,chapterIndex);

@override
String toString() {
  return 'ReadingSessionModel(id: $id, resourceId: $resourceId, startTime: $startTime, endTime: $endTime, durationMs: $durationMs, startLocator: $startLocator, endLocator: $endLocator, chapterIndex: $chapterIndex)';
}


}

/// @nodoc
abstract mixin class _$ReadingSessionModelCopyWith<$Res> implements $ReadingSessionModelCopyWith<$Res> {
  factory _$ReadingSessionModelCopyWith(_ReadingSessionModel value, $Res Function(_ReadingSessionModel) _then) = __$ReadingSessionModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'resource_id') int resourceId,@JsonKey(name: 'start_time') int startTime,@JsonKey(name: 'end_time') int endTime,@JsonKey(name: 'duration_ms') int durationMs,@JsonKey(name: 'start_locator') String? startLocator,@JsonKey(name: 'end_locator') String? endLocator,@JsonKey(name: 'chapter_index') int? chapterIndex
});




}
/// @nodoc
class __$ReadingSessionModelCopyWithImpl<$Res>
    implements _$ReadingSessionModelCopyWith<$Res> {
  __$ReadingSessionModelCopyWithImpl(this._self, this._then);

  final _ReadingSessionModel _self;
  final $Res Function(_ReadingSessionModel) _then;

/// Create a copy of ReadingSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? resourceId = null,Object? startTime = null,Object? endTime = null,Object? durationMs = null,Object? startLocator = freezed,Object? endLocator = freezed,Object? chapterIndex = freezed,}) {
  return _then(_ReadingSessionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,resourceId: null == resourceId ? _self.resourceId : resourceId // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as int,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as int,durationMs: null == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int,startLocator: freezed == startLocator ? _self.startLocator : startLocator // ignore: cast_nullable_to_non_nullable
as String?,endLocator: freezed == endLocator ? _self.endLocator : endLocator // ignore: cast_nullable_to_non_nullable
as String?,chapterIndex: freezed == chapterIndex ? _self.chapterIndex : chapterIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
