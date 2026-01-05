// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Classifications _$ClassificationsFromJson(Map<String, dynamic> json) =>
    _Classifications(
      deweyDecimalClass: (json['dewey_decimal_class'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lcClassifications: (json['lc_classifications'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ClassificationsToJson(_Classifications instance) =>
    <String, dynamic>{
      'dewey_decimal_class': instance.deweyDecimalClass,
      'lc_classifications': instance.lcClassifications,
    };
