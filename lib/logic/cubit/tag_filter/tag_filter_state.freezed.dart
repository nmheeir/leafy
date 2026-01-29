// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TagFilterState {

 TagFilterStatus get status; List<Tag> get allTags; List<Tag> get filteredTags; List<Tag> get selectedTags; TagFilterMode get filterMode; String get searchQuery; String? get errorMessage;
/// Create a copy of TagFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagFilterStateCopyWith<TagFilterState> get copyWith => _$TagFilterStateCopyWithImpl<TagFilterState>(this as TagFilterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagFilterState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.allTags, allTags)&&const DeepCollectionEquality().equals(other.filteredTags, filteredTags)&&const DeepCollectionEquality().equals(other.selectedTags, selectedTags)&&(identical(other.filterMode, filterMode) || other.filterMode == filterMode)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(allTags),const DeepCollectionEquality().hash(filteredTags),const DeepCollectionEquality().hash(selectedTags),filterMode,searchQuery,errorMessage);

@override
String toString() {
  return 'TagFilterState(status: $status, allTags: $allTags, filteredTags: $filteredTags, selectedTags: $selectedTags, filterMode: $filterMode, searchQuery: $searchQuery, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TagFilterStateCopyWith<$Res>  {
  factory $TagFilterStateCopyWith(TagFilterState value, $Res Function(TagFilterState) _then) = _$TagFilterStateCopyWithImpl;
@useResult
$Res call({
 TagFilterStatus status, List<Tag> allTags, List<Tag> filteredTags, List<Tag> selectedTags, TagFilterMode filterMode, String searchQuery, String? errorMessage
});




}
/// @nodoc
class _$TagFilterStateCopyWithImpl<$Res>
    implements $TagFilterStateCopyWith<$Res> {
  _$TagFilterStateCopyWithImpl(this._self, this._then);

  final TagFilterState _self;
  final $Res Function(TagFilterState) _then;

/// Create a copy of TagFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? allTags = null,Object? filteredTags = null,Object? selectedTags = null,Object? filterMode = null,Object? searchQuery = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TagFilterStatus,allTags: null == allTags ? _self.allTags : allTags // ignore: cast_nullable_to_non_nullable
as List<Tag>,filteredTags: null == filteredTags ? _self.filteredTags : filteredTags // ignore: cast_nullable_to_non_nullable
as List<Tag>,selectedTags: null == selectedTags ? _self.selectedTags : selectedTags // ignore: cast_nullable_to_non_nullable
as List<Tag>,filterMode: null == filterMode ? _self.filterMode : filterMode // ignore: cast_nullable_to_non_nullable
as TagFilterMode,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TagFilterState].
extension TagFilterStatePatterns on TagFilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TagFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TagFilterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TagFilterState value)  $default,){
final _that = this;
switch (_that) {
case _TagFilterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TagFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _TagFilterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TagFilterStatus status,  List<Tag> allTags,  List<Tag> filteredTags,  List<Tag> selectedTags,  TagFilterMode filterMode,  String searchQuery,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TagFilterState() when $default != null:
return $default(_that.status,_that.allTags,_that.filteredTags,_that.selectedTags,_that.filterMode,_that.searchQuery,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TagFilterStatus status,  List<Tag> allTags,  List<Tag> filteredTags,  List<Tag> selectedTags,  TagFilterMode filterMode,  String searchQuery,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _TagFilterState():
return $default(_that.status,_that.allTags,_that.filteredTags,_that.selectedTags,_that.filterMode,_that.searchQuery,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TagFilterStatus status,  List<Tag> allTags,  List<Tag> filteredTags,  List<Tag> selectedTags,  TagFilterMode filterMode,  String searchQuery,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _TagFilterState() when $default != null:
return $default(_that.status,_that.allTags,_that.filteredTags,_that.selectedTags,_that.filterMode,_that.searchQuery,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _TagFilterState implements TagFilterState {
  const _TagFilterState({this.status = TagFilterStatus.initial, final  List<Tag> allTags = const [], final  List<Tag> filteredTags = const [], final  List<Tag> selectedTags = const [], this.filterMode = TagFilterMode.any, this.searchQuery = '', this.errorMessage}): _allTags = allTags,_filteredTags = filteredTags,_selectedTags = selectedTags;
  

@override@JsonKey() final  TagFilterStatus status;
 final  List<Tag> _allTags;
@override@JsonKey() List<Tag> get allTags {
  if (_allTags is EqualUnmodifiableListView) return _allTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allTags);
}

 final  List<Tag> _filteredTags;
@override@JsonKey() List<Tag> get filteredTags {
  if (_filteredTags is EqualUnmodifiableListView) return _filteredTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredTags);
}

 final  List<Tag> _selectedTags;
@override@JsonKey() List<Tag> get selectedTags {
  if (_selectedTags is EqualUnmodifiableListView) return _selectedTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedTags);
}

@override@JsonKey() final  TagFilterMode filterMode;
@override@JsonKey() final  String searchQuery;
@override final  String? errorMessage;

/// Create a copy of TagFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagFilterStateCopyWith<_TagFilterState> get copyWith => __$TagFilterStateCopyWithImpl<_TagFilterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TagFilterState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._allTags, _allTags)&&const DeepCollectionEquality().equals(other._filteredTags, _filteredTags)&&const DeepCollectionEquality().equals(other._selectedTags, _selectedTags)&&(identical(other.filterMode, filterMode) || other.filterMode == filterMode)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_allTags),const DeepCollectionEquality().hash(_filteredTags),const DeepCollectionEquality().hash(_selectedTags),filterMode,searchQuery,errorMessage);

@override
String toString() {
  return 'TagFilterState(status: $status, allTags: $allTags, filteredTags: $filteredTags, selectedTags: $selectedTags, filterMode: $filterMode, searchQuery: $searchQuery, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$TagFilterStateCopyWith<$Res> implements $TagFilterStateCopyWith<$Res> {
  factory _$TagFilterStateCopyWith(_TagFilterState value, $Res Function(_TagFilterState) _then) = __$TagFilterStateCopyWithImpl;
@override @useResult
$Res call({
 TagFilterStatus status, List<Tag> allTags, List<Tag> filteredTags, List<Tag> selectedTags, TagFilterMode filterMode, String searchQuery, String? errorMessage
});




}
/// @nodoc
class __$TagFilterStateCopyWithImpl<$Res>
    implements _$TagFilterStateCopyWith<$Res> {
  __$TagFilterStateCopyWithImpl(this._self, this._then);

  final _TagFilterState _self;
  final $Res Function(_TagFilterState) _then;

/// Create a copy of TagFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? allTags = null,Object? filteredTags = null,Object? selectedTags = null,Object? filterMode = null,Object? searchQuery = null,Object? errorMessage = freezed,}) {
  return _then(_TagFilterState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TagFilterStatus,allTags: null == allTags ? _self._allTags : allTags // ignore: cast_nullable_to_non_nullable
as List<Tag>,filteredTags: null == filteredTags ? _self._filteredTags : filteredTags // ignore: cast_nullable_to_non_nullable
as List<Tag>,selectedTags: null == selectedTags ? _self._selectedTags : selectedTags // ignore: cast_nullable_to_non_nullable
as List<Tag>,filterMode: null == filterMode ? _self.filterMode : filterMode // ignore: cast_nullable_to_non_nullable
as TagFilterMode,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
