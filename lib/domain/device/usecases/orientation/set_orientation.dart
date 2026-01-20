import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/epub_reader_setting/screen_orientation.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/device/repositories/device_repository.dart';

@lazySingleton
class SetOrientation implements UseCase<Unit, ScreenOrientation> {
  final DeviceRepository _repository;

  SetOrientation(this._repository);

  @override
  Future<Either<Failure, Unit>> call(ScreenOrientation orientation) async {
    return await _repository.setOrientation(orientation);
  }
}
