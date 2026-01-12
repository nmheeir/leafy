import 'package:equatable/equatable.dart';

class ReaderProgress extends Equatable {
  final String resourceId;
  final String locator;
  final double progressPct;
  final DateTime lastReadAt;

  const ReaderProgress({
    required this.resourceId,
    required this.locator,
    required this.progressPct,
    required this.lastReadAt,
  });

  @override
  List<Object?> get props => [resourceId, locator, progressPct, lastReadAt];
}
