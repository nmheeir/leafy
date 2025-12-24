import 'package:freezed_annotation/freezed_annotation.dart';

part 'contributor.freezed.dart';
part 'contributor.g.dart';

@freezed
abstract class Contributor with _$Contributor {
  const factory Contributor({
    @JsonKey(name: "role") String? role,
    @JsonKey(name: "name") String? name,
  }) = _Contributor;

  factory Contributor.fromJson(Map<String, dynamic> json) =>
      _$ContributorFromJson(json);
}
