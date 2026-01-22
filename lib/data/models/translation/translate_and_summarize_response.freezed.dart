// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translate_and_summarize_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TranslateAndSummarizeResponse {

 String get summary; Map<String, String> get translation;
/// Create a copy of TranslateAndSummarizeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslateAndSummarizeResponseCopyWith<TranslateAndSummarizeResponse> get copyWith => _$TranslateAndSummarizeResponseCopyWithImpl<TranslateAndSummarizeResponse>(this as TranslateAndSummarizeResponse, _$identity);

  /// Serializes this TranslateAndSummarizeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslateAndSummarizeResponse&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.translation, translation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(translation));

@override
String toString() {
  return 'TranslateAndSummarizeResponse(summary: $summary, translation: $translation)';
}


}

/// @nodoc
abstract mixin class $TranslateAndSummarizeResponseCopyWith<$Res>  {
  factory $TranslateAndSummarizeResponseCopyWith(TranslateAndSummarizeResponse value, $Res Function(TranslateAndSummarizeResponse) _then) = _$TranslateAndSummarizeResponseCopyWithImpl;
@useResult
$Res call({
 String summary, Map<String, String> translation
});




}
/// @nodoc
class _$TranslateAndSummarizeResponseCopyWithImpl<$Res>
    implements $TranslateAndSummarizeResponseCopyWith<$Res> {
  _$TranslateAndSummarizeResponseCopyWithImpl(this._self, this._then);

  final TranslateAndSummarizeResponse _self;
  final $Res Function(TranslateAndSummarizeResponse) _then;

/// Create a copy of TranslateAndSummarizeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = null,Object? translation = null,}) {
  return _then(_self.copyWith(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [TranslateAndSummarizeResponse].
extension TranslateAndSummarizeResponsePatterns on TranslateAndSummarizeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TranslateAndSummarizeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TranslateAndSummarizeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TranslateAndSummarizeResponse value)  $default,){
final _that = this;
switch (_that) {
case _TranslateAndSummarizeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TranslateAndSummarizeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TranslateAndSummarizeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String summary,  Map<String, String> translation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TranslateAndSummarizeResponse() when $default != null:
return $default(_that.summary,_that.translation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String summary,  Map<String, String> translation)  $default,) {final _that = this;
switch (_that) {
case _TranslateAndSummarizeResponse():
return $default(_that.summary,_that.translation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String summary,  Map<String, String> translation)?  $default,) {final _that = this;
switch (_that) {
case _TranslateAndSummarizeResponse() when $default != null:
return $default(_that.summary,_that.translation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TranslateAndSummarizeResponse implements TranslateAndSummarizeResponse {
  const _TranslateAndSummarizeResponse({required this.summary, required final  Map<String, String> translation}): _translation = translation;
  factory _TranslateAndSummarizeResponse.fromJson(Map<String, dynamic> json) => _$TranslateAndSummarizeResponseFromJson(json);

@override final  String summary;
 final  Map<String, String> _translation;
@override Map<String, String> get translation {
  if (_translation is EqualUnmodifiableMapView) return _translation;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_translation);
}


/// Create a copy of TranslateAndSummarizeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranslateAndSummarizeResponseCopyWith<_TranslateAndSummarizeResponse> get copyWith => __$TranslateAndSummarizeResponseCopyWithImpl<_TranslateAndSummarizeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TranslateAndSummarizeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TranslateAndSummarizeResponse&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._translation, _translation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(_translation));

@override
String toString() {
  return 'TranslateAndSummarizeResponse(summary: $summary, translation: $translation)';
}


}

/// @nodoc
abstract mixin class _$TranslateAndSummarizeResponseCopyWith<$Res> implements $TranslateAndSummarizeResponseCopyWith<$Res> {
  factory _$TranslateAndSummarizeResponseCopyWith(_TranslateAndSummarizeResponse value, $Res Function(_TranslateAndSummarizeResponse) _then) = __$TranslateAndSummarizeResponseCopyWithImpl;
@override @useResult
$Res call({
 String summary, Map<String, String> translation
});




}
/// @nodoc
class __$TranslateAndSummarizeResponseCopyWithImpl<$Res>
    implements _$TranslateAndSummarizeResponseCopyWith<$Res> {
  __$TranslateAndSummarizeResponseCopyWithImpl(this._self, this._then);

  final _TranslateAndSummarizeResponse _self;
  final $Res Function(_TranslateAndSummarizeResponse) _then;

/// Create a copy of TranslateAndSummarizeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? translation = null,}) {
  return _then(_TranslateAndSummarizeResponse(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,translation: null == translation ? _self._translation : translation // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

// dart format on
