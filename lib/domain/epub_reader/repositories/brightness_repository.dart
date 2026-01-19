import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/errors/failures.dart';

abstract class BrightnessRepository {
  Future<Either<Failure, double>> getBrightness();
  Future<Either<Failure, Unit>> setBrightness(double brightness);
  Future<Either<Failure, Unit>> resetBrightness();
}
