// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translation_and_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TranslationAndSummary {

 TranslationModel get translation; SummaryModel get summary;
/// Create a copy of TranslationAndSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslationAndSummaryCopyWith<TranslationAndSummary> get copyWith => _$TranslationAndSummaryCopyWithImpl<TranslationAndSummary>(this as TranslationAndSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationAndSummary&&(identical(other.translation, translation) || other.translation == translation)&&(identical(other.summary, summary) || other.summary == summary));
}


@override
int get hashCode => Object.hash(runtimeType,translation,summary);

@override
String toString() {
  return 'TranslationAndSummary(translation: $translation, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $TranslationAndSummaryCopyWith<$Res>  {
  factory $TranslationAndSummaryCopyWith(TranslationAndSummary value, $Res Function(TranslationAndSummary) _then) = _$TranslationAndSummaryCopyWithImpl;
@useResult
$Res call({
 TranslationModel translation, SummaryModel summary
});


$TranslationModelCopyWith<$Res> get translation;$SummaryModelCopyWith<$Res> get summary;

}
/// @nodoc
class _$TranslationAndSummaryCopyWithImpl<$Res>
    implements $TranslationAndSummaryCopyWith<$Res> {
  _$TranslationAndSummaryCopyWithImpl(this._self, this._then);

  final TranslationAndSummary _self;
  final $Res Function(TranslationAndSummary) _then;

/// Create a copy of TranslationAndSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? translation = null,Object? summary = null,}) {
  return _then(_self.copyWith(
translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as TranslationModel,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as SummaryModel,
  ));
}
/// Create a copy of TranslationAndSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TranslationModelCopyWith<$Res> get translation {
  
  return $TranslationModelCopyWith<$Res>(_self.translation, (value) {
    return _then(_self.copyWith(translation: value));
  });
}/// Create a copy of TranslationAndSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryModelCopyWith<$Res> get summary {
  
  return $SummaryModelCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [TranslationAndSummary].
extension TranslationAndSummaryPatterns on TranslationAndSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TranslationAndSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TranslationAndSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TranslationAndSummary value)  $default,){
final _that = this;
switch (_that) {
case _TranslationAndSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TranslationAndSummary value)?  $default,){
final _that = this;
switch (_that) {
case _TranslationAndSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TranslationModel translation,  SummaryModel summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TranslationAndSummary() when $default != null:
return $default(_that.translation,_that.summary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TranslationModel translation,  SummaryModel summary)  $default,) {final _that = this;
switch (_that) {
case _TranslationAndSummary():
return $default(_that.translation,_that.summary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TranslationModel translation,  SummaryModel summary)?  $default,) {final _that = this;
switch (_that) {
case _TranslationAndSummary() when $default != null:
return $default(_that.translation,_that.summary);case _:
  return null;

}
}

}

/// @nodoc


class _TranslationAndSummary implements TranslationAndSummary {
  const _TranslationAndSummary({required this.translation, required this.summary});
  

@override final  TranslationModel translation;
@override final  SummaryModel summary;

/// Create a copy of TranslationAndSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranslationAndSummaryCopyWith<_TranslationAndSummary> get copyWith => __$TranslationAndSummaryCopyWithImpl<_TranslationAndSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TranslationAndSummary&&(identical(other.translation, translation) || other.translation == translation)&&(identical(other.summary, summary) || other.summary == summary));
}


@override
int get hashCode => Object.hash(runtimeType,translation,summary);

@override
String toString() {
  return 'TranslationAndSummary(translation: $translation, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$TranslationAndSummaryCopyWith<$Res> implements $TranslationAndSummaryCopyWith<$Res> {
  factory _$TranslationAndSummaryCopyWith(_TranslationAndSummary value, $Res Function(_TranslationAndSummary) _then) = __$TranslationAndSummaryCopyWithImpl;
@override @useResult
$Res call({
 TranslationModel translation, SummaryModel summary
});


@override $TranslationModelCopyWith<$Res> get translation;@override $SummaryModelCopyWith<$Res> get summary;

}
/// @nodoc
class __$TranslationAndSummaryCopyWithImpl<$Res>
    implements _$TranslationAndSummaryCopyWith<$Res> {
  __$TranslationAndSummaryCopyWithImpl(this._self, this._then);

  final _TranslationAndSummary _self;
  final $Res Function(_TranslationAndSummary) _then;

/// Create a copy of TranslationAndSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? translation = null,Object? summary = null,}) {
  return _then(_TranslationAndSummary(
translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as TranslationModel,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as SummaryModel,
  ));
}

/// Create a copy of TranslationAndSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TranslationModelCopyWith<$Res> get translation {
  
  return $TranslationModelCopyWith<$Res>(_self.translation, (value) {
    return _then(_self.copyWith(translation: value));
  });
}/// Create a copy of TranslationAndSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryModelCopyWith<$Res> get summary {
  
  return $SummaryModelCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
