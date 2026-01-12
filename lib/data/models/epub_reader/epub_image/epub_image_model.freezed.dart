// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epub_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EpubImageModel {

 String get absPath;@Uint8ListConverter() Uint8List? get image;
/// Create a copy of EpubImageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpubImageModelCopyWith<EpubImageModel> get copyWith => _$EpubImageModelCopyWithImpl<EpubImageModel>(this as EpubImageModel, _$identity);

  /// Serializes this EpubImageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpubImageModel&&(identical(other.absPath, absPath) || other.absPath == absPath)&&const DeepCollectionEquality().equals(other.image, image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,absPath,const DeepCollectionEquality().hash(image));

@override
String toString() {
  return 'EpubImageModel(absPath: $absPath, image: $image)';
}


}

/// @nodoc
abstract mixin class $EpubImageModelCopyWith<$Res>  {
  factory $EpubImageModelCopyWith(EpubImageModel value, $Res Function(EpubImageModel) _then) = _$EpubImageModelCopyWithImpl;
@useResult
$Res call({
 String absPath,@Uint8ListConverter() Uint8List? image
});




}
/// @nodoc
class _$EpubImageModelCopyWithImpl<$Res>
    implements $EpubImageModelCopyWith<$Res> {
  _$EpubImageModelCopyWithImpl(this._self, this._then);

  final EpubImageModel _self;
  final $Res Function(EpubImageModel) _then;

/// Create a copy of EpubImageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? absPath = null,Object? image = freezed,}) {
  return _then(_self.copyWith(
absPath: null == absPath ? _self.absPath : absPath // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}

}


/// Adds pattern-matching-related methods to [EpubImageModel].
extension EpubImageModelPatterns on EpubImageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpubImageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpubImageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpubImageModel value)  $default,){
final _that = this;
switch (_that) {
case _EpubImageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpubImageModel value)?  $default,){
final _that = this;
switch (_that) {
case _EpubImageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String absPath, @Uint8ListConverter()  Uint8List? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpubImageModel() when $default != null:
return $default(_that.absPath,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String absPath, @Uint8ListConverter()  Uint8List? image)  $default,) {final _that = this;
switch (_that) {
case _EpubImageModel():
return $default(_that.absPath,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String absPath, @Uint8ListConverter()  Uint8List? image)?  $default,) {final _that = this;
switch (_that) {
case _EpubImageModel() when $default != null:
return $default(_that.absPath,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EpubImageModel extends EpubImageModel {
   _EpubImageModel({required this.absPath, @Uint8ListConverter() this.image}): super._();
  factory _EpubImageModel.fromJson(Map<String, dynamic> json) => _$EpubImageModelFromJson(json);

@override final  String absPath;
@override@Uint8ListConverter() final  Uint8List? image;

/// Create a copy of EpubImageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpubImageModelCopyWith<_EpubImageModel> get copyWith => __$EpubImageModelCopyWithImpl<_EpubImageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpubImageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpubImageModel&&(identical(other.absPath, absPath) || other.absPath == absPath)&&const DeepCollectionEquality().equals(other.image, image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,absPath,const DeepCollectionEquality().hash(image));

@override
String toString() {
  return 'EpubImageModel(absPath: $absPath, image: $image)';
}


}

/// @nodoc
abstract mixin class _$EpubImageModelCopyWith<$Res> implements $EpubImageModelCopyWith<$Res> {
  factory _$EpubImageModelCopyWith(_EpubImageModel value, $Res Function(_EpubImageModel) _then) = __$EpubImageModelCopyWithImpl;
@override @useResult
$Res call({
 String absPath,@Uint8ListConverter() Uint8List? image
});




}
/// @nodoc
class __$EpubImageModelCopyWithImpl<$Res>
    implements _$EpubImageModelCopyWith<$Res> {
  __$EpubImageModelCopyWithImpl(this._self, this._then);

  final _EpubImageModel _self;
  final $Res Function(_EpubImageModel) _then;

/// Create a copy of EpubImageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? absPath = null,Object? image = freezed,}) {
  return _then(_EpubImageModel(
absPath: null == absPath ? _self.absPath : absPath // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

// dart format on
