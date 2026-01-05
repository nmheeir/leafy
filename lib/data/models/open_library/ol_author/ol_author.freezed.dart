// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ol_author.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
OLAuthor _$OLAuthorFromJson(
  Map<String, dynamic> json
) {
    return _OlAuthor.fromJson(
      json
    );
}

/// @nodoc
mixin _$OLAuthor {

@JsonKey(name: "name") String? get name;@JsonKey(name: "links") List<OLLink>? get links;@JsonKey(name: "personal_name") String? get personalName;@JsonKey(name: "created") Created? get created;@JsonKey(name: "last_modified") Created? get lastModified;@JsonKey(name: "latest_revision") int? get latestRevision;@JsonKey(name: "key") String? get key;@JsonKey(name: "type") OLType? get type;@JsonKey(name: "id") int? get id;@JsonKey(name: "revision") int? get revision;
/// Create a copy of OLAuthor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OLAuthorCopyWith<OLAuthor> get copyWith => _$OLAuthorCopyWithImpl<OLAuthor>(this as OLAuthor, _$identity);

  /// Serializes this OLAuthor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OLAuthor&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.personalName, personalName) || other.personalName == personalName)&&(identical(other.created, created) || other.created == created)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.latestRevision, latestRevision) || other.latestRevision == latestRevision)&&(identical(other.key, key) || other.key == key)&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.revision, revision) || other.revision == revision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(links),personalName,created,lastModified,latestRevision,key,type,id,revision);

@override
String toString() {
  return 'OLAuthor(name: $name, links: $links, personalName: $personalName, created: $created, lastModified: $lastModified, latestRevision: $latestRevision, key: $key, type: $type, id: $id, revision: $revision)';
}


}

/// @nodoc
abstract mixin class $OLAuthorCopyWith<$Res>  {
  factory $OLAuthorCopyWith(OLAuthor value, $Res Function(OLAuthor) _then) = _$OLAuthorCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "name") String? name,@JsonKey(name: "links") List<OLLink>? links,@JsonKey(name: "personal_name") String? personalName,@JsonKey(name: "created") Created? created,@JsonKey(name: "last_modified") Created? lastModified,@JsonKey(name: "latest_revision") int? latestRevision,@JsonKey(name: "key") String? key,@JsonKey(name: "type") OLType? type,@JsonKey(name: "id") int? id,@JsonKey(name: "revision") int? revision
});


$CreatedCopyWith<$Res>? get created;$CreatedCopyWith<$Res>? get lastModified;$OLTypeCopyWith<$Res>? get type;

}
/// @nodoc
class _$OLAuthorCopyWithImpl<$Res>
    implements $OLAuthorCopyWith<$Res> {
  _$OLAuthorCopyWithImpl(this._self, this._then);

  final OLAuthor _self;
  final $Res Function(OLAuthor) _then;

/// Create a copy of OLAuthor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? links = freezed,Object? personalName = freezed,Object? created = freezed,Object? lastModified = freezed,Object? latestRevision = freezed,Object? key = freezed,Object? type = freezed,Object? id = freezed,Object? revision = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,links: freezed == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<OLLink>?,personalName: freezed == personalName ? _self.personalName : personalName // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as Created?,lastModified: freezed == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as Created?,latestRevision: freezed == latestRevision ? _self.latestRevision : latestRevision // ignore: cast_nullable_to_non_nullable
as int?,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OLType?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,revision: freezed == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of OLAuthor
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
}/// Create a copy of OLAuthor
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
}/// Create a copy of OLAuthor
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


