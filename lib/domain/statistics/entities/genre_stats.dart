import 'package:equatable/equatable.dart';

class GenreStats extends Equatable {
  final String genre;
  final int bookCount;
  final Duration duration;

  const GenreStats({
    required this.genre,
    required this.bookCount,
    required this.duration,
  });

  @override
  List<Object?> get props => [genre, bookCount, duration];
}
