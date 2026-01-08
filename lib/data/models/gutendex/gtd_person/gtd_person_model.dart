import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/domain/gutendex/entities/gtd_person.dart';

part 'gtd_person_model.freezed.dart';
part 'gtd_person_model.g.dart';

@freezed
abstract class GtdPersonModel with _$GtdPersonModel {
  const factory GtdPersonModel({
    required String? name,
    @JsonKey(name: 'birth_year') required int? birthYear,
    @JsonKey(name: 'death_year') required int? deathYear,
  }) = _GtdPersonModel;

  factory GtdPersonModel.fromJson(Map<String, dynamic> json) =>
      _$GtdPersonModelFromJson(json);

  const GtdPersonModel._();

  /// Mapping: Entity -> Model
  factory GtdPersonModel.fromEntity(GtdPerson entity) {
    return GtdPersonModel(
      name: entity.name,
      birthYear: entity.birthYear,
      deathYear: entity.deathYear,
    );
  }

  /// Mapping: Model -> Entity
  GtdPerson toEntity() {
    return GtdPerson(name: name, birthYear: birthYear, deathYear: deathYear);
  }
}
