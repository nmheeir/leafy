import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/data/datasources/local/brightness_local_datasource.dart';
import 'package:leafy/domain/epub_reader/repositories/brightness_repository.dart';

@LazySingleton(as: BrightnessRepository)
class BrightnessRepositoryImpl implements BrightnessRepository {
  final BrightnessLocalDataSource _localDataSource;

  BrightnessRepositoryImpl(this._localDataSource);

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
}
