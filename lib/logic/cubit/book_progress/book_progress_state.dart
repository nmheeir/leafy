import 'package:equatable/equatable.dart';

abstract class BookProgressState extends Equatable {
  const BookProgressState();

  @override
  List<Object?> get props => [];
}

class BookProgressInitial extends BookProgressState {
  const BookProgressInitial();
}

class BookProgressLoading extends BookProgressState {
  const BookProgressLoading();
}

class BookProgressLoaded extends BookProgressState {
  final double progress;

  const BookProgressLoaded(this.progress);

  @override
  List<Object?> get props => [progress];
}

class BookProgressError extends BookProgressState {
  final String message;

  const BookProgressError(this.message);

  @override
  List<Object?> get props => [message];
}
