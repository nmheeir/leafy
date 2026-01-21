// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_gemini_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingGeminiState {

 bool get isLoading; String? get error; String? get apiKey; List<String> get availableModels; String? get selectedModel;
/// Create a copy of SettingGeminiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingGeminiStateCopyWith<SettingGeminiState> get copyWith => _$SettingGeminiStateCopyWithImpl<SettingGeminiState>(this as SettingGeminiState, _$identity);

  /// Serializes this SettingGeminiState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingGeminiState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey)&&const DeepCollectionEquality().equals(other.availableModels, availableModels)&&(identical(other.selectedModel, selectedModel) || other.selectedModel == selectedModel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isLoading,error,apiKey,const DeepCollectionEquality().hash(availableModels),selectedModel);

@override
String toString() {
  return 'SettingGeminiState(isLoading: $isLoading, error: $error, apiKey: $apiKey, availableModels: $availableModels, selectedModel: $selectedModel)';
}


}

/// @nodoc
abstract mixin class $SettingGeminiStateCopyWith<$Res>  {
  factory $SettingGeminiStateCopyWith(SettingGeminiState value, $Res Function(SettingGeminiState) _then) = _$SettingGeminiStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? error, String? apiKey, List<String> availableModels, String? selectedModel
});




}
/// @nodoc
class _$SettingGeminiStateCopyWithImpl<$Res>
    implements $SettingGeminiStateCopyWith<$Res> {
  _$SettingGeminiStateCopyWithImpl(this._self, this._then);

  final SettingGeminiState _self;
  final $Res Function(SettingGeminiState) _then;

/// Create a copy of SettingGeminiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? error = freezed,Object? apiKey = freezed,Object? availableModels = null,Object? selectedModel = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,apiKey: freezed == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String?,availableModels: null == availableModels ? _self.availableModels : availableModels // ignore: cast_nullable_to_non_nullable
as List<String>,selectedModel: freezed == selectedModel ? _self.selectedModel : selectedModel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingGeminiState].
extension SettingGeminiStatePatterns on SettingGeminiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingGeminiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingGeminiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingGeminiState value)  $default,){
final _that = this;
switch (_that) {
case _SettingGeminiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingGeminiState value)?  $default,){
final _that = this;
switch (_that) {
case _SettingGeminiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  String? apiKey,  List<String> availableModels,  String? selectedModel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingGeminiState() when $default != null:
return $default(_that.isLoading,_that.error,_that.apiKey,_that.availableModels,_that.selectedModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  String? apiKey,  List<String> availableModels,  String? selectedModel)  $default,) {final _that = this;
switch (_that) {
case _SettingGeminiState():
return $default(_that.isLoading,_that.error,_that.apiKey,_that.availableModels,_that.selectedModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? error,  String? apiKey,  List<String> availableModels,  String? selectedModel)?  $default,) {final _that = this;
switch (_that) {
case _SettingGeminiState() when $default != null:
return $default(_that.isLoading,_that.error,_that.apiKey,_that.availableModels,_that.selectedModel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SettingGeminiState implements SettingGeminiState {
  const _SettingGeminiState({this.isLoading = false, this.error, this.apiKey, final  List<String> availableModels = const [], this.selectedModel}): _availableModels = availableModels;
  factory _SettingGeminiState.fromJson(Map<String, dynamic> json) => _$SettingGeminiStateFromJson(json);

@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override final  String? apiKey;
 final  List<String> _availableModels;
@override@JsonKey() List<String> get availableModels {
  if (_availableModels is EqualUnmodifiableListView) return _availableModels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableModels);
}

@override final  String? selectedModel;

/// Create a copy of SettingGeminiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingGeminiStateCopyWith<_SettingGeminiState> get copyWith => __$SettingGeminiStateCopyWithImpl<_SettingGeminiState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingGeminiStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingGeminiState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey)&&const DeepCollectionEquality().equals(other._availableModels, _availableModels)&&(identical(other.selectedModel, selectedModel) || other.selectedModel == selectedModel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isLoading,error,apiKey,const DeepCollectionEquality().hash(_availableModels),selectedModel);

@override
String toString() {
  return 'SettingGeminiState(isLoading: $isLoading, error: $error, apiKey: $apiKey, availableModels: $availableModels, selectedModel: $selectedModel)';
}


}

/// @nodoc
abstract mixin class _$SettingGeminiStateCopyWith<$Res> implements $SettingGeminiStateCopyWith<$Res> {
  factory _$SettingGeminiStateCopyWith(_SettingGeminiState value, $Res Function(_SettingGeminiState) _then) = __$SettingGeminiStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? error, String? apiKey, List<String> availableModels, String? selectedModel
});




}
/// @nodoc
class __$SettingGeminiStateCopyWithImpl<$Res>
    implements _$SettingGeminiStateCopyWith<$Res> {
  __$SettingGeminiStateCopyWithImpl(this._self, this._then);

  final _SettingGeminiState _self;
  final $Res Function(_SettingGeminiState) _then;

/// Create a copy of SettingGeminiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? error = freezed,Object? apiKey = freezed,Object? availableModels = null,Object? selectedModel = freezed,}) {
  return _then(_SettingGeminiState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,apiKey: freezed == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String?,availableModels: null == availableModels ? _self._availableModels : availableModels // ignore: cast_nullable_to_non_nullable
as List<String>,selectedModel: freezed == selectedModel ? _self.selectedModel : selectedModel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
