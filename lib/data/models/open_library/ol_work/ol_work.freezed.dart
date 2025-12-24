// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ol_work.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OLWork {

@JsonKey(name: "first_publish_date") String? get firstPublishDate;@JsonKey(name: "description") Created? get description;@JsonKey(name: "links") List<OLLink>? get links;@JsonKey(name: "title") String? get title;@JsonKey(name: "created") Created? get created;@JsonKey(name: "last_modified") Created? get lastModified;@JsonKey(name: "covers") List<int>? get covers;@JsonKey(name: "lc_classifications") List<String>? get lcClassifications;@JsonKey(name: "latest_revision") int? get latestRevision;@JsonKey(name: "key") String? get key;@JsonKey(name: "authors") List<Author>? get authors;@JsonKey(name: "dewey_number") List<String>? get deweyNumber;@JsonKey(name: "type") OLType? get type;@JsonKey(name: "subjects") List<String>? get subjects;@JsonKey(name: "revision") int? get revision;
/// Create a copy of OLWork
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OLWorkCopyWith<OLWork> get copyWith => _$OLWorkCopyWithImpl<OLWork>(this as OLWork, _$identity);

  /// Serializes this OLWork to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OLWork&&(identical(other.firstPublishDate, firstPublishDate) || other.firstPublishDate == firstPublishDate)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.title, title) || other.title == title)&&(identical(other.created, created) || other.created == created)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&const DeepCollectionEquality().equals(other.covers, covers)&&const DeepCollectionEquality().equals(other.lcClassifications, lcClassifications)&&(identical(other.latestRevision, latestRevision) || other.latestRevision == latestRevision)&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other.authors, authors)&&const DeepCollectionEquality().equals(other.deweyNumber, deweyNumber)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.subjects, subjects)&&(identical(other.revision, revision) || other.revision == revision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstPublishDate,description,const DeepCollectionEquality().hash(links),title,created,lastModified,const DeepCollectionEquality().hash(covers),const DeepCollectionEquality().hash(lcClassifications),latestRevision,key,const DeepCollectionEquality().hash(authors),const DeepCollectionEquality().hash(deweyNumber),type,const DeepCollectionEquality().hash(subjects),revision);

@override
String toString() {
  return 'OLWork(firstPublishDate: $firstPublishDate, description: $description, links: $links, title: $title, created: $created, lastModified: $lastModified, covers: $covers, lcClassifications: $lcClassifications, latestRevision: $latestRevision, key: $key, authors: $authors, deweyNumber: $deweyNumber, type: $type, subjects: $subjects, revision: $revision)';
}


}

/// @nodoc
abstract mixin class $OLWorkCopyWith<$Res>  {
  factory $OLWorkCopyWith(OLWork value, $Res Function(OLWork) _then) = _$OLWorkCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "first_publish_date") String? firstPublishDate,@JsonKey(name: "description") Created? description,@JsonKey(name: "links") List<OLLink>? links,@JsonKey(name: "title") String? title,@JsonKey(name: "created") Created? created,@JsonKey(name: "last_modified") Created? lastModified,@JsonKey(name: "covers") List<int>? covers,@JsonKey(name: "lc_classifications") List<String>? lcClassifications,@JsonKey(name: "latest_revision") int? latestRevision,@JsonKey(name: "key") String? key,@JsonKey(name: "authors") List<Author>? authors,@JsonKey(name: "dewey_number") List<String>? deweyNumber,@JsonKey(name: "type") OLType? type,@JsonKey(name: "subjects") List<String>? subjects,@JsonKey(name: "revision") int? revision
});


