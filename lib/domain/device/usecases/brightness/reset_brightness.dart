import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/device/repositories/device_repository.dart';

@lazySingleton
class ResetBrightnessUseCase implements UseCase<Unit, NoParams> {
  final DeviceRepository _repository;

  ResetBrightnessUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await _repository.resetBrightness();
  }
}
