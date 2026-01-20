import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/epub_reader_setting/screen_orientation.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/local/device_local_datasource.dart';
import 'package:leafy/domain/device/repositories/device_repository.dart';

@LazySingleton(as: DeviceRepository)
class DeviceRepositoryImpl implements DeviceRepository {
  final DeviceLocalDataSource _localDataSource;

  DeviceRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, double>> getBrightness() async {
    try {
      final brightness = await _localDataSource.currentBrightness;
      return Right(brightness);
    } catch (e) {
      return Left(Failure.cache(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> setBrightness(double brightness) async {
    try {
      await _localDataSource.setBrightness(brightness);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.cache(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetBrightness() async {
    try {
      await _localDataSource.resetBrightness();
      return const Right(unit);
    } catch (e) {
      return Left(Failure.cache(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> setOrientation(
    ScreenOrientation orientation,
  ) async {
    try {
      await _localDataSource.setOrientation(orientation);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.cache(e.toString()));
    }
  }
}
