part of 'stats_bloc.dart';

sealed class StatsState extends Equatable {
  const StatsState();

  @override
  List<Object?> get props => [];
}

final class StatsLoading extends StatsState {}

final class StatsLoaded extends StatsState {
  final StatsResult result;

  const StatsLoaded(this.result);

  @override
  List<Object?> get props => [result];
}

final class StatsEmpty extends StatsState {}

final class StatsFailure extends StatsState {
  final StatsFailureType type;

  const StatsFailure(this.type);

  @override
  List<Object?> get props => [type];
}

enum StatsFailureType { emptyData, unknown }
