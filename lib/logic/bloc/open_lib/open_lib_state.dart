part of 'open_lib_bloc.dart';

sealed class OpenLibState extends Equatable {
  const OpenLibState();

  @override
  List<Object?> get props => [];
}

final class OpenLibReadyState extends OpenLibState {
  @override
  List<Object> get props => [];
}

final class OpenLibLoadingState extends OpenLibState {
  @override
  List<Object> get props => [];
}

final class OpenLibLoadedState extends OpenLibState {
  final List<OLSearchResultDoc>? docs;
  final int? numFound;
  final bool? numFoundExact;

  const OpenLibLoadedState(this.docs, this.numFound, this.numFoundExact);
  @override
  List<Object?> get props => [docs, numFound, numFoundExact];
}

final class OpenLibNoInternetState extends OpenLibState {
  @override
  List<Object?> get props => [];
}
