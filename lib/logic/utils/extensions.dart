import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/logic/bloc/local_search/local_search_bloc.dart';
import 'package:leafy/logic/bloc/stats_bloc/stats_bloc.dart';
import 'package:leafy/logic/cubit/book_detail/book_detail_cubit.dart';
import 'package:leafy/logic/cubit/current_book_cubit.dart';
import 'package:leafy/logic/cubit/default_book_format_cubit.dart';
import 'package:leafy/logic/cubit/default_book_tag_cubit.dart';
import 'package:leafy/logic/cubit/edit_book_cubit.dart';
import 'package:leafy/logic/cubit/library/library_cubit.dart';
import 'package:leafy/logic/cubit/book_actor/book_actor_cubit.dart';
import 'package:leafy/logic/cubit/trash/trash_bin_cubit.dart';

extension BlocExtensions on BuildContext {
  ///////////////////////////// CUBIT /////////////////////////////
  LibraryCubit get library => read<LibraryCubit>();

  BookActorCubit get bookActor => read<BookActorCubit>();

  CurrentBookCubit get currentBook => read<CurrentBookCubit>();

  TrashBinCubit get trashBin => read<TrashBinCubit>();

  BookDetailCubit get bookDetail => read<BookDetailCubit>();

  EditBookCubit get editBook => read<EditBookCubit>();

  DefaultBookTagCubit get defaultBookTag => read<DefaultBookTagCubit>();

  DefaultBookFormatCubit get defaultBookFormat =>
      read<DefaultBookFormatCubit>();

  ///////////////////////////// BLOC /////////////////////////////
  LocalSearchBloc get localSearch => read<LocalSearchBloc>();

  StatsBloc get statsBloc => read<StatsBloc>();
}
