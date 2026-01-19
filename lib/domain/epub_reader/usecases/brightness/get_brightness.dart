import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/epub_reader/repositories/brightness_repository.dart';

@lazySingleton
class GetBrightness implements UseCase<double, NoParams> {
  final BrightnessRepository _repository;

  GetBrightness(this._repository);

  @override
  Future<Either<Failure, double>> call(NoParams params) async {
    return await _repository.getBrightness();
  }
}
