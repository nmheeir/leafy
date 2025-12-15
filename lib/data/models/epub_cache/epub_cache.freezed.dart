// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epub_cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EpubCache {

 String get id; String get url; String get title; String get lastReadCfi; double get progress;
/// Create a copy of EpubCache
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpubCacheCopyWith<EpubCache> get copyWith => _$EpubCacheCopyWithImpl<EpubCache>(this as EpubCache, _$identity);

  /// Serializes this EpubCache to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpubCache&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.title, title) || other.title == title)&&(identical(other.lastReadCfi, lastReadCfi) || other.lastReadCfi == lastReadCfi)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,title,lastReadCfi,progress);

@override
String toString() {
  return 'EpubCache(id: $id, url: $url, title: $title, lastReadCfi: $lastReadCfi, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $EpubCacheCopyWith<$Res>  {
  factory $EpubCacheCopyWith(EpubCache value, $Res Function(EpubCache) _then) = _$EpubCacheCopyWithImpl;
@useResult
$Res call({
 String id, String url, String title, String lastReadCfi, double progress
});




}
/// @nodoc
class _$EpubCacheCopyWithImpl<$Res>
    implements $EpubCacheCopyWith<$Res> {
  _$EpubCacheCopyWithImpl(this._self, this._then);

  final EpubCache _self;
  final $Res Function(EpubCache) _then;

/// Create a copy of EpubCache
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? title = null,Object? lastReadCfi = null,Object? progress = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,lastReadCfi: null == lastReadCfi ? _self.lastReadCfi : lastReadCfi // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [EpubCache].
extension EpubCachePatterns on EpubCache {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpubCache value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpubCache() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpubCache value)  $default,){
final _that = this;
switch (_that) {
case _EpubCache():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpubCache value)?  $default,){
final _that = this;
switch (_that) {
case _EpubCache() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String url,  String title,  String lastReadCfi,  double progress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpubCache() when $default != null:
return $default(_that.id,_that.url,_that.title,_that.lastReadCfi,_that.progress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String url,  String title,  String lastReadCfi,  double progress)  $default,) {final _that = this;
switch (_that) {
case _EpubCache():
return $default(_that.id,_that.url,_that.title,_that.lastReadCfi,_that.progress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String url,  String title,  String lastReadCfi,  double progress)?  $default,) {final _that = this;
switch (_that) {
case _EpubCache() when $default != null:
return $default(_that.id,_that.url,_that.title,_that.lastReadCfi,_that.progress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EpubCache implements EpubCache {
  const _EpubCache({required this.id, required this.url, required this.title, required this.lastReadCfi, required this.progress});
  factory _EpubCache.fromJson(Map<String, dynamic> json) => _$EpubCacheFromJson(json);

@override final  String id;
@override final  String url;
@override final  String title;
@override final  String lastReadCfi;
@override final  double progress;

/// Create a copy of EpubCache
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpubCacheCopyWith<_EpubCache> get copyWith => __$EpubCacheCopyWithImpl<_EpubCache>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpubCacheToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpubCache&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.title, title) || other.title == title)&&(identical(other.lastReadCfi, lastReadCfi) || other.lastReadCfi == lastReadCfi)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,title,lastReadCfi,progress);

@override
String toString() {
  return 'EpubCache(id: $id, url: $url, title: $title, lastReadCfi: $lastReadCfi, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$EpubCacheCopyWith<$Res> implements $EpubCacheCopyWith<$Res> {
  factory _$EpubCacheCopyWith(_EpubCache value, $Res Function(_EpubCache) _then) = __$EpubCacheCopyWithImpl;
@override @useResult
$Res call({
 String id, String url, String title, String lastReadCfi, double progress
});




}
/// @nodoc
class __$EpubCacheCopyWithImpl<$Res>
    implements _$EpubCacheCopyWith<$Res> {
  __$EpubCacheCopyWithImpl(this._self, this._then);

  final _EpubCache _self;
  final $Res Function(_EpubCache) _then;

/// Create a copy of EpubCache
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? title = null,Object? lastReadCfi = null,Object? progress = null,}) {
  return _then(_EpubCache(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,lastReadCfi: null == lastReadCfi ? _self.lastReadCfi : lastReadCfi // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
