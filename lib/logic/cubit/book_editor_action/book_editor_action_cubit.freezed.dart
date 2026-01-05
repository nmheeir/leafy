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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookEditorActionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookEditorActionState()';
}


}

/// @nodoc
class $BookEditorActionStateCopyWith<$Res>  {
$BookEditorActionStateCopyWith(BookEditorActionState _, $Res Function(BookEditorActionState) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle value)?  idle,TResult Function( _CoverDownloading value)?  coverDownloading,TResult Function( _CoverDownloaded value)?  coverDownloaded,TResult Function( _WorkDownloaded value)?  workDownloaded,TResult Function( _ValidationFailure value)?  validationFailure,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _CoverDownloading() when coverDownloading != null:
return coverDownloading(_that);case _CoverDownloaded() when coverDownloaded != null:
return coverDownloaded(_that);case _WorkDownloaded() when workDownloaded != null:
return workDownloaded(_that);case _ValidationFailure() when validationFailure != null:
return validationFailure(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle value)  idle,required TResult Function( _CoverDownloading value)  coverDownloading,required TResult Function( _CoverDownloaded value)  coverDownloaded,required TResult Function( _WorkDownloaded value)  workDownloaded,required TResult Function( _ValidationFailure value)  validationFailure,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _CoverDownloading():
return coverDownloading(_that);case _CoverDownloaded():
return coverDownloaded(_that);case _WorkDownloaded():
return workDownloaded(_that);case _ValidationFailure():
return validationFailure(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle value)?  idle,TResult? Function( _CoverDownloading value)?  coverDownloading,TResult? Function( _CoverDownloaded value)?  coverDownloaded,TResult? Function( _WorkDownloaded value)?  workDownloaded,TResult? Function( _ValidationFailure value)?  validationFailure,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _CoverDownloading() when coverDownloading != null:
return coverDownloading(_that);case _CoverDownloaded() when coverDownloaded != null:
return coverDownloaded(_that);case _WorkDownloaded() when workDownloaded != null:
return workDownloaded(_that);case _ValidationFailure() when validationFailure != null:
return validationFailure(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  coverDownloading,TResult Function( Uint8List bytes,  String blurHash)?  coverDownloaded,TResult Function( OLWorkResult olWorkResult)?  workDownloaded,TResult Function( String message)?  validationFailure,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _CoverDownloading() when coverDownloading != null:
return coverDownloading();case _CoverDownloaded() when coverDownloaded != null:
return coverDownloaded(_that.bytes,_that.blurHash);case _WorkDownloaded() when workDownloaded != null:
return workDownloaded(_that.olWorkResult);case _ValidationFailure() when validationFailure != null:
return validationFailure(_that.message);case _Failure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  coverDownloading,required TResult Function( Uint8List bytes,  String blurHash)  coverDownloaded,required TResult Function( OLWorkResult olWorkResult)  workDownloaded,required TResult Function( String message)  validationFailure,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _CoverDownloading():
return coverDownloading();case _CoverDownloaded():
return coverDownloaded(_that.bytes,_that.blurHash);case _WorkDownloaded():
return workDownloaded(_that.olWorkResult);case _ValidationFailure():
return validationFailure(_that.message);case _Failure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  coverDownloading,TResult? Function( Uint8List bytes,  String blurHash)?  coverDownloaded,TResult? Function( OLWorkResult olWorkResult)?  workDownloaded,TResult? Function( String message)?  validationFailure,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _CoverDownloading() when coverDownloading != null:
return coverDownloading();case _CoverDownloaded() when coverDownloaded != null:
return coverDownloaded(_that.bytes,_that.blurHash);case _WorkDownloaded() when workDownloaded != null:
return workDownloaded(_that.olWorkResult);case _ValidationFailure() when validationFailure != null:
return validationFailure(_that.message);case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Idle implements BookEditorActionState {
  const _Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookEditorActionState.idle()';
}


}




/// @nodoc


class _CoverDownloading implements BookEditorActionState {
  const _CoverDownloading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoverDownloading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookEditorActionState.coverDownloading()';
}


}




/// @nodoc


class _CoverDownloaded implements BookEditorActionState {
  const _CoverDownloaded({required this.bytes, required this.blurHash});
  

