// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epub_view_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EpubViewState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpubViewState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EpubViewState()';
}


}

/// @nodoc
class $EpubViewStateCopyWith<$Res>  {
$EpubViewStateCopyWith(EpubViewState _, $Res Function(EpubViewState) __);
}


/// Adds pattern-matching-related methods to [EpubViewState].
extension EpubViewStatePatterns on EpubViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EpubViewInitial value)?  initial,TResult Function( _EpubViewLoading value)?  loading,TResult Function( _EpubViewLoaded value)?  loaded,TResult Function( _EpubViewError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpubViewInitial() when initial != null:
return initial(_that);case _EpubViewLoading() when loading != null:
return loading(_that);case _EpubViewLoaded() when loaded != null:
return loaded(_that);case _EpubViewError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EpubViewInitial value)  initial,required TResult Function( _EpubViewLoading value)  loading,required TResult Function( _EpubViewLoaded value)  loaded,required TResult Function( _EpubViewError value)  error,}){
final _that = this;
switch (_that) {
case _EpubViewInitial():
return initial(_that);case _EpubViewLoading():
return loading(_that);case _EpubViewLoaded():
return loaded(_that);case _EpubViewError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EpubViewInitial value)?  initial,TResult? Function( _EpubViewLoading value)?  loading,TResult? Function( _EpubViewLoaded value)?  loaded,TResult? Function( _EpubViewError value)?  error,}){
final _that = this;
switch (_that) {
case _EpubViewInitial() when initial != null:
return initial(_that);case _EpubViewLoading() when loading != null:
return loading(_that);case _EpubViewLoaded() when loaded != null:
return loaded(_that);case _EpubViewError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( double progress)?  loading,TResult Function( File file)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpubViewInitial() when initial != null:
return initial();case _EpubViewLoading() when loading != null:
return loading(_that.progress);case _EpubViewLoaded() when loaded != null:
return loaded(_that.file);case _EpubViewError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( double progress)  loading,required TResult Function( File file)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _EpubViewInitial():
return initial();case _EpubViewLoading():
return loading(_that.progress);case _EpubViewLoaded():
return loaded(_that.file);case _EpubViewError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( double progress)?  loading,TResult? Function( File file)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _EpubViewInitial() when initial != null:
return initial();case _EpubViewLoading() when loading != null:
return loading(_that.progress);case _EpubViewLoaded() when loaded != null:
return loaded(_that.file);case _EpubViewError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _EpubViewInitial implements EpubViewState {
  const _EpubViewInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpubViewInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EpubViewState.initial()';
}


}




/// @nodoc


class _EpubViewLoading implements EpubViewState {
  const _EpubViewLoading(this.progress);
  

 final  double progress;

/// Create a copy of EpubViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpubViewLoadingCopyWith<_EpubViewLoading> get copyWith => __$EpubViewLoadingCopyWithImpl<_EpubViewLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpubViewLoading&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,progress);

@override
String toString() {
  return 'EpubViewState.loading(progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$EpubViewLoadingCopyWith<$Res> implements $EpubViewStateCopyWith<$Res> {
  factory _$EpubViewLoadingCopyWith(_EpubViewLoading value, $Res Function(_EpubViewLoading) _then) = __$EpubViewLoadingCopyWithImpl;
@useResult
$Res call({
 double progress
});




}
/// @nodoc
class __$EpubViewLoadingCopyWithImpl<$Res>
    implements _$EpubViewLoadingCopyWith<$Res> {
  __$EpubViewLoadingCopyWithImpl(this._self, this._then);

  final _EpubViewLoading _self;
  final $Res Function(_EpubViewLoading) _then;

/// Create a copy of EpubViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,}) {
  return _then(_EpubViewLoading(
null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _EpubViewLoaded implements EpubViewState {
  const _EpubViewLoaded(this.file);
  

 final  File file;

/// Create a copy of EpubViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpubViewLoadedCopyWith<_EpubViewLoaded> get copyWith => __$EpubViewLoadedCopyWithImpl<_EpubViewLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpubViewLoaded&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode => Object.hash(runtimeType,file);

@override
String toString() {
  return 'EpubViewState.loaded(file: $file)';
}


}

/// @nodoc
abstract mixin class _$EpubViewLoadedCopyWith<$Res> implements $EpubViewStateCopyWith<$Res> {
  factory _$EpubViewLoadedCopyWith(_EpubViewLoaded value, $Res Function(_EpubViewLoaded) _then) = __$EpubViewLoadedCopyWithImpl;
@useResult
$Res call({
 File file
});




}
/// @nodoc
class __$EpubViewLoadedCopyWithImpl<$Res>
    implements _$EpubViewLoadedCopyWith<$Res> {
  __$EpubViewLoadedCopyWithImpl(this._self, this._then);

  final _EpubViewLoaded _self;
  final $Res Function(_EpubViewLoaded) _then;

/// Create a copy of EpubViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? file = null,}) {
  return _then(_EpubViewLoaded(
null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

/// @nodoc


class _EpubViewError implements EpubViewState {
  const _EpubViewError({required this.message});
  

 final  String message;

/// Create a copy of EpubViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpubViewErrorCopyWith<_EpubViewError> get copyWith => __$EpubViewErrorCopyWithImpl<_EpubViewError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpubViewError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'EpubViewState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$EpubViewErrorCopyWith<$Res> implements $EpubViewStateCopyWith<$Res> {
  factory _$EpubViewErrorCopyWith(_EpubViewError value, $Res Function(_EpubViewError) _then) = __$EpubViewErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$EpubViewErrorCopyWithImpl<$Res>
    implements _$EpubViewErrorCopyWith<$Res> {
  __$EpubViewErrorCopyWithImpl(this._self, this._then);

  final _EpubViewError _self;
  final $Res Function(_EpubViewError) _then;

/// Create a copy of EpubViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_EpubViewError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
