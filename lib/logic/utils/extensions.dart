import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/logic/bloc/local_search/local_search_bloc.dart';
import 'package:leafy/logic/bloc/stats_bloc/stats_bloc.dart';
import 'package:leafy/logic/cubit/book_detail/book_detail_cubit.dart';
import 'package:leafy/logic/cubit/book_editor_action/book_editor_action_cubit.dart';
import 'package:leafy/logic/cubit/current_book_cubit.dart';
import 'package:leafy/logic/cubit/default_book_format_cubit.dart';
import 'package:leafy/logic/cubit/default_book_tag_cubit.dart';
import 'package:leafy/logic/cubit/edit_book_cover_cubit.dart';
import 'package:leafy/logic/cubit/edit_book_cubit.dart';
import 'package:leafy/logic/cubit/library/library_cubit.dart';
import 'package:leafy/logic/cubit/book_actor/book_actor_cubit.dart';
import 'package:leafy/logic/cubit/trash/trash_bin_cubit.dart';

extension BlocExtensions on BuildContext {
  ///////////////////////////// CUBIT /////////////////////////////

  BookActorCubit get bookActorCubit => read<BookActorCubit>();

  CurrentBookCubit get currentBookCubit => read<CurrentBookCubit>();

  TrashBinCubit get trashBinCubit => read<TrashBinCubit>();

  BookDetailCubit get bookDetailCubit => read<BookDetailCubit>();

  EditBookCubit get editBookCubit => read<EditBookCubit>();

  EditBookCoverCubit get editBookCoverCubit => read<EditBookCoverCubit>();

  DefaultBookTagCubit get defaultBookTagCubit => read<DefaultBookTagCubit>();

  DefaultBookFormatCubit get defaultBookFormatCubit =>
      read<DefaultBookFormatCubit>();

  LibraryCubit get libraryCubit => read<LibraryCubit>();

  BookEditorActionCubit get bookEditorActionCubit =>
      read<BookEditorActionCubit>();

  ///////////////////////////// BLOC /////////////////////////////
  LocalSearchBloc get localSearchBloc => read<LocalSearchBloc>();

  StatsBloc get statsBloc => read<StatsBloc>();
}
