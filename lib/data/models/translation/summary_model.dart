import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_model.freezed.dart';
part 'summary_model.g.dart';

@freezed
abstract class SummaryModel with _$SummaryModel {
  const factory SummaryModel({
    int? id,
    @JsonKey(name: 'file_hash') required String fileHash,
    @JsonKey(name: 'chapter_index') required int chapterIndex,
    @JsonKey(name: 'summary_content') required String summaryContent,
    @JsonKey(name: 'last_updated') int? lastUpdated,
  }) = _SummaryModel;

  factory SummaryModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryModelFromJson(json);
}
