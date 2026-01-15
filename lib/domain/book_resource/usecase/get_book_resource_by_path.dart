import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';
import 'package:leafy/domain/book_resource/repositories/book_resource_repository.dart';

@lazySingleton
class GetBookResourceByPathUseCase {
  final BookResourceRepository _repository;

  GetBookResourceByPathUseCase(this._repository);

  Future<Either<Failure, Option<BookResource>>> call(String filePath) async {
    return _repository.getResourceByPath(filePath);
  }
}
