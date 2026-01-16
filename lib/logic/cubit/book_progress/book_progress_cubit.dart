import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/reader_progress/usecases/get_reader_progress_by_path.dart';
import 'package:leafy/logic/cubit/book_progress/book_progress_state.dart';

@injectable
class BookProgressCubit extends Cubit<BookProgressState> {
  final GetReaderProgressByPathUseCase _getReaderProgressByPathUseCase;

  BookProgressCubit(this._getReaderProgressByPathUseCase)
    : super(const BookProgressInitial());

  Future<void> loadProgress(String filePath) async {
    emit(const BookProgressLoading());

    try {
      final progress = await _getReaderProgressByPathUseCase(filePath);
      if (progress != null) {
        emit(BookProgressLoaded(progress.progressPct));
      } else {
        // If no progress found, it means 0%
        emit(const BookProgressLoaded(0.0));
      }
    } catch (e) {
      emit(BookProgressError(e.toString()));
    }
  }
}
