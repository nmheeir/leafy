import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';

part 'book_resource_state.freezed.dart';

@freezed
class BookResourceState with _$BookResourceState {
  const factory BookResourceState.initial() = _Initial;
  const factory BookResourceState.loading() = _Loading;
  const factory BookResourceState.success(List<BookResource> resources) =
      _Success;
  const factory BookResourceState.failure(String message) = _Failure;

  // Trạng thái riêng cho việc download
  const factory BookResourceState.downloading(
    String resourceUuid,
    double progress,
  ) = _Downloading;

  const factory BookResourceState.importing() = _Importing;
}
