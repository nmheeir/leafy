import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/core/constants/enums/storage_type.dart';

class StorageTypeConverter implements JsonConverter<StorageType, String> {
  const StorageTypeConverter();

  @override
  StorageType fromJson(String json) {
    return StorageType.values.firstWhere(
      (e) => e.name == json,
      orElse: () => StorageType.local,
    );
  }

  @override
  String toJson(StorageType object) {
    return object.name;
  }
}
