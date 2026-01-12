import 'package:equatable/equatable.dart';

class EpubMeta extends Equatable {
  final String title;
  final String id;
  final String url;
  final String lastReadCfi;
  final double progress;

  const EpubMeta({
    required this.id,
    required this.url,
    required this.title,
    required this.lastReadCfi,
    required this.progress,
  });

  @override
  List<Object?> get props => [id, title, url, lastReadCfi, progress];
}
