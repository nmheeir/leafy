// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {

 String? get message;
/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this as Failure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res>  {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ServerFailure value)?  server,TResult Function( _ConnectionFailure value)?  connection,TResult Function( _CacheFailure value)?  cache,TResult Function( _DatabaseFailure value)?  database,TResult Function( _UnexpectedFailure value)?  unexpected,TResult Function( _NotFoundFailure value)?  notFound,TResult Function( _ParseFailure value)?  parse,TResult Function( _PermissionFailure value)?  permission,TResult Function( _RateLimitFailure value)?  rateLimit,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerFailure() when server != null:
return server(_that);case _ConnectionFailure() when connection != null:
return connection(_that);case _CacheFailure() when cache != null:
return cache(_that);case _DatabaseFailure() when database != null:
return database(_that);case _UnexpectedFailure() when unexpected != null:
return unexpected(_that);case _NotFoundFailure() when notFound != null:
return notFound(_that);case _ParseFailure() when parse != null:
return parse(_that);case _PermissionFailure() when permission != null:
return permission(_that);case _RateLimitFailure() when rateLimit != null:
return rateLimit(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ServerFailure value)  server,required TResult Function( _ConnectionFailure value)  connection,required TResult Function( _CacheFailure value)  cache,required TResult Function( _DatabaseFailure value)  database,required TResult Function( _UnexpectedFailure value)  unexpected,required TResult Function( _NotFoundFailure value)  notFound,required TResult Function( _ParseFailure value)  parse,required TResult Function( _PermissionFailure value)  permission,required TResult Function( _RateLimitFailure value)  rateLimit,}){
final _that = this;
switch (_that) {
case _ServerFailure():
return server(_that);case _ConnectionFailure():
return connection(_that);case _CacheFailure():
return cache(_that);case _DatabaseFailure():
return database(_that);case _UnexpectedFailure():
return unexpected(_that);case _NotFoundFailure():
return notFound(_that);case _ParseFailure():
return parse(_that);case _PermissionFailure():
return permission(_that);case _RateLimitFailure():
return rateLimit(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ServerFailure value)?  server,TResult? Function( _ConnectionFailure value)?  connection,TResult? Function( _CacheFailure value)?  cache,TResult? Function( _DatabaseFailure value)?  database,TResult? Function( _UnexpectedFailure value)?  unexpected,TResult? Function( _NotFoundFailure value)?  notFound,TResult? Function( _ParseFailure value)?  parse,TResult? Function( _PermissionFailure value)?  permission,TResult? Function( _RateLimitFailure value)?  rateLimit,}){
final _that = this;
switch (_that) {
case _ServerFailure() when server != null:
return server(_that);case _ConnectionFailure() when connection != null:
return connection(_that);case _CacheFailure() when cache != null:
return cache(_that);case _DatabaseFailure() when database != null:
return database(_that);case _UnexpectedFailure() when unexpected != null:
return unexpected(_that);case _NotFoundFailure() when notFound != null:
return notFound(_that);case _ParseFailure() when parse != null:
return parse(_that);case _PermissionFailure() when permission != null:
return permission(_that);case _RateLimitFailure() when rateLimit != null:
return rateLimit(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? message)?  server,TResult Function( String? message)?  connection,TResult Function( String? message)?  cache,TResult Function( String? message)?  database,TResult Function( String? message)?  unexpected,TResult Function( String? message)?  notFound,TResult Function( String? message)?  parse,TResult Function( String? message)?  permission,TResult Function( String? message)?  rateLimit,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerFailure() when server != null:
return server(_that.message);case _ConnectionFailure() when connection != null:
return connection(_that.message);case _CacheFailure() when cache != null:
return cache(_that.message);case _DatabaseFailure() when database != null:
return database(_that.message);case _UnexpectedFailure() when unexpected != null:
return unexpected(_that.message);case _NotFoundFailure() when notFound != null:
return notFound(_that.message);case _ParseFailure() when parse != null:
return parse(_that.message);case _PermissionFailure() when permission != null:
return permission(_that.message);case _RateLimitFailure() when rateLimit != null:
return rateLimit(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? message)  server,required TResult Function( String? message)  connection,required TResult Function( String? message)  cache,required TResult Function( String? message)  database,required TResult Function( String? message)  unexpected,required TResult Function( String? message)  notFound,required TResult Function( String? message)  parse,required TResult Function( String? message)  permission,required TResult Function( String? message)  rateLimit,}) {final _that = this;
switch (_that) {
case _ServerFailure():
return server(_that.message);case _ConnectionFailure():
return connection(_that.message);case _CacheFailure():
return cache(_that.message);case _DatabaseFailure():
return database(_that.message);case _UnexpectedFailure():
return unexpected(_that.message);case _NotFoundFailure():
return notFound(_that.message);case _ParseFailure():
return parse(_that.message);case _PermissionFailure():
return permission(_that.message);case _RateLimitFailure():
return rateLimit(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? message)?  server,TResult? Function( String? message)?  connection,TResult? Function( String? message)?  cache,TResult? Function( String? message)?  database,TResult? Function( String? message)?  unexpected,TResult? Function( String? message)?  notFound,TResult? Function( String? message)?  parse,TResult? Function( String? message)?  permission,TResult? Function( String? message)?  rateLimit,}) {final _that = this;
switch (_that) {
case _ServerFailure() when server != null:
return server(_that.message);case _ConnectionFailure() when connection != null:
return connection(_that.message);case _CacheFailure() when cache != null:
return cache(_that.message);case _DatabaseFailure() when database != null:
return database(_that.message);case _UnexpectedFailure() when unexpected != null:
return unexpected(_that.message);case _NotFoundFailure() when notFound != null:
return notFound(_that.message);case _ParseFailure() when parse != null:
return parse(_that.message);case _PermissionFailure() when permission != null:
return permission(_that.message);case _RateLimitFailure() when rateLimit != null:
return rateLimit(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ServerFailure implements Failure {
  const _ServerFailure([this.message]);
  

@override final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerFailureCopyWith<_ServerFailure> get copyWith => __$ServerFailureCopyWithImpl<_ServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.server(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ServerFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$ServerFailureCopyWith(_ServerFailure value, $Res Function(_ServerFailure) _then) = __$ServerFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$ServerFailureCopyWithImpl<$Res>
    implements _$ServerFailureCopyWith<$Res> {
  __$ServerFailureCopyWithImpl(this._self, this._then);

  final _ServerFailure _self;
  final $Res Function(_ServerFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_ServerFailure(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ConnectionFailure implements Failure {
  const _ConnectionFailure([this.message]);
  

@override final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionFailureCopyWith<_ConnectionFailure> get copyWith => __$ConnectionFailureCopyWithImpl<_ConnectionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.connection(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ConnectionFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$ConnectionFailureCopyWith(_ConnectionFailure value, $Res Function(_ConnectionFailure) _then) = __$ConnectionFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$ConnectionFailureCopyWithImpl<$Res>
    implements _$ConnectionFailureCopyWith<$Res> {
  __$ConnectionFailureCopyWithImpl(this._self, this._then);

  final _ConnectionFailure _self;
  final $Res Function(_ConnectionFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_ConnectionFailure(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _CacheFailure implements Failure {
  const _CacheFailure([this.message]);
  

@override final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CacheFailureCopyWith<_CacheFailure> get copyWith => __$CacheFailureCopyWithImpl<_CacheFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CacheFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.cache(message: $message)';
}


}

/// @nodoc
abstract mixin class _$CacheFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$CacheFailureCopyWith(_CacheFailure value, $Res Function(_CacheFailure) _then) = __$CacheFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$CacheFailureCopyWithImpl<$Res>
    implements _$CacheFailureCopyWith<$Res> {
  __$CacheFailureCopyWithImpl(this._self, this._then);

  final _CacheFailure _self;
  final $Res Function(_CacheFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_CacheFailure(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _DatabaseFailure implements Failure {
  const _DatabaseFailure([this.message]);
  

@override final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DatabaseFailureCopyWith<_DatabaseFailure> get copyWith => __$DatabaseFailureCopyWithImpl<_DatabaseFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DatabaseFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.database(message: $message)';
}


}

/// @nodoc
abstract mixin class _$DatabaseFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$DatabaseFailureCopyWith(_DatabaseFailure value, $Res Function(_DatabaseFailure) _then) = __$DatabaseFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$DatabaseFailureCopyWithImpl<$Res>
    implements _$DatabaseFailureCopyWith<$Res> {
  __$DatabaseFailureCopyWithImpl(this._self, this._then);

  final _DatabaseFailure _self;
  final $Res Function(_DatabaseFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_DatabaseFailure(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _UnexpectedFailure implements Failure {
  const _UnexpectedFailure([this.message]);
  

@override final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnexpectedFailureCopyWith<_UnexpectedFailure> get copyWith => __$UnexpectedFailureCopyWithImpl<_UnexpectedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnexpectedFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.unexpected(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnexpectedFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$UnexpectedFailureCopyWith(_UnexpectedFailure value, $Res Function(_UnexpectedFailure) _then) = __$UnexpectedFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$UnexpectedFailureCopyWithImpl<$Res>
    implements _$UnexpectedFailureCopyWith<$Res> {
  __$UnexpectedFailureCopyWithImpl(this._self, this._then);

  final _UnexpectedFailure _self;
  final $Res Function(_UnexpectedFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_UnexpectedFailure(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _NotFoundFailure implements Failure {
  const _NotFoundFailure([this.message]);
  

@override final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotFoundFailureCopyWith<_NotFoundFailure> get copyWith => __$NotFoundFailureCopyWithImpl<_NotFoundFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFoundFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.notFound(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NotFoundFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$NotFoundFailureCopyWith(_NotFoundFailure value, $Res Function(_NotFoundFailure) _then) = __$NotFoundFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$NotFoundFailureCopyWithImpl<$Res>
    implements _$NotFoundFailureCopyWith<$Res> {
  __$NotFoundFailureCopyWithImpl(this._self, this._then);

  final _NotFoundFailure _self;
  final $Res Function(_NotFoundFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_NotFoundFailure(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ParseFailure implements Failure {
  const _ParseFailure([this.message]);
  

@override final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParseFailureCopyWith<_ParseFailure> get copyWith => __$ParseFailureCopyWithImpl<_ParseFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParseFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.parse(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ParseFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$ParseFailureCopyWith(_ParseFailure value, $Res Function(_ParseFailure) _then) = __$ParseFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$ParseFailureCopyWithImpl<$Res>
    implements _$ParseFailureCopyWith<$Res> {
  __$ParseFailureCopyWithImpl(this._self, this._then);

  final _ParseFailure _self;
  final $Res Function(_ParseFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_ParseFailure(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _PermissionFailure implements Failure {
  const _PermissionFailure([this.message]);
  

@override final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PermissionFailureCopyWith<_PermissionFailure> get copyWith => __$PermissionFailureCopyWithImpl<_PermissionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermissionFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.permission(message: $message)';
}


}

/// @nodoc
abstract mixin class _$PermissionFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$PermissionFailureCopyWith(_PermissionFailure value, $Res Function(_PermissionFailure) _then) = __$PermissionFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$PermissionFailureCopyWithImpl<$Res>
    implements _$PermissionFailureCopyWith<$Res> {
  __$PermissionFailureCopyWithImpl(this._self, this._then);

  final _PermissionFailure _self;
  final $Res Function(_PermissionFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_PermissionFailure(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _RateLimitFailure implements Failure {
  const _RateLimitFailure([this.message]);
  

@override final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateLimitFailureCopyWith<_RateLimitFailure> get copyWith => __$RateLimitFailureCopyWithImpl<_RateLimitFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateLimitFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.rateLimit(message: $message)';
}


}

/// @nodoc
abstract mixin class _$RateLimitFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$RateLimitFailureCopyWith(_RateLimitFailure value, $Res Function(_RateLimitFailure) _then) = __$RateLimitFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$RateLimitFailureCopyWithImpl<$Res>
    implements _$RateLimitFailureCopyWith<$Res> {
  __$RateLimitFailureCopyWithImpl(this._self, this._then);

  final _RateLimitFailure _self;
  final $Res Function(_RateLimitFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_RateLimitFailure(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
