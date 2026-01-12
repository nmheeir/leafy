import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/core/utils/converters/uint8list_converter.dart';
import 'package:leafy/data/models/epub_reader/epub_chapter/epub_chapter_model.dart';
import 'package:leafy/data/models/epub_reader/epub_image/epub_image_model.dart';
import 'package:leafy/domain/epub_reader/entities/epub_book.dart';

part 'epub_book_model.freezed.dart';
part 'epub_book_model.g.dart';

@freezed
abstract class EpubBookModel with _$EpubBookModel {
  const factory EpubBookModel({
    required String fileName,
    required String title,
    required String author,
    required String language,
    @Uint8ListConverter() Uint8List? coverImage,
    @JsonKey(name: 'chapters') required List<EpubChapterModel> chapters,
    @Default([]) List<EpubImageModel> images,
  }) = _EpubBookModel;

  factory EpubBookModel.fromJson(Map<String, dynamic> json) =>
      _$EpubBookModelFromJson(json);

  const EpubBookModel._();

  EpubBook toEntity() {
    return EpubBook(
      fileName: fileName,
      title: title,
      author: author,
      language: language,
      coverImage: coverImage,
      chapters: chapters.map((e) => e.toEntity()).toList(),
      images: images.map((e) => e.toEntity()).toList(),
    );
  }
}
