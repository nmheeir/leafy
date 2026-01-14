import 'package:equatable/equatable.dart';

class ReadingSession extends Equatable {
  final String id;
  final int resourceId;
  final DateTime startTime;
  final DateTime endTime;
  final int durationMs;
  final String? startLocator;
  final String? endLocator;
  final int? chapterIndex;

  const ReadingSession({
    required this.id,
    required this.resourceId,
    required this.startTime,
    required this.endTime,
    required this.durationMs,
    this.startLocator,
    this.endLocator,
    this.chapterIndex,
  });

  @override
  List<Object?> get props => [
    id,
    resourceId,
    startTime,
    endTime,
    durationMs,
    startLocator,
    endLocator,
    chapterIndex,
  ];
}
