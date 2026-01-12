part of 'epub_view_cubit.dart';

@freezed
sealed class EpubViewState with _$EpubViewState {
  const factory EpubViewState.initial() = _EpubViewInitial;

  const factory EpubViewState.loading(double progress) = _EpubViewLoading;

  const factory EpubViewState.loaded({
    required File file,
    required BookResource resource,
    String? initialLocator, // CFI string để resume vị trí đọc
  }) = _EpubViewLoaded;

  const factory EpubViewState.error({required String message}) = _EpubViewError;
}
