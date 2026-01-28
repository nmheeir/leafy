// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_management_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TagManagementState {

 bool get isLoading; List<Tag> get tags; Map<Tag, int> get tagStats; String? get error;
/// Create a copy of TagManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagManagementStateCopyWith<TagManagementState> get copyWith => _$TagManagementStateCopyWithImpl<TagManagementState>(this as TagManagementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagManagementState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.tagStats, tagStats)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(tagStats),error);

@override
String toString() {
  return 'TagManagementState(isLoading: $isLoading, tags: $tags, tagStats: $tagStats, error: $error)';
}


}

/// @nodoc
abstract mixin class $TagManagementStateCopyWith<$Res>  {
  factory $TagManagementStateCopyWith(TagManagementState value, $Res Function(TagManagementState) _then) = _$TagManagementStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<Tag> tags, Map<Tag, int> tagStats, String? error
});




}
/// @nodoc
class _$TagManagementStateCopyWithImpl<$Res>
    implements $TagManagementStateCopyWith<$Res> {
  _$TagManagementStateCopyWithImpl(this._self, this._then);

  final TagManagementState _self;
  final $Res Function(TagManagementState) _then;

/// Create a copy of TagManagementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? tags = null,Object? tagStats = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,tagStats: null == tagStats ? _self.tagStats : tagStats // ignore: cast_nullable_to_non_nullable
as Map<Tag, int>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TagManagementState].
extension TagManagementStatePatterns on TagManagementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TagManagementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TagManagementState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TagManagementState value)  $default,){
final _that = this;
switch (_that) {
case _TagManagementState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TagManagementState value)?  $default,){
final _that = this;
switch (_that) {
case _TagManagementState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<Tag> tags,  Map<Tag, int> tagStats,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TagManagementState() when $default != null:
return $default(_that.isLoading,_that.tags,_that.tagStats,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<Tag> tags,  Map<Tag, int> tagStats,  String? error)  $default,) {final _that = this;
switch (_that) {
case _TagManagementState():
return $default(_that.isLoading,_that.tags,_that.tagStats,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<Tag> tags,  Map<Tag, int> tagStats,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _TagManagementState() when $default != null:
return $default(_that.isLoading,_that.tags,_that.tagStats,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _TagManagementState implements TagManagementState {
  const _TagManagementState({this.isLoading = true, final  List<Tag> tags = const [], final  Map<Tag, int> tagStats = const {}, this.error}): _tags = tags,_tagStats = tagStats;
  

@override@JsonKey() final  bool isLoading;
 final  List<Tag> _tags;
@override@JsonKey() List<Tag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  Map<Tag, int> _tagStats;
@override@JsonKey() Map<Tag, int> get tagStats {
  if (_tagStats is EqualUnmodifiableMapView) return _tagStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_tagStats);
}

@override final  String? error;

/// Create a copy of TagManagementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagManagementStateCopyWith<_TagManagementState> get copyWith => __$TagManagementStateCopyWithImpl<_TagManagementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TagManagementState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._tagStats, _tagStats)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_tagStats),error);

@override
String toString() {
  return 'TagManagementState(isLoading: $isLoading, tags: $tags, tagStats: $tagStats, error: $error)';
}


}

/// @nodoc
abstract mixin class _$TagManagementStateCopyWith<$Res> implements $TagManagementStateCopyWith<$Res> {
  factory _$TagManagementStateCopyWith(_TagManagementState value, $Res Function(_TagManagementState) _then) = __$TagManagementStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<Tag> tags, Map<Tag, int> tagStats, String? error
});




}
/// @nodoc
class __$TagManagementStateCopyWithImpl<$Res>
    implements _$TagManagementStateCopyWith<$Res> {
  __$TagManagementStateCopyWithImpl(this._self, this._then);

  final _TagManagementState _self;
  final $Res Function(_TagManagementState) _then;

/// Create a copy of TagManagementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? tags = null,Object? tagStats = null,Object? error = freezed,}) {
  return _then(_TagManagementState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,tagStats: null == tagStats ? _self._tagStats : tagStats // ignore: cast_nullable_to_non_nullable
as Map<Tag, int>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
