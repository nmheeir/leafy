import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/core/utils/converters/int_to_datetime_coverter.dart';
import 'package:leafy/domain/reader_progress/entities/reader_progress.dart';

part 'reader_progress_model.freezed.dart';
part 'reader_progress_model.g.dart';

@freezed
abstract class ReaderProgressModel with _$ReaderProgressModel {
  const factory ReaderProgressModel({
    /// FK → book_resources.id
    /// 1 resource = 1 progress (PRIMARY KEY)
    @JsonKey(name: 'resource_id') required int resourceId,

    /// Vị trí đọc:
    /// - EPUB: CFI
    /// - PDF: page
    /// - HTML: anchor
    String? locator,

    /// % hoàn thành (0.0 – 1.0)
    @JsonKey(name: 'progress_pct') @Default(0.0) double progressPct,

    /// Timestamp lần đọc cuối (millisecondsSinceEpoch)
    @IntToDatetimeCoverter()
    @JsonKey(name: 'last_read_at')
    DateTime? lastReadAt,
  }) = _ReaderProgressModel;

  factory ReaderProgressModel.fromJson(Map<String, dynamic> json) =>
      _$ReaderProgressModelFromJson(json);

  const ReaderProgressModel._();

  ReaderProgress toEntity() {
    return ReaderProgress(
      resourceId: resourceId
          .toString(), // Entity uses String ID currently? Checked earlier.
      locator: locator ?? '',
      progressPct: progressPct,
      lastReadAt: lastReadAt ?? DateTime.now(),
    );
  }
}
