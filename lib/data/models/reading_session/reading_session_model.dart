import 'package:freezed_annotation/freezed_annotation.dart';

part 'reading_session_model.freezed.dart';
part 'reading_session_model.g.dart';

@freezed
abstract class ReadingSessionModel with _$ReadingSessionModel {
  const factory ReadingSessionModel({
    /// UUID của session đọc (PRIMARY KEY)
    required String id,

    /// FK → booksTable.id
    @JsonKey(name: 'resource_id') required int resourceId,

    /// Thời điểm bắt đầu đọc (millisecondsSinceEpoch)
    @JsonKey(name: 'start_time') required int startTime,

    /// Thời điểm kết thúc đọc (millisecondsSinceEpoch)
    @JsonKey(name: 'end_time') required int endTime,

    /// Thời gian đọc thực tế (ms)
    @JsonKey(name: 'duration_ms') required int durationMs,

    /// Chương đang đọc (chỉ để tham khảo / thống kê)
    @JsonKey(name: 'chapter_index') int? chapterIndex,
  }) = _ReadingSessionModel;

  factory ReadingSessionModel.fromJson(Map<String, dynamic> json) =>
      _$ReadingSessionModelFromJson(json);
}
