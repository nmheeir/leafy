import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/device/repositories/device_repository.dart';

@lazySingleton
class SetBrightness implements UseCase<Unit, double> {
  final DeviceRepository _repository;

  SetBrightness(this._repository);

  @override
  Future<Either<Failure, Unit>> call(double brightness) async {
    return await _repository.setBrightness(brightness);
  }
}
