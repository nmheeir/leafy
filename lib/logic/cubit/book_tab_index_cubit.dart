import 'package:flutter_bloc/flutter_bloc.dart';

class BookTabIndexCubit extends Cubit<int> {
  BookTabIndexCubit() : super(0);

  void setTabIndex(int tabIndex) => emit(tabIndex);
}