/// Adds pattern-matching-related methods to [OLAuthor].
extension OLAuthorPatterns on OLAuthor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OlAuthor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OlAuthor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OlAuthor value)  $default,){
final _that = this;
switch (_that) {
case _OlAuthor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OlAuthor value)?  $default,){
final _that = this;
switch (_that) {
case _OlAuthor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "name")  String? name, @JsonKey(name: "links")  List<OLLink>? links, @JsonKey(name: "personal_name")  String? personalName, @JsonKey(name: "created")  Created? created, @JsonKey(name: "last_modified")  Created? lastModified, @JsonKey(name: "latest_revision")  int? latestRevision, @JsonKey(name: "key")  String? key, @JsonKey(name: "type")  OLType? type, @JsonKey(name: "id")  int? id, @JsonKey(name: "revision")  int? revision)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OlAuthor() when $default != null:
return $default(_that.name,_that.links,_that.personalName,_that.created,_that.lastModified,_that.latestRevision,_that.key,_that.type,_that.id,_that.revision);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "name")  String? name, @JsonKey(name: "links")  List<OLLink>? links, @JsonKey(name: "personal_name")  String? personalName, @JsonKey(name: "created")  Created? created, @JsonKey(name: "last_modified")  Created? lastModified, @JsonKey(name: "latest_revision")  int? latestRevision, @JsonKey(name: "key")  String? key, @JsonKey(name: "type")  OLType? type, @JsonKey(name: "id")  int? id, @JsonKey(name: "revision")  int? revision)  $default,) {final _that = this;
switch (_that) {
case _OlAuthor():
return $default(_that.name,_that.links,_that.personalName,_that.created,_that.lastModified,_that.latestRevision,_that.key,_that.type,_that.id,_that.revision);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "name")  String? name, @JsonKey(name: "links")  List<OLLink>? links, @JsonKey(name: "personal_name")  String? personalName, @JsonKey(name: "created")  Created? created, @JsonKey(name: "last_modified")  Created? lastModified, @JsonKey(name: "latest_revision")  int? latestRevision, @JsonKey(name: "key")  String? key, @JsonKey(name: "type")  OLType? type, @JsonKey(name: "id")  int? id, @JsonKey(name: "revision")  int? revision)?  $default,) {final _that = this;
switch (_that) {
case _OlAuthor() when $default != null:
return $default(_that.name,_that.links,_that.personalName,_that.created,_that.lastModified,_that.latestRevision,_that.key,_that.type,_that.id,_that.revision);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OlAuthor implements OLAuthor {
  const _OlAuthor({@JsonKey(name: "name") this.name, @JsonKey(name: "links") final  List<OLLink>? links, @JsonKey(name: "personal_name") this.personalName, @JsonKey(name: "created") this.created, @JsonKey(name: "last_modified") this.lastModified, @JsonKey(name: "latest_revision") this.latestRevision, @JsonKey(name: "key") this.key, @JsonKey(name: "type") this.type, @JsonKey(name: "id") this.id, @JsonKey(name: "revision") this.revision}): _links = links;
  factory _OlAuthor.fromJson(Map<String, dynamic> json) => _$OlAuthorFromJson(json);

@override@JsonKey(name: "name") final  String? name;
 final  List<OLLink>? _links;
@override@JsonKey(name: "links") List<OLLink>? get links {
  final value = _links;
  if (value == null) return null;
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "personal_name") final  String? personalName;
@override@JsonKey(name: "created") final  Created? created;
@override@JsonKey(name: "last_modified") final  Created? lastModified;
@override@JsonKey(name: "latest_revision") final  int? latestRevision;
@override@JsonKey(name: "key") final  String? key;
@override@JsonKey(name: "type") final  OLType? type;
@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "revision") final  int? revision;

/// Create a copy of OLAuthor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OlAuthorCopyWith<_OlAuthor> get copyWith => __$OlAuthorCopyWithImpl<_OlAuthor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OlAuthorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OlAuthor&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._links, _links)&&(identical(other.personalName, personalName) || other.personalName == personalName)&&(identical(other.created, created) || other.created == created)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.latestRevision, latestRevision) || other.latestRevision == latestRevision)&&(identical(other.key, key) || other.key == key)&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.revision, revision) || other.revision == revision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_links),personalName,created,lastModified,latestRevision,key,type,id,revision);

@override
String toString() {
  return 'OLAuthor(name: $name, links: $links, personalName: $personalName, created: $created, lastModified: $lastModified, latestRevision: $latestRevision, key: $key, type: $type, id: $id, revision: $revision)';
}


}

/// @nodoc
abstract mixin class _$OlAuthorCopyWith<$Res> implements $OLAuthorCopyWith<$Res> {
  factory _$OlAuthorCopyWith(_OlAuthor value, $Res Function(_OlAuthor) _then) = __$OlAuthorCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "name") String? name,@JsonKey(name: "links") List<OLLink>? links,@JsonKey(name: "personal_name") String? personalName,@JsonKey(name: "created") Created? created,@JsonKey(name: "last_modified") Created? lastModified,@JsonKey(name: "latest_revision") int? latestRevision,@JsonKey(name: "key") String? key,@JsonKey(name: "type") OLType? type,@JsonKey(name: "id") int? id,@JsonKey(name: "revision") int? revision
});


@override $CreatedCopyWith<$Res>? get created;@override $CreatedCopyWith<$Res>? get lastModified;@override $OLTypeCopyWith<$Res>? get type;

}
/// @nodoc
class __$OlAuthorCopyWithImpl<$Res>
    implements _$OlAuthorCopyWith<$Res> {
  __$OlAuthorCopyWithImpl(this._self, this._then);

  final _OlAuthor _self;
  final $Res Function(_OlAuthor) _then;

/// Create a copy of OLAuthor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? links = freezed,Object? personalName = freezed,Object? created = freezed,Object? lastModified = freezed,Object? latestRevision = freezed,Object? key = freezed,Object? type = freezed,Object? id = freezed,Object? revision = freezed,}) {
  return _then(_OlAuthor(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,links: freezed == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<OLLink>?,personalName: freezed == personalName ? _self.personalName : personalName // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as Created?,lastModified: freezed == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as Created?,latestRevision: freezed == latestRevision ? _self.latestRevision : latestRevision // ignore: cast_nullable_to_non_nullable
as int?,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OLType?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,revision: freezed == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of OLAuthor
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
}/// Create a copy of OLAuthor
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
}/// Create a copy of OLAuthor
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
