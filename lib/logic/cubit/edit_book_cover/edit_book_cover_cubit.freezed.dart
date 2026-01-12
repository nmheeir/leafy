// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_book_cover_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditBookCoverState {

 EditCoverStatus get status; Uint8List? get coverData; String? get blurHash; String? get errorMessage;
/// Create a copy of EditBookCoverState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditBookCoverStateCopyWith<EditBookCoverState> get copyWith => _$EditBookCoverStateCopyWithImpl<EditBookCoverState>(this as EditBookCoverState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditBookCoverState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.coverData, coverData)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(coverData),blurHash,errorMessage);

@override
String toString() {
  return 'EditBookCoverState(status: $status, coverData: $coverData, blurHash: $blurHash, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $EditBookCoverStateCopyWith<$Res>  {
  factory $EditBookCoverStateCopyWith(EditBookCoverState value, $Res Function(EditBookCoverState) _then) = _$EditBookCoverStateCopyWithImpl;
@useResult
$Res call({
 EditCoverStatus status, Uint8List? coverData, String? blurHash, String? errorMessage
});




}
/// @nodoc
class _$EditBookCoverStateCopyWithImpl<$Res>
    implements $EditBookCoverStateCopyWith<$Res> {
  _$EditBookCoverStateCopyWithImpl(this._self, this._then);

  final EditBookCoverState _self;
  final $Res Function(EditBookCoverState) _then;

/// Create a copy of EditBookCoverState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? coverData = freezed,Object? blurHash = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditCoverStatus,coverData: freezed == coverData ? _self.coverData : coverData // ignore: cast_nullable_to_non_nullable
as Uint8List?,blurHash: freezed == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EditBookCoverState].
extension EditBookCoverStatePatterns on EditBookCoverState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditBookCoverState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditBookCoverState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditBookCoverState value)  $default,){
final _that = this;
switch (_that) {
case _EditBookCoverState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditBookCoverState value)?  $default,){
final _that = this;
switch (_that) {
case _EditBookCoverState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EditCoverStatus status,  Uint8List? coverData,  String? blurHash,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditBookCoverState() when $default != null:
return $default(_that.status,_that.coverData,_that.blurHash,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EditCoverStatus status,  Uint8List? coverData,  String? blurHash,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _EditBookCoverState():
return $default(_that.status,_that.coverData,_that.blurHash,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EditCoverStatus status,  Uint8List? coverData,  String? blurHash,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _EditBookCoverState() when $default != null:
return $default(_that.status,_that.coverData,_that.blurHash,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _EditBookCoverState implements EditBookCoverState {
  const _EditBookCoverState({this.status = EditCoverStatus.initial, this.coverData, this.blurHash, this.errorMessage});
  

@override@JsonKey() final  EditCoverStatus status;
@override final  Uint8List? coverData;
@override final  String? blurHash;
@override final  String? errorMessage;

/// Create a copy of EditBookCoverState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditBookCoverStateCopyWith<_EditBookCoverState> get copyWith => __$EditBookCoverStateCopyWithImpl<_EditBookCoverState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditBookCoverState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.coverData, coverData)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(coverData),blurHash,errorMessage);

@override
String toString() {
  return 'EditBookCoverState(status: $status, coverData: $coverData, blurHash: $blurHash, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$EditBookCoverStateCopyWith<$Res> implements $EditBookCoverStateCopyWith<$Res> {
  factory _$EditBookCoverStateCopyWith(_EditBookCoverState value, $Res Function(_EditBookCoverState) _then) = __$EditBookCoverStateCopyWithImpl;
@override @useResult
$Res call({
 EditCoverStatus status, Uint8List? coverData, String? blurHash, String? errorMessage
});




}
/// @nodoc
class __$EditBookCoverStateCopyWithImpl<$Res>
    implements _$EditBookCoverStateCopyWith<$Res> {
  __$EditBookCoverStateCopyWithImpl(this._self, this._then);

  final _EditBookCoverState _self;
  final $Res Function(_EditBookCoverState) _then;

/// Create a copy of EditBookCoverState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? coverData = freezed,Object? blurHash = freezed,Object? errorMessage = freezed,}) {
  return _then(_EditBookCoverState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditCoverStatus,coverData: freezed == coverData ? _self.coverData : coverData // ignore: cast_nullable_to_non_nullable
as Uint8List?,blurHash: freezed == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
