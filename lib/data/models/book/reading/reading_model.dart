// data/models/reading_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/domain/book/entities/reading.dart';

part 'reading_model.freezed.dart';
part 'reading_model.g.dart';

@freezed
abstract class ReadingModel with _$ReadingModel {
  const ReadingModel._();

  const factory ReadingModel({
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'end_date') DateTime? finishDate,
    @JsonKey(name: 'reading_time_ms') @Default(0) int readingTimeMs,
  }) = _ReadingModel;

  factory ReadingModel.fromJson(Map<String, dynamic> json) =>
      _$ReadingModelFromJson(json);

  Reading toEntity() {
    return Reading(
      startDate: startDate,
      finishDate: finishDate,
      readingTimeMs: readingTimeMs,
    );
  }

  factory ReadingModel.fromEntity(Reading entity) {
    return ReadingModel(
      startDate: entity.startDate,
      finishDate: entity.finishDate,
      readingTimeMs: entity.readingTimeMs ?? 0,
    );
  }
}
