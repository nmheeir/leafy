// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gtd_format_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GtdFormatModel {

@JsonKey(name: 'text/html') String? get textHtml;@JsonKey(name: 'application/epub+zip') String? get applicationEpubZip;@JsonKey(name: 'application/x-mobipocket-ebook') String? get applicationXMobipocketEbook;@JsonKey(name: 'text/plain; charset=us-ascii') String? get textPlainCharsetUsAscii;@JsonKey(name: 'application/rdf+xml') String? get applicationRdfXml;@JsonKey(name: 'image/jpeg') String? get imageJpeg;@JsonKey(name: 'application/octet-stream') String? get applicationOctetStream;
/// Create a copy of GtdFormatModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GtdFormatModelCopyWith<GtdFormatModel> get copyWith => _$GtdFormatModelCopyWithImpl<GtdFormatModel>(this as GtdFormatModel, _$identity);

  /// Serializes this GtdFormatModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GtdFormatModel&&(identical(other.textHtml, textHtml) || other.textHtml == textHtml)&&(identical(other.applicationEpubZip, applicationEpubZip) || other.applicationEpubZip == applicationEpubZip)&&(identical(other.applicationXMobipocketEbook, applicationXMobipocketEbook) || other.applicationXMobipocketEbook == applicationXMobipocketEbook)&&(identical(other.textPlainCharsetUsAscii, textPlainCharsetUsAscii) || other.textPlainCharsetUsAscii == textPlainCharsetUsAscii)&&(identical(other.applicationRdfXml, applicationRdfXml) || other.applicationRdfXml == applicationRdfXml)&&(identical(other.imageJpeg, imageJpeg) || other.imageJpeg == imageJpeg)&&(identical(other.applicationOctetStream, applicationOctetStream) || other.applicationOctetStream == applicationOctetStream));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,textHtml,applicationEpubZip,applicationXMobipocketEbook,textPlainCharsetUsAscii,applicationRdfXml,imageJpeg,applicationOctetStream);

@override
String toString() {
  return 'GtdFormatModel(textHtml: $textHtml, applicationEpubZip: $applicationEpubZip, applicationXMobipocketEbook: $applicationXMobipocketEbook, textPlainCharsetUsAscii: $textPlainCharsetUsAscii, applicationRdfXml: $applicationRdfXml, imageJpeg: $imageJpeg, applicationOctetStream: $applicationOctetStream)';
}


}

