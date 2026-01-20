import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/device/repositories/device_repository.dart';

@lazySingleton
class GetBrightness implements UseCase<double, NoParams> {
  final DeviceRepository _repository;

  GetBrightness(this._repository);

  @override
  Future<Either<Failure, double>> call(NoParams params) async {
    return await _repository.getBrightness();
  }
}
