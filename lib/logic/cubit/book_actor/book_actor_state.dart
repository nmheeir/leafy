part of 'book_actor_cubit.dart';

@freezed
abstract class BookActorState with _$BookActorState {
  const factory BookActorState.initial() = _Initial;
  const factory BookActorState.loading() = _Loading;
  const factory BookActorState.success({required String message, Book? book}) =
      _Success;
  const factory BookActorState.failure({required String message}) = _Failure;
}
