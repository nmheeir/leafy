// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epub_book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpubBookModel _$EpubBookModelFromJson(Map<String, dynamic> json) =>
    _EpubBookModel(
      fileName: json['fileName'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      language: json['language'] as String,
      coverImage: const Uint8ListConverter().fromJson(
        json['coverImage'] as List<int>?,
      ),
      chapters: (json['chapters'] as List<dynamic>)
          .map((e) => EpubChapterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => EpubImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EpubBookModelToJson(_EpubBookModel instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
      'title': instance.title,
      'author': instance.author,
      'language': instance.language,
      'coverImage': const Uint8ListConverter().toJson(instance.coverImage),
      'chapters': instance.chapters,
      'images': instance.images,
    };
