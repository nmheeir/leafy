import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:leafy/domain/epub_reader/entities/epub_chapter.dart';
import 'package:leafy/domain/epub_reader/entities/epub_image.dart';

class EpubBook extends Equatable {
  final String fileName;
  final String title;
  final String author;
  final String language;
  final Uint8List? coverImage;
  final List<EpubChapter> chapters;
  final List<EpubImage> images;

  const EpubBook({
    required this.fileName,
    required this.title,
    required this.author,
    required this.language,
    this.coverImage,
    required this.chapters,
    required this.images,
  });

  @override
  List<Object?> get props => [
    fileName,
    title,
    author,
    language,
    coverImage,
    chapters,
  ];
}
