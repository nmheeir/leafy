import 'package:freezed_annotation/freezed_annotation.dart';

part 'created.freezed.dart';
part 'created.g.dart';

@freezed
abstract class Created with _$Created {
  const factory Created({
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "value") DateTime? value,
  }) = _Created;

  factory Created.fromJson(Map<String, dynamic> json) =>
      _$CreatedFromJson(json);
}
