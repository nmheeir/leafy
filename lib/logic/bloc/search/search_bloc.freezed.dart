// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent()';
}


}

/// @nodoc
class $SearchEventCopyWith<$Res>  {
$SearchEventCopyWith(SearchEvent _, $Res Function(SearchEvent) __);
}


/// Adds pattern-matching-related methods to [SearchEvent].
extension SearchEventPatterns on SearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _QueryChanged value)?  queryChanged,TResult Function( _TypeChanged value)?  typeChanged,TResult Function( _LoadMore value)?  loadMore,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueryChanged() when queryChanged != null:
return queryChanged(_that);case _TypeChanged() when typeChanged != null:
return typeChanged(_that);case _LoadMore() when loadMore != null:
return loadMore(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _QueryChanged value)  queryChanged,required TResult Function( _TypeChanged value)  typeChanged,required TResult Function( _LoadMore value)  loadMore,}){
final _that = this;
switch (_that) {
case _QueryChanged():
return queryChanged(_that);case _TypeChanged():
return typeChanged(_that);case _LoadMore():
return loadMore(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _QueryChanged value)?  queryChanged,TResult? Function( _TypeChanged value)?  typeChanged,TResult? Function( _LoadMore value)?  loadMore,}){
final _that = this;
switch (_that) {
case _QueryChanged() when queryChanged != null:
return queryChanged(_that);case _TypeChanged() when typeChanged != null:
return typeChanged(_that);case _LoadMore() when loadMore != null:
return loadMore(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String query)?  queryChanged,TResult Function( OLSearchType type)?  typeChanged,TResult Function()?  loadMore,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueryChanged() when queryChanged != null:
return queryChanged(_that.query);case _TypeChanged() when typeChanged != null:
return typeChanged(_that.type);case _LoadMore() when loadMore != null:
return loadMore();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String query)  queryChanged,required TResult Function( OLSearchType type)  typeChanged,required TResult Function()  loadMore,}) {final _that = this;
switch (_that) {
case _QueryChanged():
return queryChanged(_that.query);case _TypeChanged():
return typeChanged(_that.type);case _LoadMore():
return loadMore();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String query)?  queryChanged,TResult? Function( OLSearchType type)?  typeChanged,TResult? Function()?  loadMore,}) {final _that = this;
switch (_that) {
case _QueryChanged() when queryChanged != null:
return queryChanged(_that.query);case _TypeChanged() when typeChanged != null:
return typeChanged(_that.type);case _LoadMore() when loadMore != null:
return loadMore();case _:
  return null;

}
}

}

/// @nodoc


class _QueryChanged implements SearchEvent {
  const _QueryChanged(this.query);
  

 final  String query;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueryChangedCopyWith<_QueryChanged> get copyWith => __$QueryChangedCopyWithImpl<_QueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchEvent.queryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class _$QueryChangedCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory _$QueryChangedCopyWith(_QueryChanged value, $Res Function(_QueryChanged) _then) = __$QueryChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$QueryChangedCopyWithImpl<$Res>
    implements _$QueryChangedCopyWith<$Res> {
  __$QueryChangedCopyWithImpl(this._self, this._then);

  final _QueryChanged _self;
  final $Res Function(_QueryChanged) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_QueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TypeChanged implements SearchEvent {
  const _TypeChanged(this.type);
  

 final  OLSearchType type;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TypeChangedCopyWith<_TypeChanged> get copyWith => __$TypeChangedCopyWithImpl<_TypeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TypeChanged&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'SearchEvent.typeChanged(type: $type)';
}


}

/// @nodoc
abstract mixin class _$TypeChangedCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory _$TypeChangedCopyWith(_TypeChanged value, $Res Function(_TypeChanged) _then) = __$TypeChangedCopyWithImpl;
@useResult
$Res call({
 OLSearchType type
});




}
/// @nodoc
class __$TypeChangedCopyWithImpl<$Res>
    implements _$TypeChangedCopyWith<$Res> {
  __$TypeChangedCopyWithImpl(this._self, this._then);

  final _TypeChanged _self;
  final $Res Function(_TypeChanged) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(_TypeChanged(
null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OLSearchType,
  ));
}


}

/// @nodoc


