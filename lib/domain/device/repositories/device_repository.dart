import 'package:fpdart/fpdart.dart';
import 'package:leafy/core/constants/enums/epub_reader_setting/screen_orientation.dart';
import 'package:leafy/core/errors/failures.dart';

abstract class DeviceRepository {
  Future<Either<Failure, double>> getBrightness();
  Future<Either<Failure, Unit>> setBrightness(double brightness);
  Future<Either<Failure, Unit>> resetBrightness();
  Future<Either<Failure, Unit>> setOrientation(ScreenOrientation orientation);
}
