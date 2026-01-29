// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TagSearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagSearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TagSearchEvent()';
}


}

/// @nodoc
class $TagSearchEventCopyWith<$Res>  {
$TagSearchEventCopyWith(TagSearchEvent _, $Res Function(TagSearchEvent) __);
}


/// Adds pattern-matching-related methods to [TagSearchEvent].
extension TagSearchEventPatterns on TagSearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _LoadTags value)?  loadTags,TResult Function( _SearchTags value)?  searchTags,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LoadTags() when loadTags != null:
return loadTags(_that);case _SearchTags() when searchTags != null:
return searchTags(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _LoadTags value)  loadTags,required TResult Function( _SearchTags value)  searchTags,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _LoadTags():
return loadTags(_that);case _SearchTags():
return searchTags(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _LoadTags value)?  loadTags,TResult? Function( _SearchTags value)?  searchTags,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LoadTags() when loadTags != null:
return loadTags(_that);case _SearchTags() when searchTags != null:
return searchTags(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  loadTags,TResult Function( String query,  List<Tag> excludedTags)?  searchTags,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _LoadTags() when loadTags != null:
return loadTags();case _SearchTags() when searchTags != null:
return searchTags(_that.query,_that.excludedTags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  loadTags,required TResult Function( String query,  List<Tag> excludedTags)  searchTags,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _LoadTags():
return loadTags();case _SearchTags():
return searchTags(_that.query,_that.excludedTags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  loadTags,TResult? Function( String query,  List<Tag> excludedTags)?  searchTags,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _LoadTags() when loadTags != null:
return loadTags();case _SearchTags() when searchTags != null:
return searchTags(_that.query,_that.excludedTags);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements TagSearchEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TagSearchEvent.started()';
}


}




/// @nodoc


class _LoadTags implements TagSearchEvent {
  const _LoadTags();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadTags);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TagSearchEvent.loadTags()';
}


}




/// @nodoc


class _SearchTags implements TagSearchEvent {
  const _SearchTags({required this.query, required final  List<Tag> excludedTags}): _excludedTags = excludedTags;
  

 final  String query;
 final  List<Tag> _excludedTags;
 List<Tag> get excludedTags {
  if (_excludedTags is EqualUnmodifiableListView) return _excludedTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_excludedTags);
}


/// Create a copy of TagSearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchTagsCopyWith<_SearchTags> get copyWith => __$SearchTagsCopyWithImpl<_SearchTags>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchTags&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._excludedTags, _excludedTags));
}


@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(_excludedTags));

@override
String toString() {
  return 'TagSearchEvent.searchTags(query: $query, excludedTags: $excludedTags)';
}


}

/// @nodoc
abstract mixin class _$SearchTagsCopyWith<$Res> implements $TagSearchEventCopyWith<$Res> {
  factory _$SearchTagsCopyWith(_SearchTags value, $Res Function(_SearchTags) _then) = __$SearchTagsCopyWithImpl;
@useResult
$Res call({
 String query, List<Tag> excludedTags
});




}
/// @nodoc
class __$SearchTagsCopyWithImpl<$Res>
    implements _$SearchTagsCopyWith<$Res> {
  __$SearchTagsCopyWithImpl(this._self, this._then);

  final _SearchTags _self;
  final $Res Function(_SearchTags) _then;

/// Create a copy of TagSearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,Object? excludedTags = null,}) {
  return _then(_SearchTags(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,excludedTags: null == excludedTags ? _self._excludedTags : excludedTags // ignore: cast_nullable_to_non_nullable
as List<Tag>,
  ));
}


}

/// @nodoc
mixin _$TagSearchState {

 List<Tag> get availableTags; List<Tag> get suggestions; bool get isLoading; String? get error;
/// Create a copy of TagSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagSearchStateCopyWith<TagSearchState> get copyWith => _$TagSearchStateCopyWithImpl<TagSearchState>(this as TagSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagSearchState&&const DeepCollectionEquality().equals(other.availableTags, availableTags)&&const DeepCollectionEquality().equals(other.suggestions, suggestions)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(availableTags),const DeepCollectionEquality().hash(suggestions),isLoading,error);

@override
String toString() {
  return 'TagSearchState(availableTags: $availableTags, suggestions: $suggestions, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $TagSearchStateCopyWith<$Res>  {
  factory $TagSearchStateCopyWith(TagSearchState value, $Res Function(TagSearchState) _then) = _$TagSearchStateCopyWithImpl;
@useResult
$Res call({
 List<Tag> availableTags, List<Tag> suggestions, bool isLoading, String? error
});




}
/// @nodoc
class _$TagSearchStateCopyWithImpl<$Res>
    implements $TagSearchStateCopyWith<$Res> {
  _$TagSearchStateCopyWithImpl(this._self, this._then);

  final TagSearchState _self;
  final $Res Function(TagSearchState) _then;

/// Create a copy of TagSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availableTags = null,Object? suggestions = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
availableTags: null == availableTags ? _self.availableTags : availableTags // ignore: cast_nullable_to_non_nullable
as List<Tag>,suggestions: null == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<Tag>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TagSearchState].
extension TagSearchStatePatterns on TagSearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TagSearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TagSearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TagSearchState value)  $default,){
final _that = this;
switch (_that) {
case _TagSearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TagSearchState value)?  $default,){
final _that = this;
switch (_that) {
case _TagSearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Tag> availableTags,  List<Tag> suggestions,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TagSearchState() when $default != null:
return $default(_that.availableTags,_that.suggestions,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Tag> availableTags,  List<Tag> suggestions,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _TagSearchState():
return $default(_that.availableTags,_that.suggestions,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Tag> availableTags,  List<Tag> suggestions,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _TagSearchState() when $default != null:
return $default(_that.availableTags,_that.suggestions,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _TagSearchState implements TagSearchState {
  const _TagSearchState({final  List<Tag> availableTags = const [], final  List<Tag> suggestions = const [], this.isLoading = false, this.error}): _availableTags = availableTags,_suggestions = suggestions;
  

 final  List<Tag> _availableTags;
@override@JsonKey() List<Tag> get availableTags {
  if (_availableTags is EqualUnmodifiableListView) return _availableTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableTags);
}

 final  List<Tag> _suggestions;
@override@JsonKey() List<Tag> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of TagSearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagSearchStateCopyWith<_TagSearchState> get copyWith => __$TagSearchStateCopyWithImpl<_TagSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TagSearchState&&const DeepCollectionEquality().equals(other._availableTags, _availableTags)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_availableTags),const DeepCollectionEquality().hash(_suggestions),isLoading,error);

@override
String toString() {
  return 'TagSearchState(availableTags: $availableTags, suggestions: $suggestions, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$TagSearchStateCopyWith<$Res> implements $TagSearchStateCopyWith<$Res> {
  factory _$TagSearchStateCopyWith(_TagSearchState value, $Res Function(_TagSearchState) _then) = __$TagSearchStateCopyWithImpl;
@override @useResult
$Res call({
 List<Tag> availableTags, List<Tag> suggestions, bool isLoading, String? error
});




}
/// @nodoc
class __$TagSearchStateCopyWithImpl<$Res>
    implements _$TagSearchStateCopyWith<$Res> {
  __$TagSearchStateCopyWithImpl(this._self, this._then);

  final _TagSearchState _self;
  final $Res Function(_TagSearchState) _then;

/// Create a copy of TagSearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availableTags = null,Object? suggestions = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_TagSearchState(
availableTags: null == availableTags ? _self._availableTags : availableTags // ignore: cast_nullable_to_non_nullable
as List<Tag>,suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<Tag>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
