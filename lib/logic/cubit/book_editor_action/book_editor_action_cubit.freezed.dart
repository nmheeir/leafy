// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_editor_action_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookEditorActionState {

 bool get isCoverDownloading; bool get isWorkDownloading; Uint8List? get coverBytes; String? get coverBlurHash; OLWorkResult? get olWorkResult; String? get errorMessage;
/// Create a copy of BookEditorActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookEditorActionStateCopyWith<BookEditorActionState> get copyWith => _$BookEditorActionStateCopyWithImpl<BookEditorActionState>(this as BookEditorActionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookEditorActionState&&(identical(other.isCoverDownloading, isCoverDownloading) || other.isCoverDownloading == isCoverDownloading)&&(identical(other.isWorkDownloading, isWorkDownloading) || other.isWorkDownloading == isWorkDownloading)&&const DeepCollectionEquality().equals(other.coverBytes, coverBytes)&&(identical(other.coverBlurHash, coverBlurHash) || other.coverBlurHash == coverBlurHash)&&(identical(other.olWorkResult, olWorkResult) || other.olWorkResult == olWorkResult)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isCoverDownloading,isWorkDownloading,const DeepCollectionEquality().hash(coverBytes),coverBlurHash,olWorkResult,errorMessage);

@override
String toString() {
  return 'BookEditorActionState(isCoverDownloading: $isCoverDownloading, isWorkDownloading: $isWorkDownloading, coverBytes: $coverBytes, coverBlurHash: $coverBlurHash, olWorkResult: $olWorkResult, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $BookEditorActionStateCopyWith<$Res>  {
  factory $BookEditorActionStateCopyWith(BookEditorActionState value, $Res Function(BookEditorActionState) _then) = _$BookEditorActionStateCopyWithImpl;
@useResult
$Res call({
 bool isCoverDownloading, bool isWorkDownloading, Uint8List? coverBytes, String? coverBlurHash, OLWorkResult? olWorkResult, String? errorMessage
});




}
/// @nodoc
class _$BookEditorActionStateCopyWithImpl<$Res>
    implements $BookEditorActionStateCopyWith<$Res> {
  _$BookEditorActionStateCopyWithImpl(this._self, this._then);

  final BookEditorActionState _self;
  final $Res Function(BookEditorActionState) _then;

/// Create a copy of BookEditorActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isCoverDownloading = null,Object? isWorkDownloading = null,Object? coverBytes = freezed,Object? coverBlurHash = freezed,Object? olWorkResult = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isCoverDownloading: null == isCoverDownloading ? _self.isCoverDownloading : isCoverDownloading // ignore: cast_nullable_to_non_nullable
as bool,isWorkDownloading: null == isWorkDownloading ? _self.isWorkDownloading : isWorkDownloading // ignore: cast_nullable_to_non_nullable
as bool,coverBytes: freezed == coverBytes ? _self.coverBytes : coverBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,coverBlurHash: freezed == coverBlurHash ? _self.coverBlurHash : coverBlurHash // ignore: cast_nullable_to_non_nullable
as String?,olWorkResult: freezed == olWorkResult ? _self.olWorkResult : olWorkResult // ignore: cast_nullable_to_non_nullable
as OLWorkResult?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookEditorActionState].
extension BookEditorActionStatePatterns on BookEditorActionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookEditorActionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookEditorActionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookEditorActionState value)  $default,){
final _that = this;
switch (_that) {
case _BookEditorActionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookEditorActionState value)?  $default,){
final _that = this;
switch (_that) {
case _BookEditorActionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isCoverDownloading,  bool isWorkDownloading,  Uint8List? coverBytes,  String? coverBlurHash,  OLWorkResult? olWorkResult,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookEditorActionState() when $default != null:
return $default(_that.isCoverDownloading,_that.isWorkDownloading,_that.coverBytes,_that.coverBlurHash,_that.olWorkResult,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isCoverDownloading,  bool isWorkDownloading,  Uint8List? coverBytes,  String? coverBlurHash,  OLWorkResult? olWorkResult,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _BookEditorActionState():
return $default(_that.isCoverDownloading,_that.isWorkDownloading,_that.coverBytes,_that.coverBlurHash,_that.olWorkResult,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isCoverDownloading,  bool isWorkDownloading,  Uint8List? coverBytes,  String? coverBlurHash,  OLWorkResult? olWorkResult,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _BookEditorActionState() when $default != null:
return $default(_that.isCoverDownloading,_that.isWorkDownloading,_that.coverBytes,_that.coverBlurHash,_that.olWorkResult,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _BookEditorActionState implements BookEditorActionState {
  const _BookEditorActionState({this.isCoverDownloading = false, this.isWorkDownloading = false, this.coverBytes, this.coverBlurHash, this.olWorkResult, this.errorMessage});
  

@override@JsonKey() final  bool isCoverDownloading;
@override@JsonKey() final  bool isWorkDownloading;
@override final  Uint8List? coverBytes;
@override final  String? coverBlurHash;
@override final  OLWorkResult? olWorkResult;
@override final  String? errorMessage;

/// Create a copy of BookEditorActionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookEditorActionStateCopyWith<_BookEditorActionState> get copyWith => __$BookEditorActionStateCopyWithImpl<_BookEditorActionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookEditorActionState&&(identical(other.isCoverDownloading, isCoverDownloading) || other.isCoverDownloading == isCoverDownloading)&&(identical(other.isWorkDownloading, isWorkDownloading) || other.isWorkDownloading == isWorkDownloading)&&const DeepCollectionEquality().equals(other.coverBytes, coverBytes)&&(identical(other.coverBlurHash, coverBlurHash) || other.coverBlurHash == coverBlurHash)&&(identical(other.olWorkResult, olWorkResult) || other.olWorkResult == olWorkResult)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isCoverDownloading,isWorkDownloading,const DeepCollectionEquality().hash(coverBytes),coverBlurHash,olWorkResult,errorMessage);

@override
String toString() {
  return 'BookEditorActionState(isCoverDownloading: $isCoverDownloading, isWorkDownloading: $isWorkDownloading, coverBytes: $coverBytes, coverBlurHash: $coverBlurHash, olWorkResult: $olWorkResult, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$BookEditorActionStateCopyWith<$Res> implements $BookEditorActionStateCopyWith<$Res> {
  factory _$BookEditorActionStateCopyWith(_BookEditorActionState value, $Res Function(_BookEditorActionState) _then) = __$BookEditorActionStateCopyWithImpl;
@override @useResult
$Res call({
 bool isCoverDownloading, bool isWorkDownloading, Uint8List? coverBytes, String? coverBlurHash, OLWorkResult? olWorkResult, String? errorMessage
});




}
/// @nodoc
class __$BookEditorActionStateCopyWithImpl<$Res>
    implements _$BookEditorActionStateCopyWith<$Res> {
  __$BookEditorActionStateCopyWithImpl(this._self, this._then);

  final _BookEditorActionState _self;
  final $Res Function(_BookEditorActionState) _then;

/// Create a copy of BookEditorActionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isCoverDownloading = null,Object? isWorkDownloading = null,Object? coverBytes = freezed,Object? coverBlurHash = freezed,Object? olWorkResult = freezed,Object? errorMessage = freezed,}) {
  return _then(_BookEditorActionState(
isCoverDownloading: null == isCoverDownloading ? _self.isCoverDownloading : isCoverDownloading // ignore: cast_nullable_to_non_nullable
as bool,isWorkDownloading: null == isWorkDownloading ? _self.isWorkDownloading : isWorkDownloading // ignore: cast_nullable_to_non_nullable
as bool,coverBytes: freezed == coverBytes ? _self.coverBytes : coverBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,coverBlurHash: freezed == coverBlurHash ? _self.coverBlurHash : coverBlurHash // ignore: cast_nullable_to_non_nullable
as String?,olWorkResult: freezed == olWorkResult ? _self.olWorkResult : olWorkResult // ignore: cast_nullable_to_non_nullable
as OLWorkResult?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
