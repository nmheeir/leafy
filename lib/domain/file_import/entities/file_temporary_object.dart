import 'package:equatable/equatable.dart';

class FileTemporaryObject extends Equatable {
  final String path;
  final String name;
  final int size;
  final String extension;

  const FileTemporaryObject({
    required this.path,
    required this.name,
    required this.size,
    required this.extension,
  });

  @override
  List<Object?> get props => [path, name, size, extension];
}
