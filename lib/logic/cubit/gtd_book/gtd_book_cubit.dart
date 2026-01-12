import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gtd_book_state.dart';
part 'gtd_book_cubit.freezed.dart';

class GtdBookCubit extends Cubit<GtdBookState> {
  GtdBookCubit() : super(GtdBookState.initial());
}
