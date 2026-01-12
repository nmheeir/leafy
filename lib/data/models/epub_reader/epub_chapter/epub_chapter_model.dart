import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/domain/epub_reader/entities/epub_chapter.dart';

part 'epub_chapter_model.freezed.dart';
part 'epub_chapter_model.g.dart';

@freezed
abstract class EpubChapterModel with _$EpubChapterModel {
  const factory EpubChapterModel({
   @JsonKey(name: 'chapterId') required String id,
    required String title,
    required String body,
  }) = _EpubChapterModel;

  factory EpubChapterModel.fromJson(Map<String, dynamic> json) =>
      _$EpubChapterModelFromJson(json);

  const EpubChapterModel._();

  EpubChapter toEntity() {
    return EpubChapter(id: id, title: title, body: body);
  }
}
