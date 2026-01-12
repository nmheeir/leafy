import 'package:equatable/equatable.dart';

class UpdateBookResourceFileParams extends Equatable {
  final String resourceUuid;
  final String newPath;
  final String? newFileHash;
  final int? newFileSize;

  const UpdateBookResourceFileParams({
    required this.resourceUuid,
    required this.newPath,
    this.newFileHash,
    this.newFileSize,
  });

  @override
  List<Object?> get props => [resourceUuid, newPath, newFileHash, newFileSize];
}
