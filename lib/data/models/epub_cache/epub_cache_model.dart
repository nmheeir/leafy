import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/domain/epub_cache/entities/epub_cache.dart';

part 'epub_cache_model.freezed.dart';
part 'epub_cache_model.g.dart';

@freezed
abstract class EpubCacheModel with _$EpubCacheModel {
  const factory EpubCacheModel({
    required String id,
    required String url,
    required String title,
    required String lastReadCfi,
    required double progress,
  }) = _EpubCacheModel;

  factory EpubCacheModel.fromJson(Map<String, dynamic> json) =>
      _$EpubCacheModelFromJson(json);

  const EpubCacheModel._();

  /// The function `toEntity` converts data into an `EpubCache` object.
  /// 
  /// Returns:
  ///   An instance of the `EpubCache` class is being returned with the specified properties `id`,
  /// `url`, `title`, `lastReadCfi`, and `progress` set to the values of the corresponding properties in
  /// the current object.
  EpubCache toEntity() {
    return EpubCache(
      id: id,
      url: url,
      title: title,
      lastReadCfi: lastReadCfi,
      progress: progress,
    );
  }

  /// The function `EpubCacheModel.fromEntity` creates an `EpubCacheModel` instance from an `EpubCache`
  /// entity by mapping the properties.
  ///
  /// Args:
  ///   entity (EpubCache): The `EpubCacheModel.fromEntity` factory method is used to create an
  /// `EpubCacheModel` object from an `EpubCache` entity. The parameters being used in this method are:
  ///
  /// Returns:
  ///   An instance of `EpubCacheModel` is being returned with the properties initialized using the values
  /// from the `EpubCache` entity passed as a parameter.
  factory EpubCacheModel.fromEntity(EpubCache entity) {
    return EpubCacheModel(
      id: entity.id,
      url: entity.url,
      title: entity.title,
      lastReadCfi: entity.lastReadCfi,
      progress: entity.progress,
    );
  }
}
