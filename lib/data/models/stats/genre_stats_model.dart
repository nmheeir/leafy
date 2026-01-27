class GenreStatsModel {
  final String format;
  final int bookCount;
  final int totalDuration;

  GenreStatsModel({
    required this.format,
    required this.bookCount,
    required this.totalDuration,
  });

  factory GenreStatsModel.fromJson(Map<String, dynamic> json) {
    return GenreStatsModel(
      format: json['format'] as String? ?? 'unknown',
      bookCount: json['book_count'] as int? ?? 0,
      totalDuration: json['total_duration'] as int? ?? 0,
    );
  }
}
