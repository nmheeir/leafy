part of 'open_lib_bloc.dart';

sealed class OpenLibEvent extends Equatable {
  const OpenLibEvent();

  @override
  List<Object?> get props => [];
}

final class ReadyEvent extends OpenLibEvent {
  @override
  List<Object?> get props => [];
}

final class ReconnectInternetEvent extends OpenLibEvent {
  @override
  List<Object?> get props => [];
}

final class NoInternetEvent extends OpenLibEvent {
  @override
  List<Object?> get props => [];
}
