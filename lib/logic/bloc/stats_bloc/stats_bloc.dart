import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/entities/stats_result.dart';
import 'package:leafy/domain/book/usecases/stat_calculator.dart';

part 'stats_event.dart';
part 'stats_state.dart';

@injectable
class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final StatsCalculator _statsCalculator;

  StatsBloc(this._statsCalculator) : super(StatsLoading()) {
    on<StatsLoad>(_onStatsLoad);
  }

  void _onStatsLoad(StatsLoad event, Emitter<StatsState> emit) {
    emit(StatsLoading());

    try {
      final result = _statsCalculator.calculate(event.books);
      emit(StatsLoaded(result));
    } on StatsEmptyException {
      emit(const StatsFailure(StatsFailureType.emptyData));
    } catch (_) {
      emit(const StatsFailure(StatsFailureType.unknown));
    }
  }
}
