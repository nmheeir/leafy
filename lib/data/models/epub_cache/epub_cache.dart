import 'package:freezed_annotation/freezed_annotation.dart';

part 'epub_cache.freezed.dart';
part 'epub_cache.g.dart';

@freezed
abstract class EpubCache with _$EpubCache {
  const factory EpubCache({
    required String id,
    required String url,
    required String title,
    required String lastReadCfi,
    required double progress,
  }) = _EpubCache;

  factory EpubCache.fromJson(Map<String, dynamic> json) =>
      _$EpubCacheFromJson(json);
}
