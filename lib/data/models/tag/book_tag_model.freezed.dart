// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_tag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookTagModel {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'book_id') int get bookId;@JsonKey(name: 'tag_id') int get tagId;@JsonKey(name: 'order_index') int get orderIndex;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of BookTagModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookTagModelCopyWith<BookTagModel> get copyWith => _$BookTagModelCopyWithImpl<BookTagModel>(this as BookTagModel, _$identity);

  /// Serializes this BookTagModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookTagModel&&(identical(other.id, id) || other.id == id)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bookId,tagId,orderIndex,createdAt);

@override
String toString() {
  return 'BookTagModel(id: $id, bookId: $bookId, tagId: $tagId, orderIndex: $orderIndex, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BookTagModelCopyWith<$Res>  {
  factory $BookTagModelCopyWith(BookTagModel value, $Res Function(BookTagModel) _then) = _$BookTagModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'book_id') int bookId,@JsonKey(name: 'tag_id') int tagId,@JsonKey(name: 'order_index') int orderIndex,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$BookTagModelCopyWithImpl<$Res>
    implements $BookTagModelCopyWith<$Res> {
  _$BookTagModelCopyWithImpl(this._self, this._then);

  final BookTagModel _self;
  final $Res Function(BookTagModel) _then;

/// Create a copy of BookTagModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? bookId = null,Object? tagId = null,Object? orderIndex = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as int,tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as int,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BookTagModel].
extension BookTagModelPatterns on BookTagModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookTagModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookTagModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookTagModel value)  $default,){
final _that = this;
switch (_that) {
case _BookTagModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookTagModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookTagModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'book_id')  int bookId, @JsonKey(name: 'tag_id')  int tagId, @JsonKey(name: 'order_index')  int orderIndex, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookTagModel() when $default != null:
return $default(_that.id,_that.bookId,_that.tagId,_that.orderIndex,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'book_id')  int bookId, @JsonKey(name: 'tag_id')  int tagId, @JsonKey(name: 'order_index')  int orderIndex, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _BookTagModel():
return $default(_that.id,_that.bookId,_that.tagId,_that.orderIndex,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'book_id')  int bookId, @JsonKey(name: 'tag_id')  int tagId, @JsonKey(name: 'order_index')  int orderIndex, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BookTagModel() when $default != null:
return $default(_that.id,_that.bookId,_that.tagId,_that.orderIndex,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookTagModel extends BookTagModel {
  const _BookTagModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'book_id') required this.bookId, @JsonKey(name: 'tag_id') required this.tagId, @JsonKey(name: 'order_index') this.orderIndex = 0, @JsonKey(name: 'created_at') required this.createdAt}): super._();
  factory _BookTagModel.fromJson(Map<String, dynamic> json) => _$BookTagModelFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'book_id') final  int bookId;
@override@JsonKey(name: 'tag_id') final  int tagId;
@override@JsonKey(name: 'order_index') final  int orderIndex;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of BookTagModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookTagModelCopyWith<_BookTagModel> get copyWith => __$BookTagModelCopyWithImpl<_BookTagModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookTagModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookTagModel&&(identical(other.id, id) || other.id == id)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bookId,tagId,orderIndex,createdAt);

@override
String toString() {
  return 'BookTagModel(id: $id, bookId: $bookId, tagId: $tagId, orderIndex: $orderIndex, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BookTagModelCopyWith<$Res> implements $BookTagModelCopyWith<$Res> {
  factory _$BookTagModelCopyWith(_BookTagModel value, $Res Function(_BookTagModel) _then) = __$BookTagModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'book_id') int bookId,@JsonKey(name: 'tag_id') int tagId,@JsonKey(name: 'order_index') int orderIndex,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$BookTagModelCopyWithImpl<$Res>
    implements _$BookTagModelCopyWith<$Res> {
  __$BookTagModelCopyWithImpl(this._self, this._then);

  final _BookTagModel _self;
  final $Res Function(_BookTagModel) _then;

/// Create a copy of BookTagModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? bookId = null,Object? tagId = null,Object? orderIndex = null,Object? createdAt = null,}) {
  return _then(_BookTagModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as int,tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as int,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
