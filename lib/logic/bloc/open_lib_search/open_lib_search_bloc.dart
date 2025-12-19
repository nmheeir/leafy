import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'open_lib_search_event.dart';
part 'open_lib_search_state.dart';

@injectable
class OpenLibSearchBloc extends Bloc<OpenLibSearchEvent, OpenLibSearchState> {
  OpenLibSearchBloc() : super(OpenLibSearchGeneralState()) {
    on<OpenLibSearchGeneralEvent>((event, emit) {
      emit(OpenLibSearchGeneralState());
    });
    on<OpenLibSearchAuthorEvent>((event, emit) {
      emit(OpenLibSearchAuthorState());
    });
    on<OpenLibSearchISBNEvent>((event, emit) {
      emit(OpenLibSearchISBNState());
    });
    on<OpenLibSearchTitleEvent>((event, emit) {
      emit(OpenLibSearchTitleState());
    });
  }
}