 final  Uint8List bytes;
 final  String blurHash;

/// Create a copy of BookEditorActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoverDownloadedCopyWith<_CoverDownloaded> get copyWith => __$CoverDownloadedCopyWithImpl<_CoverDownloaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoverDownloaded&&const DeepCollectionEquality().equals(other.bytes, bytes)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bytes),blurHash);

@override
String toString() {
  return 'BookEditorActionState.coverDownloaded(bytes: $bytes, blurHash: $blurHash)';
}


}

/// @nodoc
abstract mixin class _$CoverDownloadedCopyWith<$Res> implements $BookEditorActionStateCopyWith<$Res> {
  factory _$CoverDownloadedCopyWith(_CoverDownloaded value, $Res Function(_CoverDownloaded) _then) = __$CoverDownloadedCopyWithImpl;
@useResult
$Res call({
 Uint8List bytes, String blurHash
});




}
/// @nodoc
class __$CoverDownloadedCopyWithImpl<$Res>
    implements _$CoverDownloadedCopyWith<$Res> {
  __$CoverDownloadedCopyWithImpl(this._self, this._then);

  final _CoverDownloaded _self;
  final $Res Function(_CoverDownloaded) _then;

/// Create a copy of BookEditorActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bytes = null,Object? blurHash = null,}) {
  return _then(_CoverDownloaded(
bytes: null == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as Uint8List,blurHash: null == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _WorkDownloaded implements BookEditorActionState {
  const _WorkDownloaded({required this.olWorkResult});
  

 final  OLWorkResult olWorkResult;

/// Create a copy of BookEditorActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkDownloadedCopyWith<_WorkDownloaded> get copyWith => __$WorkDownloadedCopyWithImpl<_WorkDownloaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkDownloaded&&(identical(other.olWorkResult, olWorkResult) || other.olWorkResult == olWorkResult));
}


@override
int get hashCode => Object.hash(runtimeType,olWorkResult);

@override
String toString() {
  return 'BookEditorActionState.workDownloaded(olWorkResult: $olWorkResult)';
}


}

/// @nodoc
abstract mixin class _$WorkDownloadedCopyWith<$Res> implements $BookEditorActionStateCopyWith<$Res> {
  factory _$WorkDownloadedCopyWith(_WorkDownloaded value, $Res Function(_WorkDownloaded) _then) = __$WorkDownloadedCopyWithImpl;
@useResult
$Res call({
 OLWorkResult olWorkResult
});




}
/// @nodoc
class __$WorkDownloadedCopyWithImpl<$Res>
    implements _$WorkDownloadedCopyWith<$Res> {
  __$WorkDownloadedCopyWithImpl(this._self, this._then);

  final _WorkDownloaded _self;
  final $Res Function(_WorkDownloaded) _then;

/// Create a copy of BookEditorActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? olWorkResult = null,}) {
  return _then(_WorkDownloaded(
olWorkResult: null == olWorkResult ? _self.olWorkResult : olWorkResult // ignore: cast_nullable_to_non_nullable
as OLWorkResult,
  ));
}


}

/// @nodoc


class _ValidationFailure implements BookEditorActionState {
  const _ValidationFailure(this.message);
  

 final  String message;

/// Create a copy of BookEditorActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationFailureCopyWith<_ValidationFailure> get copyWith => __$ValidationFailureCopyWithImpl<_ValidationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BookEditorActionState.validationFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ValidationFailureCopyWith<$Res> implements $BookEditorActionStateCopyWith<$Res> {
  factory _$ValidationFailureCopyWith(_ValidationFailure value, $Res Function(_ValidationFailure) _then) = __$ValidationFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ValidationFailureCopyWithImpl<$Res>
    implements _$ValidationFailureCopyWith<$Res> {
  __$ValidationFailureCopyWithImpl(this._self, this._then);

  final _ValidationFailure _self;
  final $Res Function(_ValidationFailure) _then;

/// Create a copy of BookEditorActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ValidationFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Failure implements BookEditorActionState {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of BookEditorActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BookEditorActionState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $BookEditorActionStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of BookEditorActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
