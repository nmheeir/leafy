// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ol_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OLSearchResultModel {

 List<OLSearchResultDocModel> get docs; int? get numFound; int? get start; bool? get numFoundExact; int? get openLibrarySearchResultNumFound; String? get q; dynamic get offset;
/// Create a copy of OLSearchResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OLSearchResultModelCopyWith<OLSearchResultModel> get copyWith => _$OLSearchResultModelCopyWithImpl<OLSearchResultModel>(this as OLSearchResultModel, _$identity);

  /// Serializes this OLSearchResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OLSearchResultModel&&const DeepCollectionEquality().equals(other.docs, docs)&&(identical(other.numFound, numFound) || other.numFound == numFound)&&(identical(other.start, start) || other.start == start)&&(identical(other.numFoundExact, numFoundExact) || other.numFoundExact == numFoundExact)&&(identical(other.openLibrarySearchResultNumFound, openLibrarySearchResultNumFound) || other.openLibrarySearchResultNumFound == openLibrarySearchResultNumFound)&&(identical(other.q, q) || other.q == q)&&const DeepCollectionEquality().equals(other.offset, offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(docs),numFound,start,numFoundExact,openLibrarySearchResultNumFound,q,const DeepCollectionEquality().hash(offset));

@override
String toString() {
  return 'OLSearchResultModel(docs: $docs, numFound: $numFound, start: $start, numFoundExact: $numFoundExact, openLibrarySearchResultNumFound: $openLibrarySearchResultNumFound, q: $q, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $OLSearchResultModelCopyWith<$Res>  {
  factory $OLSearchResultModelCopyWith(OLSearchResultModel value, $Res Function(OLSearchResultModel) _then) = _$OLSearchResultModelCopyWithImpl;
@useResult
$Res call({
 List<OLSearchResultDocModel> docs, int? numFound, int? start, bool? numFoundExact, int? openLibrarySearchResultNumFound, String? q, dynamic offset
});




}
/// @nodoc
class _$OLSearchResultModelCopyWithImpl<$Res>
    implements $OLSearchResultModelCopyWith<$Res> {
  _$OLSearchResultModelCopyWithImpl(this._self, this._then);

  final OLSearchResultModel _self;
  final $Res Function(OLSearchResultModel) _then;

/// Create a copy of OLSearchResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? docs = null,Object? numFound = freezed,Object? start = freezed,Object? numFoundExact = freezed,Object? openLibrarySearchResultNumFound = freezed,Object? q = freezed,Object? offset = freezed,}) {
  return _then(_self.copyWith(
docs: null == docs ? _self.docs : docs // ignore: cast_nullable_to_non_nullable
as List<OLSearchResultDocModel>,numFound: freezed == numFound ? _self.numFound : numFound // ignore: cast_nullable_to_non_nullable
as int?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as int?,numFoundExact: freezed == numFoundExact ? _self.numFoundExact : numFoundExact // ignore: cast_nullable_to_non_nullable
as bool?,openLibrarySearchResultNumFound: freezed == openLibrarySearchResultNumFound ? _self.openLibrarySearchResultNumFound : openLibrarySearchResultNumFound // ignore: cast_nullable_to_non_nullable
as int?,q: freezed == q ? _self.q : q // ignore: cast_nullable_to_non_nullable
as String?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [OLSearchResultModel].
extension OLSearchResultModelPatterns on OLSearchResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OLSearchResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OLSearchResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OLSearchResultModel value)  $default,){
final _that = this;
switch (_that) {
case _OLSearchResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OLSearchResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _OLSearchResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<OLSearchResultDocModel> docs,  int? numFound,  int? start,  bool? numFoundExact,  int? openLibrarySearchResultNumFound,  String? q,  dynamic offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OLSearchResultModel() when $default != null:
return $default(_that.docs,_that.numFound,_that.start,_that.numFoundExact,_that.openLibrarySearchResultNumFound,_that.q,_that.offset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<OLSearchResultDocModel> docs,  int? numFound,  int? start,  bool? numFoundExact,  int? openLibrarySearchResultNumFound,  String? q,  dynamic offset)  $default,) {final _that = this;
switch (_that) {
case _OLSearchResultModel():
return $default(_that.docs,_that.numFound,_that.start,_that.numFoundExact,_that.openLibrarySearchResultNumFound,_that.q,_that.offset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<OLSearchResultDocModel> docs,  int? numFound,  int? start,  bool? numFoundExact,  int? openLibrarySearchResultNumFound,  String? q,  dynamic offset)?  $default,) {final _that = this;
switch (_that) {
case _OLSearchResultModel() when $default != null:
return $default(_that.docs,_that.numFound,_that.start,_that.numFoundExact,_that.openLibrarySearchResultNumFound,_that.q,_that.offset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OLSearchResultModel extends OLSearchResultModel {
   _OLSearchResultModel({required final  List<OLSearchResultDocModel> docs, this.numFound, this.start, this.numFoundExact, this.openLibrarySearchResultNumFound, this.q, this.offset}): _docs = docs,super._();
  factory _OLSearchResultModel.fromJson(Map<String, dynamic> json) => _$OLSearchResultModelFromJson(json);

 final  List<OLSearchResultDocModel> _docs;
@override List<OLSearchResultDocModel> get docs {
  if (_docs is EqualUnmodifiableListView) return _docs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_docs);
}

@override final  int? numFound;
@override final  int? start;
@override final  bool? numFoundExact;
@override final  int? openLibrarySearchResultNumFound;
@override final  String? q;
@override final  dynamic offset;

/// Create a copy of OLSearchResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OLSearchResultModelCopyWith<_OLSearchResultModel> get copyWith => __$OLSearchResultModelCopyWithImpl<_OLSearchResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OLSearchResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OLSearchResultModel&&const DeepCollectionEquality().equals(other._docs, _docs)&&(identical(other.numFound, numFound) || other.numFound == numFound)&&(identical(other.start, start) || other.start == start)&&(identical(other.numFoundExact, numFoundExact) || other.numFoundExact == numFoundExact)&&(identical(other.openLibrarySearchResultNumFound, openLibrarySearchResultNumFound) || other.openLibrarySearchResultNumFound == openLibrarySearchResultNumFound)&&(identical(other.q, q) || other.q == q)&&const DeepCollectionEquality().equals(other.offset, offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_docs),numFound,start,numFoundExact,openLibrarySearchResultNumFound,q,const DeepCollectionEquality().hash(offset));

@override
String toString() {
  return 'OLSearchResultModel(docs: $docs, numFound: $numFound, start: $start, numFoundExact: $numFoundExact, openLibrarySearchResultNumFound: $openLibrarySearchResultNumFound, q: $q, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$OLSearchResultModelCopyWith<$Res> implements $OLSearchResultModelCopyWith<$Res> {
  factory _$OLSearchResultModelCopyWith(_OLSearchResultModel value, $Res Function(_OLSearchResultModel) _then) = __$OLSearchResultModelCopyWithImpl;
@override @useResult
$Res call({
 List<OLSearchResultDocModel> docs, int? numFound, int? start, bool? numFoundExact, int? openLibrarySearchResultNumFound, String? q, dynamic offset
});




}
/// @nodoc
class __$OLSearchResultModelCopyWithImpl<$Res>
    implements _$OLSearchResultModelCopyWith<$Res> {
  __$OLSearchResultModelCopyWithImpl(this._self, this._then);

  final _OLSearchResultModel _self;
  final $Res Function(_OLSearchResultModel) _then;

/// Create a copy of OLSearchResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? docs = null,Object? numFound = freezed,Object? start = freezed,Object? numFoundExact = freezed,Object? openLibrarySearchResultNumFound = freezed,Object? q = freezed,Object? offset = freezed,}) {
  return _then(_OLSearchResultModel(
docs: null == docs ? _self._docs : docs // ignore: cast_nullable_to_non_nullable
as List<OLSearchResultDocModel>,numFound: freezed == numFound ? _self.numFound : numFound // ignore: cast_nullable_to_non_nullable
as int?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as int?,numFoundExact: freezed == numFoundExact ? _self.numFoundExact : numFoundExact // ignore: cast_nullable_to_non_nullable
as bool?,openLibrarySearchResultNumFound: freezed == openLibrarySearchResultNumFound ? _self.openLibrarySearchResultNumFound : openLibrarySearchResultNumFound // ignore: cast_nullable_to_non_nullable
as int?,q: freezed == q ? _self.q : q // ignore: cast_nullable_to_non_nullable
as String?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
