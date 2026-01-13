// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reader_progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReaderProgressModel _$ReaderProgressModelFromJson(Map<String, dynamic> json) =>
    _ReaderProgressModel(
      resourceId: (json['resource_id'] as num).toInt(),
      locator: json['locator'] as String?,
      progressPct: (json['progress_pct'] as num?)?.toDouble() ?? 0.0,
      lastReadAt: const IntToDatetimeCoverter().fromJson(
        (json['last_read_at'] as num?)?.toInt(),
      ),
    );

Map<String, dynamic> _$ReaderProgressModelToJson(
  _ReaderProgressModel instance,
) => <String, dynamic>{
  'resource_id': instance.resourceId,
  'locator': instance.locator,
  'progress_pct': instance.progressPct,
  'last_read_at': const IntToDatetimeCoverter().toJson(instance.lastReadAt),
};