/// @nodoc
abstract mixin class $GtdFormatModelCopyWith<$Res>  {
  factory $GtdFormatModelCopyWith(GtdFormatModel value, $Res Function(GtdFormatModel) _then) = _$GtdFormatModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'text/html') String? textHtml,@JsonKey(name: 'application/epub+zip') String? applicationEpubZip,@JsonKey(name: 'application/x-mobipocket-ebook') String? applicationXMobipocketEbook,@JsonKey(name: 'text/plain; charset=us-ascii') String? textPlainCharsetUsAscii,@JsonKey(name: 'application/rdf+xml') String? applicationRdfXml,@JsonKey(name: 'image/jpeg') String? imageJpeg,@JsonKey(name: 'application/octet-stream') String? applicationOctetStream
});




}
/// @nodoc
class _$GtdFormatModelCopyWithImpl<$Res>
    implements $GtdFormatModelCopyWith<$Res> {
  _$GtdFormatModelCopyWithImpl(this._self, this._then);

  final GtdFormatModel _self;
  final $Res Function(GtdFormatModel) _then;

/// Create a copy of GtdFormatModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? textHtml = freezed,Object? applicationEpubZip = freezed,Object? applicationXMobipocketEbook = freezed,Object? textPlainCharsetUsAscii = freezed,Object? applicationRdfXml = freezed,Object? imageJpeg = freezed,Object? applicationOctetStream = freezed,}) {
  return _then(_self.copyWith(
textHtml: freezed == textHtml ? _self.textHtml : textHtml // ignore: cast_nullable_to_non_nullable
as String?,applicationEpubZip: freezed == applicationEpubZip ? _self.applicationEpubZip : applicationEpubZip // ignore: cast_nullable_to_non_nullable
as String?,applicationXMobipocketEbook: freezed == applicationXMobipocketEbook ? _self.applicationXMobipocketEbook : applicationXMobipocketEbook // ignore: cast_nullable_to_non_nullable
as String?,textPlainCharsetUsAscii: freezed == textPlainCharsetUsAscii ? _self.textPlainCharsetUsAscii : textPlainCharsetUsAscii // ignore: cast_nullable_to_non_nullable
as String?,applicationRdfXml: freezed == applicationRdfXml ? _self.applicationRdfXml : applicationRdfXml // ignore: cast_nullable_to_non_nullable
as String?,imageJpeg: freezed == imageJpeg ? _self.imageJpeg : imageJpeg // ignore: cast_nullable_to_non_nullable
as String?,applicationOctetStream: freezed == applicationOctetStream ? _self.applicationOctetStream : applicationOctetStream // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GtdFormatModel].
extension GtdFormatModelPatterns on GtdFormatModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GtdFormatModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GtdFormatModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GtdFormatModel value)  $default,){
final _that = this;
switch (_that) {
case _GtdFormatModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GtdFormatModel value)?  $default,){
final _that = this;
switch (_that) {
case _GtdFormatModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'text/html')  String? textHtml, @JsonKey(name: 'application/epub+zip')  String? applicationEpubZip, @JsonKey(name: 'application/x-mobipocket-ebook')  String? applicationXMobipocketEbook, @JsonKey(name: 'text/plain; charset=us-ascii')  String? textPlainCharsetUsAscii, @JsonKey(name: 'application/rdf+xml')  String? applicationRdfXml, @JsonKey(name: 'image/jpeg')  String? imageJpeg, @JsonKey(name: 'application/octet-stream')  String? applicationOctetStream)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GtdFormatModel() when $default != null:
return $default(_that.textHtml,_that.applicationEpubZip,_that.applicationXMobipocketEbook,_that.textPlainCharsetUsAscii,_that.applicationRdfXml,_that.imageJpeg,_that.applicationOctetStream);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'text/html')  String? textHtml, @JsonKey(name: 'application/epub+zip')  String? applicationEpubZip, @JsonKey(name: 'application/x-mobipocket-ebook')  String? applicationXMobipocketEbook, @JsonKey(name: 'text/plain; charset=us-ascii')  String? textPlainCharsetUsAscii, @JsonKey(name: 'application/rdf+xml')  String? applicationRdfXml, @JsonKey(name: 'image/jpeg')  String? imageJpeg, @JsonKey(name: 'application/octet-stream')  String? applicationOctetStream)  $default,) {final _that = this;
switch (_that) {
case _GtdFormatModel():
return $default(_that.textHtml,_that.applicationEpubZip,_that.applicationXMobipocketEbook,_that.textPlainCharsetUsAscii,_that.applicationRdfXml,_that.imageJpeg,_that.applicationOctetStream);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'text/html')  String? textHtml, @JsonKey(name: 'application/epub+zip')  String? applicationEpubZip, @JsonKey(name: 'application/x-mobipocket-ebook')  String? applicationXMobipocketEbook, @JsonKey(name: 'text/plain; charset=us-ascii')  String? textPlainCharsetUsAscii, @JsonKey(name: 'application/rdf+xml')  String? applicationRdfXml, @JsonKey(name: 'image/jpeg')  String? imageJpeg, @JsonKey(name: 'application/octet-stream')  String? applicationOctetStream)?  $default,) {final _that = this;
switch (_that) {
case _GtdFormatModel() when $default != null:
return $default(_that.textHtml,_that.applicationEpubZip,_that.applicationXMobipocketEbook,_that.textPlainCharsetUsAscii,_that.applicationRdfXml,_that.imageJpeg,_that.applicationOctetStream);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GtdFormatModel extends GtdFormatModel {
   _GtdFormatModel({@JsonKey(name: 'text/html') required this.textHtml, @JsonKey(name: 'application/epub+zip') required this.applicationEpubZip, @JsonKey(name: 'application/x-mobipocket-ebook') required this.applicationXMobipocketEbook, @JsonKey(name: 'text/plain; charset=us-ascii') required this.textPlainCharsetUsAscii, @JsonKey(name: 'application/rdf+xml') required this.applicationRdfXml, @JsonKey(name: 'image/jpeg') required this.imageJpeg, @JsonKey(name: 'application/octet-stream') required this.applicationOctetStream}): super._();
  factory _GtdFormatModel.fromJson(Map<String, dynamic> json) => _$GtdFormatModelFromJson(json);

@override@JsonKey(name: 'text/html') final  String? textHtml;
@override@JsonKey(name: 'application/epub+zip') final  String? applicationEpubZip;
@override@JsonKey(name: 'application/x-mobipocket-ebook') final  String? applicationXMobipocketEbook;
@override@JsonKey(name: 'text/plain; charset=us-ascii') final  String? textPlainCharsetUsAscii;
@override@JsonKey(name: 'application/rdf+xml') final  String? applicationRdfXml;
@override@JsonKey(name: 'image/jpeg') final  String? imageJpeg;
@override@JsonKey(name: 'application/octet-stream') final  String? applicationOctetStream;

/// Create a copy of GtdFormatModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GtdFormatModelCopyWith<_GtdFormatModel> get copyWith => __$GtdFormatModelCopyWithImpl<_GtdFormatModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GtdFormatModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GtdFormatModel&&(identical(other.textHtml, textHtml) || other.textHtml == textHtml)&&(identical(other.applicationEpubZip, applicationEpubZip) || other.applicationEpubZip == applicationEpubZip)&&(identical(other.applicationXMobipocketEbook, applicationXMobipocketEbook) || other.applicationXMobipocketEbook == applicationXMobipocketEbook)&&(identical(other.textPlainCharsetUsAscii, textPlainCharsetUsAscii) || other.textPlainCharsetUsAscii == textPlainCharsetUsAscii)&&(identical(other.applicationRdfXml, applicationRdfXml) || other.applicationRdfXml == applicationRdfXml)&&(identical(other.imageJpeg, imageJpeg) || other.imageJpeg == imageJpeg)&&(identical(other.applicationOctetStream, applicationOctetStream) || other.applicationOctetStream == applicationOctetStream));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,textHtml,applicationEpubZip,applicationXMobipocketEbook,textPlainCharsetUsAscii,applicationRdfXml,imageJpeg,applicationOctetStream);

@override
String toString() {
  return 'GtdFormatModel(textHtml: $textHtml, applicationEpubZip: $applicationEpubZip, applicationXMobipocketEbook: $applicationXMobipocketEbook, textPlainCharsetUsAscii: $textPlainCharsetUsAscii, applicationRdfXml: $applicationRdfXml, imageJpeg: $imageJpeg, applicationOctetStream: $applicationOctetStream)';
}


}

/// @nodoc
abstract mixin class _$GtdFormatModelCopyWith<$Res> implements $GtdFormatModelCopyWith<$Res> {
  factory _$GtdFormatModelCopyWith(_GtdFormatModel value, $Res Function(_GtdFormatModel) _then) = __$GtdFormatModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'text/html') String? textHtml,@JsonKey(name: 'application/epub+zip') String? applicationEpubZip,@JsonKey(name: 'application/x-mobipocket-ebook') String? applicationXMobipocketEbook,@JsonKey(name: 'text/plain; charset=us-ascii') String? textPlainCharsetUsAscii,@JsonKey(name: 'application/rdf+xml') String? applicationRdfXml,@JsonKey(name: 'image/jpeg') String? imageJpeg,@JsonKey(name: 'application/octet-stream') String? applicationOctetStream
});




}
/// @nodoc
class __$GtdFormatModelCopyWithImpl<$Res>
    implements _$GtdFormatModelCopyWith<$Res> {
  __$GtdFormatModelCopyWithImpl(this._self, this._then);

  final _GtdFormatModel _self;
  final $Res Function(_GtdFormatModel) _then;

/// Create a copy of GtdFormatModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? textHtml = freezed,Object? applicationEpubZip = freezed,Object? applicationXMobipocketEbook = freezed,Object? textPlainCharsetUsAscii = freezed,Object? applicationRdfXml = freezed,Object? imageJpeg = freezed,Object? applicationOctetStream = freezed,}) {
  return _then(_GtdFormatModel(
textHtml: freezed == textHtml ? _self.textHtml : textHtml // ignore: cast_nullable_to_non_nullable
as String?,applicationEpubZip: freezed == applicationEpubZip ? _self.applicationEpubZip : applicationEpubZip // ignore: cast_nullable_to_non_nullable
as String?,applicationXMobipocketEbook: freezed == applicationXMobipocketEbook ? _self.applicationXMobipocketEbook : applicationXMobipocketEbook // ignore: cast_nullable_to_non_nullable
as String?,textPlainCharsetUsAscii: freezed == textPlainCharsetUsAscii ? _self.textPlainCharsetUsAscii : textPlainCharsetUsAscii // ignore: cast_nullable_to_non_nullable
as String?,applicationRdfXml: freezed == applicationRdfXml ? _self.applicationRdfXml : applicationRdfXml // ignore: cast_nullable_to_non_nullable
as String?,imageJpeg: freezed == imageJpeg ? _self.imageJpeg : imageJpeg // ignore: cast_nullable_to_non_nullable
as String?,applicationOctetStream: freezed == applicationOctetStream ? _self.applicationOctetStream : applicationOctetStream // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
