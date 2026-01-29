import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';
import 'package:leafy/domain/tag/usecases/params/get_or_create_tag_params.dart';

@injectable
class GetOrCreateTagUseCase implements UseCase<Tag, GetOrCreateTagParams> {
  final TagRepository _repository;

  const GetOrCreateTagUseCase(this._repository);

  @override
  Future<Either<Failure, Tag>> call(GetOrCreateTagParams params) async {
    return _repository.getOrCreateTag(
      params.name,
      color: params.color,
      icon: params.icon,
      priority: params.priority,
      isSystem: params.isSystem,
      category: params.category,
    );
  }
}
