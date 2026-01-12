import 'package:equatable/equatable.dart';

class SaveReaderProgressParams extends Equatable {
  final String resourceUuid;
  final String locator;
  final double progress;
  final DateTime lastReadAt;

  const SaveReaderProgressParams({
    required this.resourceUuid,
    required this.locator,
    required this.progress,
    required this.lastReadAt,
  });

  @override
  List<Object> get props => [resourceUuid, locator, progress, lastReadAt];
}
