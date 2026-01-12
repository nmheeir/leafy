import 'package:leafy/domain/gutendex/entities/gtd_format.dart';
import 'package:leafy/domain/gutendex/entities/gtd_person.dart';

class GtdBook {
  final int? id;
  final String? title;
  final List<GtdPerson> authors;
  final List<String> summaries;
  final List<GtdPerson> editors;
  final List<GtdPerson> translators;
  final List<String> subjects;
  final List<String> bookshelves;
  final List<String> languages;
  final bool? copyright;
  final String? mediaType;
  final GtdFormat? formats;
  final int? downloadCount;

  const GtdBook({
    this.id,
    this.title,
    required this.authors,
    required this.summaries,
    required this.editors,
    required this.translators,
    required this.subjects,
    required this.bookshelves,
    required this.languages,
    this.copyright,
    this.mediaType,
    this.formats,
    this.downloadCount,
  });
}
