import 'package:freezed_annotation/freezed_annotation.dart';

class IntToDatetimeCoverter implements JsonConverter<DateTime?, int?> {
  const IntToDatetimeCoverter();

  @override
  DateTime? fromJson(int? json) {
    if (json == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(json, isUtc: true);
  }

  @override
  int? toJson(DateTime? object) {
    return object?.toUtc().millisecondsSinceEpoch;
  }
}
