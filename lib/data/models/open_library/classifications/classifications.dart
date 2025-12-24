import 'package:freezed_annotation/freezed_annotation.dart';

part 'classifications.freezed.dart';
part 'classifications.g.dart';

@freezed
abstract class Classifications with _$Classifications {
  factory Classifications({
    @JsonKey(name: 'dewey_decimal_class') List<String>? deweyDecimalClass,
    @JsonKey(name: 'lc_classifications') List<String>? lcClassifications,
  }) = _Classifications;

  factory Classifications.fromJson(Map<String, dynamic> json) =>
      _$ClassificationsFromJson(json);
}
