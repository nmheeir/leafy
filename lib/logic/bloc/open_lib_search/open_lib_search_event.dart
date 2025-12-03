part of 'open_lib_search_bloc.dart';

sealed class OpenLibSearchEvent extends Equatable {
  const OpenLibSearchEvent();

  @override
  List<Object> get props => [];
}

final class OpenLibSearchGeneralEvent extends OpenLibSearchEvent {
  const OpenLibSearchGeneralEvent();
 
  @override
  List<Object> get props => [];
}

final class OpenLibSearchAuthorEvent extends OpenLibSearchEvent {
  const OpenLibSearchAuthorEvent();

  @override
  List<Object> get props => [];
}

final class OpenLibSearchISBNEvent extends OpenLibSearchEvent {
  const OpenLibSearchISBNEvent();

  @override
  List<Object> get props => [];
}
