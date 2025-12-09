import 'package:leafy/data/models/gutendex/gtd_format.dart';
import 'package:leafy/data/models/gutendex/gtd_person.dart';

class GtdBookResult {
  GtdBookResult({
    required this.id,
    required this.title,
    required this.authors,
    required this.summaries,
    required this.editors,
    required this.translators,
    required this.subjects,
    required this.bookshelves,
    required this.languages,
    required this.copyright,
    required this.mediaType,
    required this.formats,
    required this.downloadCount,
  });

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

  GtdBookResult copyWith({
    int? id,
    String? title,
    List<GtdPerson>? authors,
    List<String>? summaries,
    List<GtdPerson>? editors,
    List<GtdPerson>? translators,
    List<String>? subjects,
    List<String>? bookshelves,
    List<String>? languages,
    bool? copyright,
    String? mediaType,
    GtdFormat? formats,
    int? downloadCount,
  }) {
    return GtdBookResult(
      id: id ?? this.id,
      title: title ?? this.title,
      authors: authors ?? this.authors,
      summaries: summaries ?? this.summaries,
      editors: editors ?? this.editors,
      translators: translators ?? this.translators,
      subjects: subjects ?? this.subjects,
      bookshelves: bookshelves ?? this.bookshelves,
      languages: languages ?? this.languages,
      copyright: copyright ?? this.copyright,
      mediaType: mediaType ?? this.mediaType,
      formats: formats ?? this.formats,
      downloadCount: downloadCount ?? this.downloadCount,
    );
  }

  factory GtdBookResult.fromJson(Map<String, dynamic> json) {
    return GtdBookResult(
      id: json["id"],
      title: json["title"],
      authors: json["authors"] == null
          ? []
          : List<GtdPerson>.from(
              json["authors"]!.map((x) => GtdPerson.fromJson(x)),
            ),
      summaries: json["summaries"] == null
          ? []
          : List<String>.from(json["summaries"]!.map((x) => x)),
      editors: json["editors"] == null
          ? []
          : List<GtdPerson>.from(
              json["editors"]!.map((x) => GtdPerson.fromJson(x)),
            ),
      translators: json["translators"] == null
          ? []
          : List<GtdPerson>.from(
              json["translators"]!.map((x) => GtdPerson.fromJson(x)),
            ),
      subjects: json["subjects"] == null
          ? []
          : List<String>.from(json["subjects"]!.map((x) => x)),
      bookshelves: json["bookshelves"] == null
          ? []
          : List<String>.from(json["bookshelves"]!.map((x) => x)),
      languages: json["languages"] == null
          ? []
          : List<String>.from(json["languages"]!.map((x) => x)),
      copyright: json["copyright"],
      mediaType: json["media_type"],
      formats: json["formats"] == null
          ? null
          : GtdFormat.fromJson(json["formats"]),
      downloadCount: json["download_count"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "authors": authors.map((x) => x.toJson()).toList(),
    "summaries": summaries.map((x) => x).toList(),
    "editors": editors.map((x) => x).toList(),
    "translators": translators.map((x) => x).toList(),
    "subjects": subjects.map((x) => x).toList(),
    "bookshelves": bookshelves.map((x) => x).toList(),
    "languages": languages.map((x) => x).toList(),
    "copyright": copyright,
    "media_type": mediaType,
    "formats": formats?.toJson(),
    "download_count": downloadCount,
  };

  @override
  String toString() {
    return "$id, $title, $authors, $summaries, $editors, $translators, $subjects, $bookshelves, $languages, $copyright, $mediaType, $formats, $downloadCount, ";
  }
}

/*
{
	"id": 84,
	"title": "Frankenstein; Or, The Modern Prometheus",
	"authors": [
		{
			"name": "Shelley, Mary Wollstonecraft",
			"birth_year": 1797,
			"death_year": 1851
		}
	],
	"summaries": [
		"\"Frankenstein; Or, The Modern Prometheus\" by Mary Wollstonecraft Shelley is a novel written in the early 19th century. The story explores themes of ambition, the quest for knowledge, and the consequences of man's hubris through the experiences of Victor Frankenstein and the monstrous creation of his own making.   The opening of the book introduces Robert Walton, an ambitious explorer on a quest to discover new lands and knowledge in the icy regions of the Arctic. In his letters to his sister Margaret, he expresses both enthusiasm and the fear of isolation in his grand venture. As Walton's expedition progresses, he encounters a mysterious, emaciated stranger who has faced great suffering—furthering the intrigue of his narrative. This stranger ultimately reveals his tale of creation, loss, and the profound consequences of seeking knowledge that lies beyond human bounds. The narrative is set up in a manner that suggests a deep examination of the emotions and ethical dilemmas faced by those who dare to defy the natural order. (This is an automatically generated summary.)"
	],
	"editors": [],
	"translators": [],
	"subjects": [
		"Frankenstein's monster (Fictitious character) -- Fiction",
		"Frankenstein, Victor (Fictitious character) -- Fiction",
		"Gothic fiction",
		"Horror tales",
		"Monsters -- Fiction",
		"Science fiction",
		"Scientists -- Fiction"
	],
	"bookshelves": [
		"Category: British Literature",
		"Category: Classics of Literature",
		"Category: Novels",
		"Category: Science-Fiction & Fantasy",
		"Gothic Fiction",
		"Movie Books",
		"Precursors of Science Fiction",
		"Science Fiction by Women"
	],
	"languages": [
		"en"
	],
	"copyright": false,
	"media_type": "Text",
	"formats": {
		"text/html": "https://www.gutenberg.org/ebooks/84.html.images",
		"application/epub+zip": "https://www.gutenberg.org/ebooks/84.epub3.images",
		"application/x-mobipocket-ebook": "https://www.gutenberg.org/ebooks/84.kf8.images",
		"text/plain; charset=us-ascii": "https://www.gutenberg.org/ebooks/84.txt.utf-8",
		"application/rdf+xml": "https://www.gutenberg.org/ebooks/84.rdf",
		"image/jpeg": "https://www.gutenberg.org/cache/epub/84/pg84.cover.medium.jpg",
		"application/octet-stream": "https://www.gutenberg.org/cache/epub/84/pg84-h.zip"
	},
	"download_count": 303668
}*/
