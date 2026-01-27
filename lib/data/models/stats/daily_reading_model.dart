class DailyReadingModel {
  final int startTime;
  final int durationMs;

  DailyReadingModel({required this.startTime, required this.durationMs});

  factory DailyReadingModel.fromJson(Map<String, dynamic> json) {
    return DailyReadingModel(
      startTime: json['start_time'] as int,
      durationMs: json['duration_ms'] as int,
    );
  }
}
