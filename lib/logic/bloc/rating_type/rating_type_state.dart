part of 'rating_type_bloc.dart';

sealed class RatingTypeState extends Equatable {
  const RatingTypeState();

  @override
  List<Object> get props => [];
}

final class RatingTypeBar extends RatingTypeState {}

final class RatingTypeNumber extends RatingTypeState {}
