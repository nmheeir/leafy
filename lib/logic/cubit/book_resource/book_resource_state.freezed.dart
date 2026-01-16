// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_resource_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookResourceState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookResourceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookResourceState()';
}


}

/// @nodoc
class $BookResourceStateCopyWith<$Res>  {
$BookResourceStateCopyWith(BookResourceState _, $Res Function(BookResourceState) __);
}


/// Adds pattern-matching-related methods to [BookResourceState].
extension BookResourceStatePatterns on BookResourceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,TResult Function( _Downloading value)?  downloading,TResult Function( _Importing value)?  importing,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _Downloading() when downloading != null:
return downloading(_that);case _Importing() when importing != null:
return importing(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,required TResult Function( _Downloading value)  downloading,required TResult Function( _Importing value)  importing,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _Downloading():
return downloading(_that);case _Importing():
return importing(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,TResult? Function( _Downloading value)?  downloading,TResult? Function( _Importing value)?  importing,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _Downloading() when downloading != null:
return downloading(_that);case _Importing() when importing != null:
return importing(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<BookResource> resources)?  success,TResult Function( String message)?  failure,TResult Function( String resourceUuid,  double progress)?  downloading,TResult Function()?  importing,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.resources);case _Failure() when failure != null:
return failure(_that.message);case _Downloading() when downloading != null:
return downloading(_that.resourceUuid,_that.progress);case _Importing() when importing != null:
return importing();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<BookResource> resources)  success,required TResult Function( String message)  failure,required TResult Function( String resourceUuid,  double progress)  downloading,required TResult Function()  importing,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.resources);case _Failure():
return failure(_that.message);case _Downloading():
return downloading(_that.resourceUuid,_that.progress);case _Importing():
return importing();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<BookResource> resources)?  success,TResult? Function( String message)?  failure,TResult? Function( String resourceUuid,  double progress)?  downloading,TResult? Function()?  importing,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.resources);case _Failure() when failure != null:
return failure(_that.message);case _Downloading() when downloading != null:
return downloading(_that.resourceUuid,_that.progress);case _Importing() when importing != null:
return importing();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements BookResourceState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookResourceState.initial()';
}


}




/// @nodoc


class _Loading implements BookResourceState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookResourceState.loading()';
}


}




/// @nodoc


class _Success implements BookResourceState {
  const _Success(final  List<BookResource> resources): _resources = resources;
  

 final  List<BookResource> _resources;
 List<BookResource> get resources {
  if (_resources is EqualUnmodifiableListView) return _resources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_resources);
}


/// Create a copy of BookResourceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._resources, _resources));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_resources));

@override
String toString() {
  return 'BookResourceState.success(resources: $resources)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $BookResourceStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<BookResource> resources
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of BookResourceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resources = null,}) {
  return _then(_Success(
null == resources ? _self._resources : resources // ignore: cast_nullable_to_non_nullable
as List<BookResource>,
  ));
}


}

/// @nodoc


class _Failure implements BookResourceState {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of BookResourceState
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
  return 'BookResourceState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $BookResourceStateCopyWith<$Res> {
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

/// Create a copy of BookResourceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Downloading implements BookResourceState {
  const _Downloading(this.resourceUuid, this.progress);
  

 final  String resourceUuid;
 final  double progress;

/// Create a copy of BookResourceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadingCopyWith<_Downloading> get copyWith => __$DownloadingCopyWithImpl<_Downloading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Downloading&&(identical(other.resourceUuid, resourceUuid) || other.resourceUuid == resourceUuid)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,resourceUuid,progress);

@override
String toString() {
  return 'BookResourceState.downloading(resourceUuid: $resourceUuid, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$DownloadingCopyWith<$Res> implements $BookResourceStateCopyWith<$Res> {
  factory _$DownloadingCopyWith(_Downloading value, $Res Function(_Downloading) _then) = __$DownloadingCopyWithImpl;
@useResult
$Res call({
 String resourceUuid, double progress
});




}
/// @nodoc
class __$DownloadingCopyWithImpl<$Res>
    implements _$DownloadingCopyWith<$Res> {
  __$DownloadingCopyWithImpl(this._self, this._then);

  final _Downloading _self;
  final $Res Function(_Downloading) _then;

/// Create a copy of BookResourceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resourceUuid = null,Object? progress = null,}) {
  return _then(_Downloading(
null == resourceUuid ? _self.resourceUuid : resourceUuid // ignore: cast_nullable_to_non_nullable
as String,null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Importing implements BookResourceState {
  const _Importing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Importing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookResourceState.importing()';
}


}




// dart format on
