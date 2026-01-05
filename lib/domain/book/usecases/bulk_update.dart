import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/core/usecase/usecase.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';
import 'package:leafy/domain/book/usecases/params/bulk_update_params.dart';

@injectable
class BulkUpdateUseCase implements UseCase<Unit, BulkUpdateBooksParams> {
  final BookRepository bookRepository;

  BulkUpdateUseCase(this.bookRepository);

  @override
  Future<Either<Failure, Unit>> call(BulkUpdateBooksParams params) async {
    // 1. Validate: Phải có ít nhất 1 cuốn sách được chọn
    if (params.ids.isEmpty) {
      // TODO: cần sửa lại lỗi trả về tương ứng, không dùng unexpected
      return Left(Failure.unexpected("Chưa chọn cuốn sách nào"));
    }

    // 2. Validate: Phải có ít nhất 1 trường dữ liệu cần sửa
    if (!params.hasUpdates) {
      return Left(Failure.unexpected("Không có dữ liệu nào thay đổi"));
    }

    // 3. Có thể thêm logic business ở đây.
    // Ví dụ: Làm sạch chuỗi Author trước khi lưu
    // if (params.author != null) params.author = params.author!.trim();

    return await bookRepository.bulkUpdateBooks(params);
  }
}
