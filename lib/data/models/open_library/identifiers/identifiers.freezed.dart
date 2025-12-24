// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'identifiers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Identifiers {

@JsonKey(name: "amazon") List<String>? get amazon;@JsonKey(name: "google") List<String>? get google;@JsonKey(name: "librarything") List<String>? get librarything;@JsonKey(name: "goodreads") List<String>? get goodreads;@JsonKey(name: "project_gutenberg") List<String>? get projectGutenberg;@JsonKey(name: "isbn_13") List<String>? get isbn13;@JsonKey(name: "isbn_10") List<String>? get isbn10;@JsonKey(name: "oclc") List<String>? get oclc;@JsonKey(name: "lccn") List<String>? get lccn;
/// Create a copy of Identifiers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdentifiersCopyWith<Identifiers> get copyWith => _$IdentifiersCopyWithImpl<Identifiers>(this as Identifiers, _$identity);

  /// Serializes this Identifiers to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Identifiers&&const DeepCollectionEquality().equals(other.amazon, amazon)&&const DeepCollectionEquality().equals(other.google, google)&&const DeepCollectionEquality().equals(other.librarything, librarything)&&const DeepCollectionEquality().equals(other.goodreads, goodreads)&&const DeepCollectionEquality().equals(other.projectGutenberg, projectGutenberg)&&const DeepCollectionEquality().equals(other.isbn13, isbn13)&&const DeepCollectionEquality().equals(other.isbn10, isbn10)&&const DeepCollectionEquality().equals(other.oclc, oclc)&&const DeepCollectionEquality().equals(other.lccn, lccn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(amazon),const DeepCollectionEquality().hash(google),const DeepCollectionEquality().hash(librarything),const DeepCollectionEquality().hash(goodreads),const DeepCollectionEquality().hash(projectGutenberg),const DeepCollectionEquality().hash(isbn13),const DeepCollectionEquality().hash(isbn10),const DeepCollectionEquality().hash(oclc),const DeepCollectionEquality().hash(lccn));

@override
String toString() {
  return 'Identifiers(amazon: $amazon, google: $google, librarything: $librarything, goodreads: $goodreads, projectGutenberg: $projectGutenberg, isbn13: $isbn13, isbn10: $isbn10, oclc: $oclc, lccn: $lccn)';
}


}

