part of 'challenge_bloc.dart';

sealed class ChallengeState extends Equatable {
  const ChallengeState();
  
  @override
  List<Object?> get props => [];
}

final class SetChallengeState extends ChallengeState {
  final String? yearlyChallenges;

  const SetChallengeState({this.yearlyChallenges});

  @override
  List<Object?> get props => [yearlyChallenges];
}
