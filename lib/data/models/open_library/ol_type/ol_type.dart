import 'package:freezed_annotation/freezed_annotation.dart';

part 'ol_type.freezed.dart';
part 'ol_type.g.dart';

@freezed
abstract class OLType with _$OLType {
  const factory OLType({@JsonKey(name: "key") String? key}) = _OLType;

  factory OLType.fromJson(Map<String, dynamic> json) => _$OLTypeFromJson(json);
}
