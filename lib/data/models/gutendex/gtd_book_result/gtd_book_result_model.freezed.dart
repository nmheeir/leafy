// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gtd_book_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GtdBookResultModel {

 int? get id; String? get title; List<GtdPerson> get authors; List<String> get summaries; List<GtdPerson> get editors; List<GtdPerson> get translators; List<String> get subjects; List<String> get bookshelves; List<String> get languages; bool? get copyright;@JsonKey(name: 'media_type') String? get mediaType; GtdFormat? get formats;@JsonKey(name: 'download_count') int? get downloadCount;
/// Create a copy of GtdBookResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GtdBookResultModelCopyWith<GtdBookResultModel> get copyWith => _$GtdBookResultModelCopyWithImpl<GtdBookResultModel>(this as GtdBookResultModel, _$identity);

  /// Serializes this GtdBookResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GtdBookResultModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.authors, authors)&&const DeepCollectionEquality().equals(other.summaries, summaries)&&const DeepCollectionEquality().equals(other.editors, editors)&&const DeepCollectionEquality().equals(other.translators, translators)&&const DeepCollectionEquality().equals(other.subjects, subjects)&&const DeepCollectionEquality().equals(other.bookshelves, bookshelves)&&const DeepCollectionEquality().equals(other.languages, languages)&&(identical(other.copyright, copyright) || other.copyright == copyright)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.formats, formats) || other.formats == formats)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(authors),const DeepCollectionEquality().hash(summaries),const DeepCollectionEquality().hash(editors),const DeepCollectionEquality().hash(translators),const DeepCollectionEquality().hash(subjects),const DeepCollectionEquality().hash(bookshelves),const DeepCollectionEquality().hash(languages),copyright,mediaType,formats,downloadCount);

@override
String toString() {
  return 'GtdBookResultModel(id: $id, title: $title, authors: $authors, summaries: $summaries, editors: $editors, translators: $translators, subjects: $subjects, bookshelves: $bookshelves, languages: $languages, copyright: $copyright, mediaType: $mediaType, formats: $formats, downloadCount: $downloadCount)';
}


}

/// @nodoc
abstract mixin class $GtdBookResultModelCopyWith<$Res>  {
  factory $GtdBookResultModelCopyWith(GtdBookResultModel value, $Res Function(GtdBookResultModel) _then) = _$GtdBookResultModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? title, List<GtdPerson> authors, List<String> summaries, List<GtdPerson> editors, List<GtdPerson> translators, List<String> subjects, List<String> bookshelves, List<String> languages, bool? copyright,@JsonKey(name: 'media_type') String? mediaType, GtdFormat? formats,@JsonKey(name: 'download_count') int? downloadCount
});


$GtdFormatCopyWith<$Res>? get formats;

}
/// @nodoc
class _$GtdBookResultModelCopyWithImpl<$Res>
    implements $GtdBookResultModelCopyWith<$Res> {
  _$GtdBookResultModelCopyWithImpl(this._self, this._then);

  final GtdBookResultModel _self;
  final $Res Function(GtdBookResultModel) _then;

/// Create a copy of GtdBookResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? authors = null,Object? summaries = null,Object? editors = null,Object? translators = null,Object? subjects = null,Object? bookshelves = null,Object? languages = null,Object? copyright = freezed,Object? mediaType = freezed,Object? formats = freezed,Object? downloadCount = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<GtdPerson>,summaries: null == summaries ? _self.summaries : summaries // ignore: cast_nullable_to_non_nullable
as List<String>,editors: null == editors ? _self.editors : editors // ignore: cast_nullable_to_non_nullable
as List<GtdPerson>,translators: null == translators ? _self.translators : translators // ignore: cast_nullable_to_non_nullable
as List<GtdPerson>,subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<String>,bookshelves: null == bookshelves ? _self.bookshelves : bookshelves // ignore: cast_nullable_to_non_nullable
as List<String>,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,copyright: freezed == copyright ? _self.copyright : copyright // ignore: cast_nullable_to_non_nullable
as bool?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,formats: freezed == formats ? _self.formats : formats // ignore: cast_nullable_to_non_nullable
as GtdFormat?,downloadCount: freezed == downloadCount ? _self.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of GtdBookResultModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GtdFormatCopyWith<$Res>? get formats {
    if (_self.formats == null) {
    return null;
  }

  return $GtdFormatCopyWith<$Res>(_self.formats!, (value) {
    return _then(_self.copyWith(formats: value));
  });
}
}


