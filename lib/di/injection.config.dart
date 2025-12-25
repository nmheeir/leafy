// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i497;

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:logger/web.dart' as _i120;

import '../core/utils/extensions/history_observer.dart' as _i308;
import '../data/database/database_controller.dart' as _i188;
import '../data/database/database_provider.dart' as _i1014;
import '../data/datasources/remote/ol_remote_data_source.dart' as _i715;
import '../data/repositories/book_repository_impl.dart' as _i329;
import '../data/repositories/gutendex_repository_impl.dart' as _i779;
import '../data/repositories/open_lib_repository_impl.dart' as _i946;
import '../domain/repositories/book_repository.dart' as _i168;
import '../domain/repositories/gutendex_repository.dart' as _i569;
import '../domain/repositories/open_lib_repository.dart' as _i996;
import '../domain/repositories/repository.dart' as _i1001;
import '../domain/services/connectivity_service.dart' as _i394;
import '../domain/services/epub_cached_service.dart' as _i374;
import '../domain/services/gutendex_service.dart' as _i446;
import '../domain/services/open_library_service.dart' as _i625;
import '../domain/usecases/book_usecases/get_all_books.dart' as _i1048;
import '../domain/usecases/book_usecases/search_books.dart' as _i1057;
import '../domain/usecases/gutendex_usecases/gtd_get_books.dart' as _i209;
import '../domain/usecases/open_lib_usecases/open_lib_search.dart' as _i503;
import '../logic/bloc/challenge_bloc/challenge_bloc.dart' as _i854;
import '../logic/bloc/open_lib_search/open_lib_search_bloc.dart' as _i52;
import '../logic/bloc/rating_type/rating_type_bloc.dart' as _i280;
import '../logic/bloc/search/search_bloc.dart' as _i361;
import '../logic/bloc/sort_bloc/sort_bloc.dart' as _i713;
import '../logic/bloc/stats_bloc/stats_bloc.dart' as _i780;
import '../logic/bloc/theme/theme_bloc.dart' as _i774;
import '../logic/cubit/book_cubit.dart' as _i865;
import '../logic/cubit/book_list_order_cubit.dart' as _i66;
import '../logic/cubit/book_tab_index_cubit.dart' as _i744;
import '../logic/cubit/current_book_cubit.dart' as _i754;
import '../logic/cubit/default_book_format_cubit.dart' as _i185;
import '../logic/cubit/default_book_tag_cubit.dart' as _i260;
import '../logic/cubit/display_cubit.dart' as _i985;
import '../logic/cubit/edit_book_cover_cubit.dart' as _i67;
import '../logic/cubit/edit_book_cubit.dart' as _i232;
import '../logic/cubit/selected_book_cubit.dart' as _i772;
import 'module/logger_module.dart' as _i454;
import 'module/network_module.dart' as _i881;
import 'module/storage_module.dart' as _i847;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final storageModule = _$StorageModule();
    final loggerModule = _$LoggerModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i854.ChallengeBloc>(() => _i854.ChallengeBloc());
    gh.factory<_i52.OpenLibSearchBloc>(() => _i52.OpenLibSearchBloc());
    gh.factory<_i280.RatingTypeBloc>(() => _i280.RatingTypeBloc());
    gh.factory<_i713.SortFinishedBooksBloc>(
      () => _i713.SortFinishedBooksBloc(),
    );
    gh.factory<_i713.SortInProgressBooksBloc>(
      () => _i713.SortInProgressBooksBloc(),
    );
    gh.factory<_i713.SortForLaterBooksBloc>(
      () => _i713.SortForLaterBooksBloc(),
    );
    gh.factory<_i713.SortUnfinishedBooksBloc>(
      () => _i713.SortUnfinishedBooksBloc(),
    );
    gh.factory<_i780.StatsBloc>(() => _i780.StatsBloc());
    gh.factory<_i774.ThemeBloc>(() => _i774.ThemeBloc());
    gh.factory<_i66.BookListsOrderCubit>(() => _i66.BookListsOrderCubit());
    gh.factory<_i744.BookTabIndexCubit>(() => _i744.BookTabIndexCubit());
    gh.factory<_i754.CurrentBookCubit>(() => _i754.CurrentBookCubit());
    gh.factory<_i185.DefaultBookFormatCubit>(
      () => _i185.DefaultBookFormatCubit(),
    );
    gh.factory<_i260.DefaultBookTagCubit>(() => _i260.DefaultBookTagCubit());
    gh.factory<_i985.DisplayCubit>(() => _i985.DisplayCubit());
    gh.factory<_i67.EditBookCoverCubit>(() => _i67.EditBookCoverCubit());
    gh.factory<_i232.EditBookCubit>(() => _i232.EditBookCubit());
    gh.factory<_i772.SelectedBooksCubit>(() => _i772.SelectedBooksCubit());
    gh.singleton<_i1014.DatabaseProvider>(() => _i1014.DatabaseProvider());
    await gh.singletonAsync<_i497.Directory>(
      () => storageModule.documentsDir,
      preResolve: true,
    );
    gh.lazySingleton<_i120.Logger>(() => loggerModule.logger);
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i394.ConnectivityService>(
      () => _i394.ConnectivityService(),
    );
    gh.lazySingleton<_i569.GutendexRepository>(
      () => _i779.GutendexRepositoryImpl(),
    );
    gh.lazySingleton<_i715.OlRemoteDataSource>(
      () => _i715.OlRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i308.HistoryObserver>(
      () => _i308.HistoryObserver(gh<_i974.Logger>()),
    );
    gh.lazySingleton<_i374.EpubCachedService>(
      () => _i374.EpubCachedService(
        gh<_i361.Dio>(),
        gh<_i974.Logger>(),
        gh<_i497.Directory>(),
      ),
    );
    gh.lazySingleton<_i625.OpenLibraryService>(
      () => _i625.OpenLibraryService(gh<_i361.Dio>(), gh<_i974.Logger>()),
    );
    gh.lazySingleton<_i188.DatabaseController>(
      () => _i188.DatabaseController(gh<_i1014.DatabaseProvider>()),
    );
    gh.factory<_i209.GtdGetBooksUseCase>(
      () => _i209.GtdGetBooksUseCase(gh<_i569.GutendexRepository>()),
    );
    gh.lazySingleton<_i446.GutendexService>(
      () => _i446.GutendexService(gh<_i974.Logger>(), gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i168.BookRepository>(
      () => _i329.BookRepositoryImpl(gh<_i715.OlRemoteDataSource>()),
    );
    gh.lazySingleton<_i996.OpenLibRepository>(
      () => _i946.OpenLibRepositoryImpl(gh<_i715.OlRemoteDataSource>()),
    );
    gh.lazySingleton<_i1001.Repository>(
      () => _i1001.Repository(gh<_i188.DatabaseController>()),
    );
    gh.factory<_i865.BookCubit>(() => _i865.BookCubit(gh<_i1001.Repository>()));
    gh.factory<_i503.OpenLibSearchUseCase>(
      () => _i503.OpenLibSearchUseCase(gh<_i996.OpenLibRepository>()),
    );
    gh.factory<_i1048.GetAllBooksUseCase>(
      () => _i1048.GetAllBooksUseCase(gh<_i168.BookRepository>()),
    );
    gh.factory<_i1057.SearchBooksUseCase>(
      () => _i1057.SearchBooksUseCase(gh<_i168.BookRepository>()),
    );
    gh.factory<_i361.SearchBloc>(
      () => _i361.SearchBloc(gh<_i503.OpenLibSearchUseCase>()),
    );
    return this;
  }
}

class _$StorageModule extends _i847.StorageModule {}

class _$LoggerModule extends _i454.LoggerModule {}

class _$NetworkModule extends _i881.NetworkModule {}
