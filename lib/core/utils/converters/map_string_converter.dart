import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

class MapStringConverter implements JsonConverter<Map<String, String>, String> {
  const MapStringConverter();

  @override
  Map<String, String> fromJson(String json) {
    final dynamic decoded = jsonDecode(json);
    return Map<String, String>.from(decoded as Map);
  }

  @override
  String toJson(Map<String, String> object) {
    return jsonEncode(object);
  }
}