/// Adds pattern-matching-related methods to [GtdBookResultModel].
extension GtdBookResultModelPatterns on GtdBookResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GtdBookResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GtdBookResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GtdBookResultModel value)  $default,){
final _that = this;
switch (_that) {
case _GtdBookResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GtdBookResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _GtdBookResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? title,  List<GtdPerson> authors,  List<String> summaries,  List<GtdPerson> editors,  List<GtdPerson> translators,  List<String> subjects,  List<String> bookshelves,  List<String> languages,  bool? copyright, @JsonKey(name: 'media_type')  String? mediaType,  GtdFormat? formats, @JsonKey(name: 'download_count')  int? downloadCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GtdBookResultModel() when $default != null:
return $default(_that.id,_that.title,_that.authors,_that.summaries,_that.editors,_that.translators,_that.subjects,_that.bookshelves,_that.languages,_that.copyright,_that.mediaType,_that.formats,_that.downloadCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? title,  List<GtdPerson> authors,  List<String> summaries,  List<GtdPerson> editors,  List<GtdPerson> translators,  List<String> subjects,  List<String> bookshelves,  List<String> languages,  bool? copyright, @JsonKey(name: 'media_type')  String? mediaType,  GtdFormat? formats, @JsonKey(name: 'download_count')  int? downloadCount)  $default,) {final _that = this;
switch (_that) {
case _GtdBookResultModel():
return $default(_that.id,_that.title,_that.authors,_that.summaries,_that.editors,_that.translators,_that.subjects,_that.bookshelves,_that.languages,_that.copyright,_that.mediaType,_that.formats,_that.downloadCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? title,  List<GtdPerson> authors,  List<String> summaries,  List<GtdPerson> editors,  List<GtdPerson> translators,  List<String> subjects,  List<String> bookshelves,  List<String> languages,  bool? copyright, @JsonKey(name: 'media_type')  String? mediaType,  GtdFormat? formats, @JsonKey(name: 'download_count')  int? downloadCount)?  $default,) {final _that = this;
switch (_that) {
case _GtdBookResultModel() when $default != null:
return $default(_that.id,_that.title,_that.authors,_that.summaries,_that.editors,_that.translators,_that.subjects,_that.bookshelves,_that.languages,_that.copyright,_that.mediaType,_that.formats,_that.downloadCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GtdBookResultModel implements GtdBookResultModel {
  const _GtdBookResultModel({required this.id, required this.title, required final  List<GtdPerson> authors, required final  List<String> summaries, required final  List<GtdPerson> editors, required final  List<GtdPerson> translators, required final  List<String> subjects, required final  List<String> bookshelves, required final  List<String> languages, required this.copyright, @JsonKey(name: 'media_type') required this.mediaType, required this.formats, @JsonKey(name: 'download_count') required this.downloadCount}): _authors = authors,_summaries = summaries,_editors = editors,_translators = translators,_subjects = subjects,_bookshelves = bookshelves,_languages = languages;
  factory _GtdBookResultModel.fromJson(Map<String, dynamic> json) => _$GtdBookResultModelFromJson(json);

@override final  int? id;
@override final  String? title;
 final  List<GtdPerson> _authors;
@override List<GtdPerson> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

 final  List<String> _summaries;
@override List<String> get summaries {
  if (_summaries is EqualUnmodifiableListView) return _summaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_summaries);
}

 final  List<GtdPerson> _editors;
@override List<GtdPerson> get editors {
  if (_editors is EqualUnmodifiableListView) return _editors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_editors);
}

 final  List<GtdPerson> _translators;
@override List<GtdPerson> get translators {
  if (_translators is EqualUnmodifiableListView) return _translators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_translators);
}

 final  List<String> _subjects;
@override List<String> get subjects {
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjects);
}

 final  List<String> _bookshelves;
@override List<String> get bookshelves {
  if (_bookshelves is EqualUnmodifiableListView) return _bookshelves;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookshelves);
}

 final  List<String> _languages;
@override List<String> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}