$CreatedCopyWith<$Res>? get description;$CreatedCopyWith<$Res>? get created;$CreatedCopyWith<$Res>? get lastModified;$OLTypeCopyWith<$Res>? get type;

}
/// @nodoc
class _$OLWorkCopyWithImpl<$Res>
    implements $OLWorkCopyWith<$Res> {
  _$OLWorkCopyWithImpl(this._self, this._then);

  final OLWork _self;
  final $Res Function(OLWork) _then;

/// Create a copy of OLWork
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstPublishDate = freezed,Object? description = freezed,Object? links = freezed,Object? title = freezed,Object? created = freezed,Object? lastModified = freezed,Object? covers = freezed,Object? lcClassifications = freezed,Object? latestRevision = freezed,Object? key = freezed,Object? authors = freezed,Object? deweyNumber = freezed,Object? type = freezed,Object? subjects = freezed,Object? revision = freezed,}) {
  return _then(_self.copyWith(
firstPublishDate: freezed == firstPublishDate ? _self.firstPublishDate : firstPublishDate // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Created?,links: freezed == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<OLLink>?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as Created?,lastModified: freezed == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as Created?,covers: freezed == covers ? _self.covers : covers // ignore: cast_nullable_to_non_nullable
as List<int>?,lcClassifications: freezed == lcClassifications ? _self.lcClassifications : lcClassifications // ignore: cast_nullable_to_non_nullable
as List<String>?,latestRevision: freezed == latestRevision ? _self.latestRevision : latestRevision // ignore: cast_nullable_to_non_nullable
as int?,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,authors: freezed == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<Author>?,deweyNumber: freezed == deweyNumber ? _self.deweyNumber : deweyNumber // ignore: cast_nullable_to_non_nullable
as List<String>?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OLType?,subjects: freezed == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<String>?,revision: freezed == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of OLWork
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedCopyWith<$Res>? get description {
    if (_self.description == null) {
    return null;
  }

  return $CreatedCopyWith<$Res>(_self.description!, (value) {
    return _then(_self.copyWith(description: value));
  });
}/// Create a copy of OLWork
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedCopyWith<$Res>? get created {
    if (_self.created == null) {
    return null;
  }

  return $CreatedCopyWith<$Res>(_self.created!, (value) {
    return _then(_self.copyWith(created: value));
  });
}/// Create a copy of OLWork
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedCopyWith<$Res>? get lastModified {
    if (_self.lastModified == null) {
    return null;
  }

  return $CreatedCopyWith<$Res>(_self.lastModified!, (value) {
    return _then(_self.copyWith(lastModified: value));
  });
}/// Create a copy of OLWork
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OLTypeCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $OLTypeCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [OLWork].
extension OLWorkPatterns on OLWork {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OLWork value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OLWork() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OLWork value)  $default,){
final _that = this;
switch (_that) {
case _OLWork():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OLWork value)?  $default,){
final _that = this;
switch (_that) {
case _OLWork() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "first_publish_date")  String? firstPublishDate, @JsonKey(name: "description")  Created? description, @JsonKey(name: "links")  List<OLLink>? links, @JsonKey(name: "title")  String? title, @JsonKey(name: "created")  Created? created, @JsonKey(name: "last_modified")  Created? lastModified, @JsonKey(name: "covers")  List<int>? covers, @JsonKey(name: "lc_classifications")  List<String>? lcClassifications, @JsonKey(name: "latest_revision")  int? latestRevision, @JsonKey(name: "key")  String? key, @JsonKey(name: "authors")  List<Author>? authors, @JsonKey(name: "dewey_number")  List<String>? deweyNumber, @JsonKey(name: "type")  OLType? type, @JsonKey(name: "subjects")  List<String>? subjects, @JsonKey(name: "revision")  int? revision)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OLWork() when $default != null:
return $default(_that.firstPublishDate,_that.description,_that.links,_that.title,_that.created,_that.lastModified,_that.covers,_that.lcClassifications,_that.latestRevision,_that.key,_that.authors,_that.deweyNumber,_that.type,_that.subjects,_that.revision);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "first_publish_date")  String? firstPublishDate, @JsonKey(name: "description")  Created? description, @JsonKey(name: "links")  List<OLLink>? links, @JsonKey(name: "title")  String? title, @JsonKey(name: "created")  Created? created, @JsonKey(name: "last_modified")  Created? lastModified, @JsonKey(name: "covers")  List<int>? covers, @JsonKey(name: "lc_classifications")  List<String>? lcClassifications, @JsonKey(name: "latest_revision")  int? latestRevision, @JsonKey(name: "key")  String? key, @JsonKey(name: "authors")  List<Author>? authors, @JsonKey(name: "dewey_number")  List<String>? deweyNumber, @JsonKey(name: "type")  OLType? type, @JsonKey(name: "subjects")  List<String>? subjects, @JsonKey(name: "revision")  int? revision)  $default,) {final _that = this;
switch (_that) {
case _OLWork():
return $default(_that.firstPublishDate,_that.description,_that.links,_that.title,_that.created,_that.lastModified,_that.covers,_that.lcClassifications,_that.latestRevision,_that.key,_that.authors,_that.deweyNumber,_that.type,_that.subjects,_that.revision);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "first_publish_date")  String? firstPublishDate, @JsonKey(name: "description")  Created? description, @JsonKey(name: "links")  List<OLLink>? links, @JsonKey(name: "title")  String? title, @JsonKey(name: "created")  Created? created, @JsonKey(name: "last_modified")  Created? lastModified, @JsonKey(name: "covers")  List<int>? covers, @JsonKey(name: "lc_classifications")  List<String>? lcClassifications, @JsonKey(name: "latest_revision")  int? latestRevision, @JsonKey(name: "key")  String? key, @JsonKey(name: "authors")  List<Author>? authors, @JsonKey(name: "dewey_number")  List<String>? deweyNumber, @JsonKey(name: "type")  OLType? type, @JsonKey(name: "subjects")  List<String>? subjects, @JsonKey(name: "revision")  int? revision)?  $default,) {final _that = this;
switch (_that) {
case _OLWork() when $default != null:
return $default(_that.firstPublishDate,_that.description,_that.links,_that.title,_that.created,_that.lastModified,_that.covers,_that.lcClassifications,_that.latestRevision,_that.key,_that.authors,_that.deweyNumber,_that.type,_that.subjects,_that.revision);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OLWork implements OLWork {
  const _OLWork({@JsonKey(name: "first_publish_date") this.firstPublishDate, @JsonKey(name: "description") this.description, @JsonKey(name: "links") final  List<OLLink>? links, @JsonKey(name: "title") this.title, @JsonKey(name: "created") this.created, @JsonKey(name: "last_modified") this.lastModified, @JsonKey(name: "covers") final  List<int>? covers, @JsonKey(name: "lc_classifications") final  List<String>? lcClassifications, @JsonKey(name: "latest_revision") this.latestRevision, @JsonKey(name: "key") this.key, @JsonKey(name: "authors") final  List<Author>? authors, @JsonKey(name: "dewey_number") final  List<String>? deweyNumber, @JsonKey(name: "type") this.type, @JsonKey(name: "subjects") final  List<String>? subjects, @JsonKey(name: "revision") this.revision}): _links = links,_covers = covers,_lcClassifications = lcClassifications,_authors = authors,_deweyNumber = deweyNumber,_subjects = subjects;
  factory _OLWork.fromJson(Map<String, dynamic> json) => _$OLWorkFromJson(json);

@override@JsonKey(name: "first_publish_date") final  String? firstPublishDate;
@override@JsonKey(name: "description") final  Created? description;
 final  List<OLLink>? _links;
@override@JsonKey(name: "links") List<OLLink>? get links {
  final value = _links;
  if (value == null) return null;
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "title") final  String? title;
@override@JsonKey(name: "created") final  Created? created;
@override@JsonKey(name: "last_modified") final  Created? lastModified;
 final  List<int>? _covers;
@override@JsonKey(name: "covers") List<int>? get covers {
  final value = _covers;
  if (value == null) return null;
  if (_covers is EqualUnmodifiableListView) return _covers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _lcClassifications;
@override@JsonKey(name: "lc_classifications") List<String>? get lcClassifications {
  final value = _lcClassifications;
  if (value == null) return null;
  if (_lcClassifications is EqualUnmodifiableListView) return _lcClassifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "latest_revision") final  int? latestRevision;
@override@JsonKey(name: "key") final  String? key;
 final  List<Author>? _authors;
@override@JsonKey(name: "authors") List<Author>? get authors {
  final value = _authors;
  if (value == null) return null;
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _deweyNumber;
@override@JsonKey(name: "dewey_number") List<String>? get deweyNumber {
  final value = _deweyNumber;
  if (value == null) return null;
  if (_deweyNumber is EqualUnmodifiableListView) return _deweyNumber;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "type") final  OLType? type;
 final  List<String>? _subjects;
@override@JsonKey(name: "subjects") List<String>? get subjects {
  final value = _subjects;
  if (value == null) return null;
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "revision") final  int? revision;

/// Create a copy of OLWork
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OLWorkCopyWith<_OLWork> get copyWith => __$OLWorkCopyWithImpl<_OLWork>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OLWorkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OLWork&&(identical(other.firstPublishDate, firstPublishDate) || other.firstPublishDate == firstPublishDate)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._links, _links)&&(identical(other.title, title) || other.title == title)&&(identical(other.created, created) || other.created == created)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&const DeepCollectionEquality().equals(other._covers, _covers)&&const DeepCollectionEquality().equals(other._lcClassifications, _lcClassifications)&&(identical(other.latestRevision, latestRevision) || other.latestRevision == latestRevision)&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other._authors, _authors)&&const DeepCollectionEquality().equals(other._deweyNumber, _deweyNumber)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._subjects, _subjects)&&(identical(other.revision, revision) || other.revision == revision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstPublishDate,description,const DeepCollectionEquality().hash(_links),title,created,lastModified,const DeepCollectionEquality().hash(_covers),const DeepCollectionEquality().hash(_lcClassifications),latestRevision,key,const DeepCollectionEquality().hash(_authors),const DeepCollectionEquality().hash(_deweyNumber),type,const DeepCollectionEquality().hash(_subjects),revision);

@override
String toString() {
  return 'OLWork(firstPublishDate: $firstPublishDate, description: $description, links: $links, title: $title, created: $created, lastModified: $lastModified, covers: $covers, lcClassifications: $lcClassifications, latestRevision: $latestRevision, key: $key, authors: $authors, deweyNumber: $deweyNumber, type: $type, subjects: $subjects, revision: $revision)';
}


}

/// @nodoc
abstract mixin class _$OLWorkCopyWith<$Res> implements $OLWorkCopyWith<$Res> {
  factory _$OLWorkCopyWith(_OLWork value, $Res Function(_OLWork) _then) = __$OLWorkCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "first_publish_date") String? firstPublishDate,@JsonKey(name: "description") Created? description,@JsonKey(name: "links") List<OLLink>? links,@JsonKey(name: "title") String? title,@JsonKey(name: "created") Created? created,@JsonKey(name: "last_modified") Created? lastModified,@JsonKey(name: "covers") List<int>? covers,@JsonKey(name: "lc_classifications") List<String>? lcClassifications,@JsonKey(name: "latest_revision") int? latestRevision,@JsonKey(name: "key") String? key,@JsonKey(name: "authors") List<Author>? authors,@JsonKey(name: "dewey_number") List<String>? deweyNumber,@JsonKey(name: "type") OLType? type,@JsonKey(name: "subjects") List<String>? subjects,@JsonKey(name: "revision") int? revision
});