class _LoadMore implements SearchEvent {
  const _LoadMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.loadMore()';
}


}




/// @nodoc
mixin _$SearchState {

 SearchStatus get status; OLSearchType get searchType; List<OLSearchResultDoc> get books; bool get hasReachedMax; int get page; String get errorMessage; String get currentQuery;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.status, status) || other.status == status)&&(identical(other.searchType, searchType) || other.searchType == searchType)&&const DeepCollectionEquality().equals(other.books, books)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.page, page) || other.page == page)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentQuery, currentQuery) || other.currentQuery == currentQuery));
}


@override
int get hashCode => Object.hash(runtimeType,status,searchType,const DeepCollectionEquality().hash(books),hasReachedMax,page,errorMessage,currentQuery);

@override
String toString() {
  return 'SearchState(status: $status, searchType: $searchType, books: $books, hasReachedMax: $hasReachedMax, page: $page, errorMessage: $errorMessage, currentQuery: $currentQuery)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 SearchStatus status, OLSearchType searchType, List<OLSearchResultDoc> books, bool hasReachedMax, int page, String errorMessage, String currentQuery
});




}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? searchType = null,Object? books = null,Object? hasReachedMax = null,Object? page = null,Object? errorMessage = null,Object? currentQuery = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SearchStatus,searchType: null == searchType ? _self.searchType : searchType // ignore: cast_nullable_to_non_nullable
as OLSearchType,books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<OLSearchResultDoc>,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,currentQuery: null == currentQuery ? _self.currentQuery : currentQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SearchStatus status,  OLSearchType searchType,  List<OLSearchResultDoc> books,  bool hasReachedMax,  int page,  String errorMessage,  String currentQuery)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.status,_that.searchType,_that.books,_that.hasReachedMax,_that.page,_that.errorMessage,_that.currentQuery);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SearchStatus status,  OLSearchType searchType,  List<OLSearchResultDoc> books,  bool hasReachedMax,  int page,  String errorMessage,  String currentQuery)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.status,_that.searchType,_that.books,_that.hasReachedMax,_that.page,_that.errorMessage,_that.currentQuery);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SearchStatus status,  OLSearchType searchType,  List<OLSearchResultDoc> books,  bool hasReachedMax,  int page,  String errorMessage,  String currentQuery)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.status,_that.searchType,_that.books,_that.hasReachedMax,_that.page,_that.errorMessage,_that.currentQuery);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState implements SearchState {
  const _SearchState({this.status = SearchStatus.initial, this.searchType = OLSearchType.general, final  List<OLSearchResultDoc> books = const [], this.hasReachedMax = false, this.page = 0, this.errorMessage = '', this.currentQuery = ''}): _books = books;
  

@override@JsonKey() final  SearchStatus status;
@override@JsonKey() final  OLSearchType searchType;
 final  List<OLSearchResultDoc> _books;
@override@JsonKey() List<OLSearchResultDoc> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}

@override@JsonKey() final  bool hasReachedMax;
@override@JsonKey() final  int page;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  String currentQuery;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.status, status) || other.status == status)&&(identical(other.searchType, searchType) || other.searchType == searchType)&&const DeepCollectionEquality().equals(other._books, _books)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.page, page) || other.page == page)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentQuery, currentQuery) || other.currentQuery == currentQuery));
}


@override
int get hashCode => Object.hash(runtimeType,status,searchType,const DeepCollectionEquality().hash(_books),hasReachedMax,page,errorMessage,currentQuery);

@override
String toString() {
  return 'SearchState(status: $status, searchType: $searchType, books: $books, hasReachedMax: $hasReachedMax, page: $page, errorMessage: $errorMessage, currentQuery: $currentQuery)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 SearchStatus status, OLSearchType searchType, List<OLSearchResultDoc> books, bool hasReachedMax, int page, String errorMessage, String currentQuery
});




}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? searchType = null,Object? books = null,Object? hasReachedMax = null,Object? page = null,Object? errorMessage = null,Object? currentQuery = null,}) {
  return _then(_SearchState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SearchStatus,searchType: null == searchType ? _self.searchType : searchType // ignore: cast_nullable_to_non_nullable
as OLSearchType,books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<OLSearchResultDoc>,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,currentQuery: null == currentQuery ? _self.currentQuery : currentQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
