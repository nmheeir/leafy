part of 'challenge_bloc.dart';

sealed class ChallengeEvent extends Equatable {
  const ChallengeEvent();

  @override
  List<Object?> get props => [];
}

final class ChangeChallengeEvent extends ChallengeEvent {
  final int year;
  final int? books;
  final int? pages;

  const ChangeChallengeEvent({
    required this.year,
    required this.books,
    required this.pages,
  });

  @override
  List<Object?> get props => [year, books, pages];
}

final class RestoreChallengesEvent extends ChallengeEvent {
  final String? challenges;

  const RestoreChallengesEvent({
    required this.challenges,
  });

  @override
  List<Object?> get props => [challenges];
}

final class RemoveAllChallengesEvent extends ChallengeEvent {
  const RemoveAllChallengesEvent();

  @override
  List<Object?> get props => [];
}
