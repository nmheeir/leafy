import 'package:equatable/equatable.dart';

class ProcessedFile extends Equatable {
  final String originalPath;
  final String savedPath;
  final String hash;
  final int size;
  final String extension;
  final String originalName;

  const ProcessedFile({
    required this.originalPath,
    required this.savedPath,
    required this.hash,
    required this.size,
    required this.extension,
    required this.originalName,
  });

  @override
  List<Object?> get props => [
    originalPath,
    savedPath,
    hash,
    size,
    extension,
    originalName,
  ];
}
