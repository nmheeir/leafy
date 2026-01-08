// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_gtd_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchGtdEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchGtdEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchGtdEvent()';
}


}

/// @nodoc
class $SearchGtdEventCopyWith<$Res>  {
$SearchGtdEventCopyWith(SearchGtdEvent _, $Res Function(SearchGtdEvent) __);
}


/// Adds pattern-matching-related methods to [SearchGtdEvent].
extension SearchGtdEventPatterns on SearchGtdEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Fetched value)?  fetched,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fetched() when fetched != null:
return fetched(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Fetched value)  fetched,}){
final _that = this;
switch (_that) {
case _Fetched():
return fetched(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Fetched value)?  fetched,}){
final _that = this;
switch (_that) {
case _Fetched() when fetched != null:
return fetched(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetched,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fetched() when fetched != null:
return fetched();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetched,}) {final _that = this;
switch (_that) {
case _Fetched():
return fetched();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetched,}) {final _that = this;
switch (_that) {
case _Fetched() when fetched != null:
return fetched();case _:
  return null;

}
}

}

/// @nodoc


class _Fetched implements SearchGtdEvent {
  const _Fetched();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fetched);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchGtdEvent.fetched()';
}


}




/// @nodoc
mixin _$SearchGtdState {

 SearchGtdStatus get status; List<GtdBook> get books; bool get hasReachedMax; int get nextPage; String? get errorMessage;
/// Create a copy of SearchGtdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchGtdStateCopyWith<SearchGtdState> get copyWith => _$SearchGtdStateCopyWithImpl<SearchGtdState>(this as SearchGtdState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchGtdState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.books, books)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.nextPage, nextPage) || other.nextPage == nextPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(books),hasReachedMax,nextPage,errorMessage);

@override
String toString() {
  return 'SearchGtdState(status: $status, books: $books, hasReachedMax: $hasReachedMax, nextPage: $nextPage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SearchGtdStateCopyWith<$Res>  {
  factory $SearchGtdStateCopyWith(SearchGtdState value, $Res Function(SearchGtdState) _then) = _$SearchGtdStateCopyWithImpl;
@useResult
$Res call({
 SearchGtdStatus status, List<GtdBook> books, bool hasReachedMax, int nextPage, String? errorMessage
});




}
/// @nodoc
class _$SearchGtdStateCopyWithImpl<$Res>
    implements $SearchGtdStateCopyWith<$Res> {
  _$SearchGtdStateCopyWithImpl(this._self, this._then);

  final SearchGtdState _self;
  final $Res Function(SearchGtdState) _then;

/// Create a copy of SearchGtdState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? books = null,Object? hasReachedMax = null,Object? nextPage = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SearchGtdStatus,books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<GtdBook>,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,nextPage: null == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchGtdState].
extension SearchGtdStatePatterns on SearchGtdState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchGtdState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchGtdState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchGtdState value)  $default,){
final _that = this;
switch (_that) {
case _SearchGtdState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchGtdState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchGtdState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SearchGtdStatus status,  List<GtdBook> books,  bool hasReachedMax,  int nextPage,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchGtdState() when $default != null:
return $default(_that.status,_that.books,_that.hasReachedMax,_that.nextPage,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SearchGtdStatus status,  List<GtdBook> books,  bool hasReachedMax,  int nextPage,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SearchGtdState():
return $default(_that.status,_that.books,_that.hasReachedMax,_that.nextPage,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SearchGtdStatus status,  List<GtdBook> books,  bool hasReachedMax,  int nextPage,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SearchGtdState() when $default != null:
return $default(_that.status,_that.books,_that.hasReachedMax,_that.nextPage,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SearchGtdState implements SearchGtdState {
  const _SearchGtdState({this.status = SearchGtdStatus.initial, final  List<GtdBook> books = const [], this.hasReachedMax = false, this.nextPage = 1, this.errorMessage}): _books = books;
  

@override@JsonKey() final  SearchGtdStatus status;
 final  List<GtdBook> _books;
@override@JsonKey() List<GtdBook> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}

@override@JsonKey() final  bool hasReachedMax;
@override@JsonKey() final  int nextPage;
@override final  String? errorMessage;

/// Create a copy of SearchGtdState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchGtdStateCopyWith<_SearchGtdState> get copyWith => __$SearchGtdStateCopyWithImpl<_SearchGtdState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchGtdState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._books, _books)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.nextPage, nextPage) || other.nextPage == nextPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_books),hasReachedMax,nextPage,errorMessage);

@override
String toString() {
  return 'SearchGtdState(status: $status, books: $books, hasReachedMax: $hasReachedMax, nextPage: $nextPage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SearchGtdStateCopyWith<$Res> implements $SearchGtdStateCopyWith<$Res> {
  factory _$SearchGtdStateCopyWith(_SearchGtdState value, $Res Function(_SearchGtdState) _then) = __$SearchGtdStateCopyWithImpl;
@override @useResult
$Res call({
 SearchGtdStatus status, List<GtdBook> books, bool hasReachedMax, int nextPage, String? errorMessage
});




}
/// @nodoc
class __$SearchGtdStateCopyWithImpl<$Res>
    implements _$SearchGtdStateCopyWith<$Res> {
  __$SearchGtdStateCopyWithImpl(this._self, this._then);

  final _SearchGtdState _self;
  final $Res Function(_SearchGtdState) _then;

/// Create a copy of SearchGtdState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? books = null,Object? hasReachedMax = null,Object? nextPage = null,Object? errorMessage = freezed,}) {
  return _then(_SearchGtdState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SearchGtdStatus,books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<GtdBook>,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,nextPage: null == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
