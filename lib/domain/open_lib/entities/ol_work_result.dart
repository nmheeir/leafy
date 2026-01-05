class OLWorkResult {
  final String? key;
  final String? title;
  final String? description;
  final String? firstPublishYear;
  final List<String> authors;
  final List<String> subjects;
  final List<int> coverIds;

  const OLWorkResult({
    required this.key,
    required this.title,
    this.description,
    this.firstPublishYear,
    this.authors = const [],
    this.subjects = const [],
    this.coverIds = const [],
  });
}
