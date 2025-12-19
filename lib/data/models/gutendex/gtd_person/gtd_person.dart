import 'package:freezed_annotation/freezed_annotation.dart';

part 'gtd_person.freezed.dart';
part 'gtd_person.g.dart';

@freezed
abstract class GtdPerson with _$GtdPerson {
  const factory GtdPerson({
    required String? name,
    required int? birthYear,
    required int? deathYear,
  }) = _GtdPerson;

  factory GtdPerson.fromJson(Map<String, dynamic> json) =>
      _$GtdPersonFromJson(json);
}