@override $CreatedCopyWith<$Res>? get description;@override $CreatedCopyWith<$Res>? get created;@override $CreatedCopyWith<$Res>? get lastModified;@override $OLTypeCopyWith<$Res>? get type;

}
/// @nodoc
class __$OLWorkCopyWithImpl<$Res>
    implements _$OLWorkCopyWith<$Res> {
  __$OLWorkCopyWithImpl(this._self, this._then);

  final _OLWork _self;
  final $Res Function(_OLWork) _then;

/// Create a copy of OLWork
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstPublishDate = freezed,Object? description = freezed,Object? links = freezed,Object? title = freezed,Object? created = freezed,Object? lastModified = freezed,Object? covers = freezed,Object? lcClassifications = freezed,Object? latestRevision = freezed,Object? key = freezed,Object? authors = freezed,Object? deweyNumber = freezed,Object? type = freezed,Object? subjects = freezed,Object? revision = freezed,}) {
  return _then(_OLWork(
firstPublishDate: freezed == firstPublishDate ? _self.firstPublishDate : firstPublishDate // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Created?,links: freezed == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<OLLink>?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as Created?,lastModified: freezed == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as Created?,covers: freezed == covers ? _self._covers : covers // ignore: cast_nullable_to_non_nullable
as List<int>?,lcClassifications: freezed == lcClassifications ? _self._lcClassifications : lcClassifications // ignore: cast_nullable_to_non_nullable
as List<String>?,latestRevision: freezed == latestRevision ? _self.latestRevision : latestRevision // ignore: cast_nullable_to_non_nullable
as int?,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,authors: freezed == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<Author>?,deweyNumber: freezed == deweyNumber ? _self._deweyNumber : deweyNumber // ignore: cast_nullable_to_non_nullable
as List<String>?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OLType?,subjects: freezed == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<String>?,revision: freezed == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of OLWork
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedCopyWith<$Res>? get description {
    if (_self.description == null) {
    return null;
  }

  return $CreatedCopyWith<$Res>(_self.description!, (value) {
    return _then(_self.copyWith(description: value));
  });
}/// Create a copy of OLWork
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedCopyWith<$Res>? get created {
    if (_self.created == null) {
    return null;
  }

  return $CreatedCopyWith<$Res>(_self.created!, (value) {
    return _then(_self.copyWith(created: value));
  });
}/// Create a copy of OLWork
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedCopyWith<$Res>? get lastModified {
    if (_self.lastModified == null) {
    return null;
  }

  return $CreatedCopyWith<$Res>(_self.lastModified!, (value) {
    return _then(_self.copyWith(lastModified: value));
  });
}/// Create a copy of OLWork
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OLTypeCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $OLTypeCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}

// dart format on
