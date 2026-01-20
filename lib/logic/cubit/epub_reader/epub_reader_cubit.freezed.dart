// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epub_reader_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EpubReaderCubitState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpubReaderCubitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EpubReaderCubitState()';
}


}

/// @nodoc
class $EpubReaderCubitStateCopyWith<$Res>  {
$EpubReaderCubitStateCopyWith(EpubReaderCubitState _, $Res Function(EpubReaderCubitState) __);
}


/// Adds pattern-matching-related methods to [EpubReaderCubitState].
extension EpubReaderCubitStatePatterns on EpubReaderCubitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Error value)?  error,TResult Function( _Loaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Error value)  error,required TResult Function( _Loaded value)  loaded,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Error():
return error(_that);case _Loaded():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Error value)?  error,TResult? Function( _Loaded value)?  loaded,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( double progress)?  loading,TResult Function( String message)?  error,TResult Function( EpubBook book,  List<EpubDisplayItem> displayItems,  int currentChapterIndex,  int currentItemIndex,  String? fileHash,  Map<int, Map<String, String>> translationMaps,  Map<int, TranslationStatus> translationStatuses,  bool isBilingual)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading(_that.progress);case _Error() when error != null:
return error(_that.message);case _Loaded() when loaded != null:
return loaded(_that.book,_that.displayItems,_that.currentChapterIndex,_that.currentItemIndex,_that.fileHash,_that.translationMaps,_that.translationStatuses,_that.isBilingual);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( double progress)  loading,required TResult Function( String message)  error,required TResult Function( EpubBook book,  List<EpubDisplayItem> displayItems,  int currentChapterIndex,  int currentItemIndex,  String? fileHash,  Map<int, Map<String, String>> translationMaps,  Map<int, TranslationStatus> translationStatuses,  bool isBilingual)  loaded,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading(_that.progress);case _Error():
return error(_that.message);case _Loaded():
return loaded(_that.book,_that.displayItems,_that.currentChapterIndex,_that.currentItemIndex,_that.fileHash,_that.translationMaps,_that.translationStatuses,_that.isBilingual);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( double progress)?  loading,TResult? Function( String message)?  error,TResult? Function( EpubBook book,  List<EpubDisplayItem> displayItems,  int currentChapterIndex,  int currentItemIndex,  String? fileHash,  Map<int, Map<String, String>> translationMaps,  Map<int, TranslationStatus> translationStatuses,  bool isBilingual)?  loaded,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading(_that.progress);case _Error() when error != null:
return error(_that.message);case _Loaded() when loaded != null:
return loaded(_that.book,_that.displayItems,_that.currentChapterIndex,_that.currentItemIndex,_that.fileHash,_that.translationMaps,_that.translationStatuses,_that.isBilingual);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements EpubReaderCubitState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EpubReaderCubitState.initial()';
}


}




/// @nodoc


class _Loading implements EpubReaderCubitState {
  const _Loading({required this.progress});
  

 final  double progress;

/// Create a copy of EpubReaderCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<_Loading> get copyWith => __$LoadingCopyWithImpl<_Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,progress);

@override
String toString() {
  return 'EpubReaderCubitState.loading(progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $EpubReaderCubitStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@useResult
$Res call({
 double progress
});




}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of EpubReaderCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progress = null,}) {
  return _then(_Loading(
progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Error implements EpubReaderCubitState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of EpubReaderCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'EpubReaderCubitState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $EpubReaderCubitStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of EpubReaderCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Loaded implements EpubReaderCubitState {
  const _Loaded({required this.book, required final  List<EpubDisplayItem> displayItems, required this.currentChapterIndex, this.currentItemIndex = 0, this.fileHash, final  Map<int, Map<String, String>> translationMaps = const {}, final  Map<int, TranslationStatus> translationStatuses = const {}, this.isBilingual = false}): _displayItems = displayItems,_translationMaps = translationMaps,_translationStatuses = translationStatuses;
  

 final  EpubBook book;
 final  List<EpubDisplayItem> _displayItems;
 List<EpubDisplayItem> get displayItems {
  if (_displayItems is EqualUnmodifiableListView) return _displayItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_displayItems);
}

 final  int currentChapterIndex;
@JsonKey() final  int currentItemIndex;
 final  String? fileHash;
 final  Map<int, Map<String, String>> _translationMaps;
@JsonKey() Map<int, Map<String, String>> get translationMaps {
  if (_translationMaps is EqualUnmodifiableMapView) return _translationMaps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_translationMaps);
}

 final  Map<int, TranslationStatus> _translationStatuses;
@JsonKey() Map<int, TranslationStatus> get translationStatuses {
  if (_translationStatuses is EqualUnmodifiableMapView) return _translationStatuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_translationStatuses);
}

@JsonKey() final  bool isBilingual;

/// Create a copy of EpubReaderCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.book, book) || other.book == book)&&const DeepCollectionEquality().equals(other._displayItems, _displayItems)&&(identical(other.currentChapterIndex, currentChapterIndex) || other.currentChapterIndex == currentChapterIndex)&&(identical(other.currentItemIndex, currentItemIndex) || other.currentItemIndex == currentItemIndex)&&(identical(other.fileHash, fileHash) || other.fileHash == fileHash)&&const DeepCollectionEquality().equals(other._translationMaps, _translationMaps)&&const DeepCollectionEquality().equals(other._translationStatuses, _translationStatuses)&&(identical(other.isBilingual, isBilingual) || other.isBilingual == isBilingual));
}


@override
int get hashCode => Object.hash(runtimeType,book,const DeepCollectionEquality().hash(_displayItems),currentChapterIndex,currentItemIndex,fileHash,const DeepCollectionEquality().hash(_translationMaps),const DeepCollectionEquality().hash(_translationStatuses),isBilingual);

@override
String toString() {
  return 'EpubReaderCubitState.loaded(book: $book, displayItems: $displayItems, currentChapterIndex: $currentChapterIndex, currentItemIndex: $currentItemIndex, fileHash: $fileHash, translationMaps: $translationMaps, translationStatuses: $translationStatuses, isBilingual: $isBilingual)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $EpubReaderCubitStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 EpubBook book, List<EpubDisplayItem> displayItems, int currentChapterIndex, int currentItemIndex, String? fileHash, Map<int, Map<String, String>> translationMaps, Map<int, TranslationStatus> translationStatuses, bool isBilingual
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of EpubReaderCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,Object? displayItems = null,Object? currentChapterIndex = null,Object? currentItemIndex = null,Object? fileHash = freezed,Object? translationMaps = null,Object? translationStatuses = null,Object? isBilingual = null,}) {
  return _then(_Loaded(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as EpubBook,displayItems: null == displayItems ? _self._displayItems : displayItems // ignore: cast_nullable_to_non_nullable
as List<EpubDisplayItem>,currentChapterIndex: null == currentChapterIndex ? _self.currentChapterIndex : currentChapterIndex // ignore: cast_nullable_to_non_nullable
as int,currentItemIndex: null == currentItemIndex ? _self.currentItemIndex : currentItemIndex // ignore: cast_nullable_to_non_nullable
as int,fileHash: freezed == fileHash ? _self.fileHash : fileHash // ignore: cast_nullable_to_non_nullable
as String?,translationMaps: null == translationMaps ? _self._translationMaps : translationMaps // ignore: cast_nullable_to_non_nullable
as Map<int, Map<String, String>>,translationStatuses: null == translationStatuses ? _self._translationStatuses : translationStatuses // ignore: cast_nullable_to_non_nullable
as Map<int, TranslationStatus>,isBilingual: null == isBilingual ? _self.isBilingual : isBilingual // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