/// @nodoc
abstract mixin class $IdentifiersCopyWith<$Res>  {
  factory $IdentifiersCopyWith(Identifiers value, $Res Function(Identifiers) _then) = _$IdentifiersCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "amazon") List<String>? amazon,@JsonKey(name: "google") List<String>? google,@JsonKey(name: "librarything") List<String>? librarything,@JsonKey(name: "goodreads") List<String>? goodreads,@JsonKey(name: "project_gutenberg") List<String>? projectGutenberg,@JsonKey(name: "isbn_13") List<String>? isbn13,@JsonKey(name: "isbn_10") List<String>? isbn10,@JsonKey(name: "oclc") List<String>? oclc,@JsonKey(name: "lccn") List<String>? lccn
});




}
/// @nodoc
class _$IdentifiersCopyWithImpl<$Res>
    implements $IdentifiersCopyWith<$Res> {
  _$IdentifiersCopyWithImpl(this._self, this._then);

  final Identifiers _self;
  final $Res Function(Identifiers) _then;

/// Create a copy of Identifiers
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amazon = freezed,Object? google = freezed,Object? librarything = freezed,Object? goodreads = freezed,Object? projectGutenberg = freezed,Object? isbn13 = freezed,Object? isbn10 = freezed,Object? oclc = freezed,Object? lccn = freezed,}) {
  return _then(_self.copyWith(
amazon: freezed == amazon ? _self.amazon : amazon // ignore: cast_nullable_to_non_nullable
as List<String>?,google: freezed == google ? _self.google : google // ignore: cast_nullable_to_non_nullable
as List<String>?,librarything: freezed == librarything ? _self.librarything : librarything // ignore: cast_nullable_to_non_nullable
as List<String>?,goodreads: freezed == goodreads ? _self.goodreads : goodreads // ignore: cast_nullable_to_non_nullable
as List<String>?,projectGutenberg: freezed == projectGutenberg ? _self.projectGutenberg : projectGutenberg // ignore: cast_nullable_to_non_nullable
as List<String>?,isbn13: freezed == isbn13 ? _self.isbn13 : isbn13 // ignore: cast_nullable_to_non_nullable
as List<String>?,isbn10: freezed == isbn10 ? _self.isbn10 : isbn10 // ignore: cast_nullable_to_non_nullable
as List<String>?,oclc: freezed == oclc ? _self.oclc : oclc // ignore: cast_nullable_to_non_nullable
as List<String>?,lccn: freezed == lccn ? _self.lccn : lccn // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Identifiers].
extension IdentifiersPatterns on Identifiers {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Identifiers value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Identifiers() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Identifiers value)  $default,){
final _that = this;
switch (_that) {
case _Identifiers():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Identifiers value)?  $default,){
final _that = this;
switch (_that) {
case _Identifiers() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "amazon")  List<String>? amazon, @JsonKey(name: "google")  List<String>? google, @JsonKey(name: "librarything")  List<String>? librarything, @JsonKey(name: "goodreads")  List<String>? goodreads, @JsonKey(name: "project_gutenberg")  List<String>? projectGutenberg, @JsonKey(name: "isbn_13")  List<String>? isbn13, @JsonKey(name: "isbn_10")  List<String>? isbn10, @JsonKey(name: "oclc")  List<String>? oclc, @JsonKey(name: "lccn")  List<String>? lccn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Identifiers() when $default != null:
return $default(_that.amazon,_that.google,_that.librarything,_that.goodreads,_that.projectGutenberg,_that.isbn13,_that.isbn10,_that.oclc,_that.lccn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "amazon")  List<String>? amazon, @JsonKey(name: "google")  List<String>? google, @JsonKey(name: "librarything")  List<String>? librarything, @JsonKey(name: "goodreads")  List<String>? goodreads, @JsonKey(name: "project_gutenberg")  List<String>? projectGutenberg, @JsonKey(name: "isbn_13")  List<String>? isbn13, @JsonKey(name: "isbn_10")  List<String>? isbn10, @JsonKey(name: "oclc")  List<String>? oclc, @JsonKey(name: "lccn")  List<String>? lccn)  $default,) {final _that = this;
switch (_that) {
case _Identifiers():
return $default(_that.amazon,_that.google,_that.librarything,_that.goodreads,_that.projectGutenberg,_that.isbn13,_that.isbn10,_that.oclc,_that.lccn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "amazon")  List<String>? amazon, @JsonKey(name: "google")  List<String>? google, @JsonKey(name: "librarything")  List<String>? librarything, @JsonKey(name: "goodreads")  List<String>? goodreads, @JsonKey(name: "project_gutenberg")  List<String>? projectGutenberg, @JsonKey(name: "isbn_13")  List<String>? isbn13, @JsonKey(name: "isbn_10")  List<String>? isbn10, @JsonKey(name: "oclc")  List<String>? oclc, @JsonKey(name: "lccn")  List<String>? lccn)?  $default,) {final _that = this;
switch (_that) {
case _Identifiers() when $default != null:
return $default(_that.amazon,_that.google,_that.librarything,_that.goodreads,_that.projectGutenberg,_that.isbn13,_that.isbn10,_that.oclc,_that.lccn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Identifiers implements Identifiers {
  const _Identifiers({@JsonKey(name: "amazon") final  List<String>? amazon, @JsonKey(name: "google") final  List<String>? google, @JsonKey(name: "librarything") final  List<String>? librarything, @JsonKey(name: "goodreads") final  List<String>? goodreads, @JsonKey(name: "project_gutenberg") final  List<String>? projectGutenberg, @JsonKey(name: "isbn_13") final  List<String>? isbn13, @JsonKey(name: "isbn_10") final  List<String>? isbn10, @JsonKey(name: "oclc") final  List<String>? oclc, @JsonKey(name: "lccn") final  List<String>? lccn}): _amazon = amazon,_google = google,_librarything = librarything,_goodreads = goodreads,_projectGutenberg = projectGutenberg,_isbn13 = isbn13,_isbn10 = isbn10,_oclc = oclc,_lccn = lccn;
  factory _Identifiers.fromJson(Map<String, dynamic> json) => _$IdentifiersFromJson(json);

 final  List<String>? _amazon;
@override@JsonKey(name: "amazon") List<String>? get amazon {
  final value = _amazon;
  if (value == null) return null;
  if (_amazon is EqualUnmodifiableListView) return _amazon;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _google;
@override@JsonKey(name: "google") List<String>? get google {
  final value = _google;
  if (value == null) return null;
  if (_google is EqualUnmodifiableListView) return _google;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _librarything;
@override@JsonKey(name: "librarything") List<String>? get librarything {
  final value = _librarything;
  if (value == null) return null;
  if (_librarything is EqualUnmodifiableListView) return _librarything;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _goodreads;
@override@JsonKey(name: "goodreads") List<String>? get goodreads {
  final value = _goodreads;
  if (value == null) return null;
  if (_goodreads is EqualUnmodifiableListView) return _goodreads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _projectGutenberg;
@override@JsonKey(name: "project_gutenberg") List<String>? get projectGutenberg {
  final value = _projectGutenberg;
  if (value == null) return null;
  if (_projectGutenberg is EqualUnmodifiableListView) return _projectGutenberg;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _isbn13;
@override@JsonKey(name: "isbn_13") List<String>? get isbn13 {
  final value = _isbn13;
  if (value == null) return null;
  if (_isbn13 is EqualUnmodifiableListView) return _isbn13;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _isbn10;
@override@JsonKey(name: "isbn_10") List<String>? get isbn10 {
  final value = _isbn10;
  if (value == null) return null;
  if (_isbn10 is EqualUnmodifiableListView) return _isbn10;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _oclc;
@override@JsonKey(name: "oclc") List<String>? get oclc {
  final value = _oclc;
  if (value == null) return null;
  if (_oclc is EqualUnmodifiableListView) return _oclc;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _lccn;
@override@JsonKey(name: "lccn") List<String>? get lccn {
  final value = _lccn;
  if (value == null) return null;
  if (_lccn is EqualUnmodifiableListView) return _lccn;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Identifiers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdentifiersCopyWith<_Identifiers> get copyWith => __$IdentifiersCopyWithImpl<_Identifiers>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IdentifiersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Identifiers&&const DeepCollectionEquality().equals(other._amazon, _amazon)&&const DeepCollectionEquality().equals(other._google, _google)&&const DeepCollectionEquality().equals(other._librarything, _librarything)&&const DeepCollectionEquality().equals(other._goodreads, _goodreads)&&const DeepCollectionEquality().equals(other._projectGutenberg, _projectGutenberg)&&const DeepCollectionEquality().equals(other._isbn13, _isbn13)&&const DeepCollectionEquality().equals(other._isbn10, _isbn10)&&const DeepCollectionEquality().equals(other._oclc, _oclc)&&const DeepCollectionEquality().equals(other._lccn, _lccn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_amazon),const DeepCollectionEquality().hash(_google),const DeepCollectionEquality().hash(_librarything),const DeepCollectionEquality().hash(_goodreads),const DeepCollectionEquality().hash(_projectGutenberg),const DeepCollectionEquality().hash(_isbn13),const DeepCollectionEquality().hash(_isbn10),const DeepCollectionEquality().hash(_oclc),const DeepCollectionEquality().hash(_lccn));

@override
String toString() {
  return 'Identifiers(amazon: $amazon, google: $google, librarything: $librarything, goodreads: $goodreads, projectGutenberg: $projectGutenberg, isbn13: $isbn13, isbn10: $isbn10, oclc: $oclc, lccn: $lccn)';
}


}

/// @nodoc
abstract mixin class _$IdentifiersCopyWith<$Res> implements $IdentifiersCopyWith<$Res> {
  factory _$IdentifiersCopyWith(_Identifiers value, $Res Function(_Identifiers) _then) = __$IdentifiersCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "amazon") List<String>? amazon,@JsonKey(name: "google") List<String>? google,@JsonKey(name: "librarything") List<String>? librarything,@JsonKey(name: "goodreads") List<String>? goodreads,@JsonKey(name: "project_gutenberg") List<String>? projectGutenberg,@JsonKey(name: "isbn_13") List<String>? isbn13,@JsonKey(name: "isbn_10") List<String>? isbn10,@JsonKey(name: "oclc") List<String>? oclc,@JsonKey(name: "lccn") List<String>? lccn
});




}
/// @nodoc
class __$IdentifiersCopyWithImpl<$Res>
    implements _$IdentifiersCopyWith<$Res> {
  __$IdentifiersCopyWithImpl(this._self, this._then);

  final _Identifiers _self;
  final $Res Function(_Identifiers) _then;

/// Create a copy of Identifiers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amazon = freezed,Object? google = freezed,Object? librarything = freezed,Object? goodreads = freezed,Object? projectGutenberg = freezed,Object? isbn13 = freezed,Object? isbn10 = freezed,Object? oclc = freezed,Object? lccn = freezed,}) {
  return _then(_Identifiers(
amazon: freezed == amazon ? _self._amazon : amazon // ignore: cast_nullable_to_non_nullable
as List<String>?,google: freezed == google ? _self._google : google // ignore: cast_nullable_to_non_nullable
as List<String>?,librarything: freezed == librarything ? _self._librarything : librarything // ignore: cast_nullable_to_non_nullable
as List<String>?,goodreads: freezed == goodreads ? _self._goodreads : goodreads // ignore: cast_nullable_to_non_nullable
as List<String>?,projectGutenberg: freezed == projectGutenberg ? _self._projectGutenberg : projectGutenberg // ignore: cast_nullable_to_non_nullable
as List<String>?,isbn13: freezed == isbn13 ? _self._isbn13 : isbn13 // ignore: cast_nullable_to_non_nullable
as List<String>?,isbn10: freezed == isbn10 ? _self._isbn10 : isbn10 // ignore: cast_nullable_to_non_nullable
as List<String>?,oclc: freezed == oclc ? _self._oclc : oclc // ignore: cast_nullable_to_non_nullable
as List<String>?,lccn: freezed == lccn ? _self._lccn : lccn // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