@override final  bool? copyright;
@override@JsonKey(name: 'media_type') final  String? mediaType;
@override final  GtdFormat? formats;
@override@JsonKey(name: 'download_count') final  int? downloadCount;

/// Create a copy of GtdBookResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GtdBookResultModelCopyWith<_GtdBookResultModel> get copyWith => __$GtdBookResultModelCopyWithImpl<_GtdBookResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GtdBookResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GtdBookResultModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._authors, _authors)&&const DeepCollectionEquality().equals(other._summaries, _summaries)&&const DeepCollectionEquality().equals(other._editors, _editors)&&const DeepCollectionEquality().equals(other._translators, _translators)&&const DeepCollectionEquality().equals(other._subjects, _subjects)&&const DeepCollectionEquality().equals(other._bookshelves, _bookshelves)&&const DeepCollectionEquality().equals(other._languages, _languages)&&(identical(other.copyright, copyright) || other.copyright == copyright)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.formats, formats) || other.formats == formats)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(_authors),const DeepCollectionEquality().hash(_summaries),const DeepCollectionEquality().hash(_editors),const DeepCollectionEquality().hash(_translators),const DeepCollectionEquality().hash(_subjects),const DeepCollectionEquality().hash(_bookshelves),const DeepCollectionEquality().hash(_languages),copyright,mediaType,formats,downloadCount);

@override
String toString() {
  return 'GtdBookResultModel(id: $id, title: $title, authors: $authors, summaries: $summaries, editors: $editors, translators: $translators, subjects: $subjects, bookshelves: $bookshelves, languages: $languages, copyright: $copyright, mediaType: $mediaType, formats: $formats, downloadCount: $downloadCount)';
}


}

/// @nodoc
abstract mixin class _$GtdBookResultModelCopyWith<$Res> implements $GtdBookResultModelCopyWith<$Res> {
  factory _$GtdBookResultModelCopyWith(_GtdBookResultModel value, $Res Function(_GtdBookResultModel) _then) = __$GtdBookResultModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? title, List<GtdPerson> authors, List<String> summaries, List<GtdPerson> editors, List<GtdPerson> translators, List<String> subjects, List<String> bookshelves, List<String> languages, bool? copyright,@JsonKey(name: 'media_type') String? mediaType, GtdFormat? formats,@JsonKey(name: 'download_count') int? downloadCount
});


@override $GtdFormatCopyWith<$Res>? get formats;

}
/// @nodoc
class __$GtdBookResultModelCopyWithImpl<$Res>
    implements _$GtdBookResultModelCopyWith<$Res> {
  __$GtdBookResultModelCopyWithImpl(this._self, this._then);

  final _GtdBookResultModel _self;
  final $Res Function(_GtdBookResultModel) _then;

/// Create a copy of GtdBookResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? authors = null,Object? summaries = null,Object? editors = null,Object? translators = null,Object? subjects = null,Object? bookshelves = null,Object? languages = null,Object? copyright = freezed,Object? mediaType = freezed,Object? formats = freezed,Object? downloadCount = freezed,}) {
  return _then(_GtdBookResultModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<GtdPerson>,summaries: null == summaries ? _self._summaries : summaries // ignore: cast_nullable_to_non_nullable
as List<String>,editors: null == editors ? _self._editors : editors // ignore: cast_nullable_to_non_nullable
as List<GtdPerson>,translators: null == translators ? _self._translators : translators // ignore: cast_nullable_to_non_nullable
as List<GtdPerson>,subjects: null == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<String>,bookshelves: null == bookshelves ? _self._bookshelves : bookshelves // ignore: cast_nullable_to_non_nullable
as List<String>,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,copyright: freezed == copyright ? _self.copyright : copyright // ignore: cast_nullable_to_non_nullable
as bool?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,formats: freezed == formats ? _self.formats : formats // ignore: cast_nullable_to_non_nullable
as GtdFormat?,downloadCount: freezed == downloadCount ? _self.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of GtdBookResultModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GtdFormatCopyWith<$Res>? get formats {
    if (_self.formats == null) {
    return null;
  }

  return $GtdFormatCopyWith<$Res>(_self.formats!, (value) {
    return _then(_self.copyWith(formats: value));
  });
}
}

// dart format on
