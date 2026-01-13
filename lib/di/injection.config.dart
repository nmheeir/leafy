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
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../core/services/connectivity_service.dart' as _i786;
import '../core/utils/extensions/history_observer.dart' as _i308;
import '../data/datasources/local/book_local_datasource.dart' as _i758;
import '../data/datasources/local/book_local_datasource_impl.dart' as _i689;
import '../data/datasources/local/book_resource_local_datasource.dart' as _i880;
import '../data/datasources/local/book_resource_local_datasource_impl.dart'
    as _i612;
import '../data/datasources/local/database_service.dart' as _i328;
import '../data/datasources/local/epub_file_local_datasource.dart' as _i620;
import '../data/datasources/local/epub_file_local_datasource_impl.dart'
    as _i536;
import '../data/datasources/local/epub_reader_local_datasource.dart' as _i722;
import '../data/datasources/local/reader_progress_local_datasource.dart'
    as _i770;
import '../data/datasources/local/reader_progress_local_datasource_impl.dart'
    as _i1030;
import '../data/datasources/remote/gutendex_remote_datasource/gutendex_remote_datasource.dart'
    as _i92;
import '../data/datasources/remote/network_file_datasource.dart' as _i798;
import '../data/datasources/remote/network_file_datasource_impl.dart' as _i643;
import '../data/datasources/remote/ol_remote_data_source.dart' as _i715;
import '../data/repositories/book_repository_impl.dart' as _i329;
import '../data/repositories/book_resource_repository_impl.dart' as _i722;
import '../data/repositories/epub_file_repository_impl.dart' as _i528;
import '../data/repositories/epub_reader_repository_impl.dart' as _i608;
import '../data/repositories/gutendex_repository_impl.dart' as _i779;
import '../data/repositories/open_lib_repository_impl.dart' as _i946;
import '../domain/book/repositories/book_repository.dart' as _i29;
import '../domain/book/usecases/add_book.dart' as _i660;
import '../domain/book/usecases/bulk_delete.dart' as _i909;
import '../domain/book/usecases/bulk_update.dart' as _i429;
import '../domain/book/usecases/delete_book.dart' as _i565;
import '../domain/book/usecases/download_gtd_cover.dart' as _i466;
import '../domain/book/usecases/download_ol_cover.dart' as _i151;
import '../domain/book/usecases/get_book.dart' as _i137;
import '../domain/book/usecases/get_deleted_book.dart' as _i679;
import '../domain/book/usecases/restore_book.dart' as _i675;
import '../domain/book/usecases/search_books.dart' as _i755;
import '../domain/book/usecases/stat_calculator.dart' as _i800;
import '../domain/book/usecases/update_book.dart' as _i552;
import '../domain/book/usecases/watch_all_books.dart' as _i864;
import '../domain/book_resource/repositories/book_resource_repository.dart'
    as _i1042;
import '../domain/book_resource/usecase/add_book_resource.dart' as _i693;
import '../domain/book_resource/usecase/check_book_resource_exist_by_hash.dart'
    as _i336;
import '../domain/book_resource/usecase/delete_book_resource.dart' as _i518;
import '../domain/book_resource/usecase/get_book_resource_by_uuid.dart'
    as _i1012;
import '../domain/book_resource/usecase/get_book_resources.dart' as _i452;
import '../domain/book_resource/usecase/update_book_resource_file.dart'
    as _i589;
import '../domain/epub_file/repositories/epub_file_repository.dart' as _i1072;
import '../domain/epub_file/usecases/get_epub.dart' as _i765;
import '../domain/epub_file/usecases/open_network_book.dart' as _i911;
import '../domain/epub_file/usecases/parse_epub.dart' as _i880;
import '../domain/epub_reader/repositories/epub_reader_repository.dart'
    as _i925;
import '../domain/gutendex/repositories/gutendex_repository.dart' as _i844;
import '../domain/gutendex/usecases/gtd_get_book.dart' as _i433;
import '../domain/gutendex/usecases/gtd_get_books.dart' as _i750;
import '../domain/open_lib/repositories/open_lib_repository.dart' as _i751;
import '../domain/open_lib/usecases/ol_get_work.dart' as _i138;
import '../domain/open_lib/usecases/open_lib_search.dart' as _i14;
import '../domain/reader_progress/usecases/clear_reader_progress.dart' as _i389;
import '../domain/reader_progress/usecases/save_reader_progress.dart' as _i860;
import '../domain/reader_progress/usecases/save_reader_progress_by_path.dart'
    as _i615;
import '../domain/services/epub_cached_service.dart' as _i374;
import '../domain/services/gutendex_service.dart' as _i446;
import '../domain/services/open_library_service.dart' as _i625;
import '../logic/bloc/challenge_bloc/challenge_bloc.dart' as _i854;
import '../logic/bloc/local_search/local_search_bloc.dart' as _i365;
import '../logic/bloc/open_lib_search/open_lib_search_bloc.dart' as _i52;
import '../logic/bloc/rating_type/rating_type_bloc.dart' as _i280;
import '../logic/bloc/search_gtd/search_gtd_bloc.dart' as _i641;
import '../logic/bloc/sort_bloc/sort_bloc.dart' as _i713;
import '../logic/bloc/stats_bloc/stats_bloc.dart' as _i780;
import '../logic/bloc/theme/theme_bloc.dart' as _i774;
import '../logic/cubit/book_actor/book_actor_cubit.dart' as _i607;
import '../logic/cubit/book_detail/book_detail_cubit.dart' as _i23;
import '../logic/cubit/book_editor_action/book_editor_action_cubit.dart'
    as _i113;
import '../logic/cubit/book_list_order_cubit.dart' as _i66;
import '../logic/cubit/book_resource/book_resource_cubit.dart' as _i407;
import '../logic/cubit/book_tab_index_cubit.dart' as _i744;
import '../logic/cubit/current_book_cubit.dart' as _i754;
import '../logic/cubit/default_book_format_cubit.dart' as _i185;
import '../logic/cubit/default_book_tag_cubit.dart' as _i260;
import '../logic/cubit/display_cubit.dart' as _i985;
import '../logic/cubit/edit_book_cover/edit_book_cover_cubit.dart' as _i1064;
import '../logic/cubit/edit_book_cubit.dart' as _i232;
import '../logic/cubit/epub_view/epub_view_cubit.dart' as _i724;
import '../logic/cubit/library/library_cubit.dart' as _i939;
import '../logic/cubit/selected_book_cubit.dart' as _i772;
import '../logic/cubit/trash/trash_bin_cubit.dart' as _i821;
import '../ui/test/cubit/test_cubit.dart' as _i650;
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
    gh.factory<_i800.StatsCalculator>(() => _i800.StatsCalculator());
    gh.factory<_i854.ChallengeBloc>(() => _i854.ChallengeBloc());
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
    gh.factory<_i774.ThemeBloc>(() => _i774.ThemeBloc());
    gh.factory<_i66.BookListsOrderCubit>(() => _i66.BookListsOrderCubit());
    gh.factory<_i744.BookTabIndexCubit>(() => _i744.BookTabIndexCubit());
    gh.factory<_i754.CurrentBookCubit>(() => _i754.CurrentBookCubit());
    gh.factory<_i185.DefaultBookFormatCubit>(
      () => _i185.DefaultBookFormatCubit(),
    );
    gh.factory<_i260.DefaultBookTagCubit>(() => _i260.DefaultBookTagCubit());
    gh.factory<_i985.DisplayCubit>(() => _i985.DisplayCubit());
    gh.factory<_i232.EditBookCubit>(() => _i232.EditBookCubit());
    gh.factory<_i772.SelectedBooksCubit>(() => _i772.SelectedBooksCubit());
    await gh.singletonAsync<_i497.Directory>(
      () => storageModule.documentsDir,
      preResolve: true,
    );
    gh.lazySingleton<_i786.ConnectivityService>(
      () => _i786.ConnectivityService(),
    );
    gh.lazySingleton<_i328.DatabaseService>(() => _i328.DatabaseService());
    gh.lazySingleton<_i120.Logger>(() => loggerModule.logger);
    gh.lazySingleton<_i528.PrettyDioLogger>(() => networkModule.logger);
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(gh<_i528.PrettyDioLogger>()),
    );
    gh.lazySingleton<_i798.NetworkFileDataSource>(
      () => _i643.NetworkFileDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.factory<_i780.StatsBloc>(
      () => _i780.StatsBloc(gh<_i800.StatsCalculator>()),
    );
    gh.lazySingleton<_i620.EpubFileLocalDataSource>(
      () => _i536.EpubFileLocalDataSourceImpl(gh<_i497.Directory>()),
    );
    gh.lazySingleton<_i92.GutendexRemoteDataSource>(
      () => _i92.GutendexRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i715.OlRemoteDataSource>(
      () => _i715.OlRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i308.HistoryObserver>(
      () => _i308.HistoryObserver(gh<_i974.Logger>()),
    );
    gh.lazySingleton<_i722.EpubReaderLocalDataSource>(
      () => _i722.EpubReaderLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i374.EpubCachedService>(
      () => _i374.EpubCachedService(
        gh<_i361.Dio>(),
        gh<_i974.Logger>(),
        gh<_i497.Directory>(),
      ),
    );
    gh.lazySingleton<_i880.BookResourceLocalDatasource>(
      () => _i612.BookResourceLocalDatasourceImpl(gh<_i328.DatabaseService>()),
    );
    gh.lazySingleton<_i844.GutendexRepository>(
      () => _i779.GutendexRepositoryImpl(
        gh<_i92.GutendexRemoteDataSource>(),
        gh<_i798.NetworkFileDataSource>(),
      ),
    );
    gh.lazySingleton<_i751.OpenLibRepository>(
      () => _i946.OpenLibRepositoryImpl(
        gh<_i715.OlRemoteDataSource>(),
        gh<_i798.NetworkFileDataSource>(),
      ),
    );
    gh.lazySingleton<_i625.OpenLibraryService>(
      () => _i625.OpenLibraryService(gh<_i361.Dio>(), gh<_i974.Logger>()),
    );
    gh.lazySingleton<_i925.EpubReaderRepository>(
      () => _i608.EpubBookRepositoryImpl(gh<_i722.EpubReaderLocalDataSource>()),
    );
    gh.factory<_i151.DownloadOlCoverUseCase>(
      () => _i151.DownloadOlCoverUseCase(gh<_i751.OpenLibRepository>()),
    );
    gh.factory<_i138.OlGetWorkUseCase>(
      () => _i138.OlGetWorkUseCase(gh<_i751.OpenLibRepository>()),
    );
    gh.factory<_i14.OpenLibSearchUseCase>(
      () => _i14.OpenLibSearchUseCase(gh<_i751.OpenLibRepository>()),
    );
    gh.lazySingleton<_i770.ReaderProgressLocalDatasource>(
      () =>
          _i1030.ReaderProgressLocalDatasourceImpl(gh<_i328.DatabaseService>()),
    );
    gh.lazySingleton<_i1042.BookResourceRepository>(
      () => _i722.BookResourceRepositoryImpl(
        gh<_i880.BookResourceLocalDatasource>(),
        gh<_i770.ReaderProgressLocalDatasource>(),
        gh<_i974.Logger>(),
      ),
    );
    gh.lazySingleton<_i446.GutendexService>(
      () => _i446.GutendexService(gh<_i974.Logger>(), gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1072.EpubFileRepository>(
      () => _i528.EpubFileRepositoryImpl(
        gh<_i620.EpubFileLocalDataSource>(),
        gh<_i798.NetworkFileDataSource>(),
      ),
    );
    gh.lazySingleton<_i758.BookLocalDataSource>(
      () => _i689.BookLocalDataSourceImpl(gh<_i328.DatabaseService>()),
    );
    gh.lazySingleton<_i615.SaveReaderProgressByPathUseCase>(
      () => _i615.SaveReaderProgressByPathUseCase(
        gh<_i1042.BookResourceRepository>(),
      ),
    );
    gh.factory<_i765.GetEpubUseCase>(
      () => _i765.GetEpubUseCase(gh<_i1072.EpubFileRepository>()),
    );
    gh.factory<_i1064.EditBookCoverCubit>(
      () => _i1064.EditBookCoverCubit(gh<_i151.DownloadOlCoverUseCase>()),
    );
    gh.lazySingleton<_i880.ParseEpubUseCase>(
      () => _i880.ParseEpubUseCase(gh<_i925.EpubReaderRepository>()),
    );
    gh.lazySingleton<_i911.OpenNetworkBookUseCase>(
      () => _i911.OpenNetworkBookUseCase(
        gh<_i1072.EpubFileRepository>(),
        gh<_i925.EpubReaderRepository>(),
      ),
    );
    gh.lazySingleton<_i29.BookRepository>(
      () => _i329.BookRepositoryImpl(
        gh<_i758.BookLocalDataSource>(),
        gh<_i974.Logger>(),
      ),
    );
    gh.factory<_i466.DownloadGtdCoverUseCase>(
      () => _i466.DownloadGtdCoverUseCase(gh<_i844.GutendexRepository>()),
    );
    gh.factory<_i433.GtdGetBookUseCase>(
      () => _i433.GtdGetBookUseCase(gh<_i844.GutendexRepository>()),
    );
    gh.factory<_i750.GtdGetBooksUseCase>(
      () => _i750.GtdGetBooksUseCase(gh<_i844.GutendexRepository>()),
    );
    gh.lazySingleton<_i650.TestCubit>(
      () => _i650.TestCubit(
        gh<_i880.ParseEpubUseCase>(),
        gh<_i120.Logger>(),
        gh<_i765.GetEpubUseCase>(),
        gh<_i615.SaveReaderProgressByPathUseCase>(),
      ),
    );
    gh.factory<_i909.BulkDeleteUseCase>(
      () => _i909.BulkDeleteUseCase(gh<_i29.BookRepository>()),
    );
    gh.factory<_i429.BulkUpdateUseCase>(
      () => _i429.BulkUpdateUseCase(gh<_i29.BookRepository>()),
    );
    gh.factory<_i565.DeleteBookUseCase>(
      () => _i565.DeleteBookUseCase(gh<_i29.BookRepository>()),
    );
    gh.factory<_i137.GetBookUseCase>(
      () => _i137.GetBookUseCase(gh<_i29.BookRepository>()),
    );
    gh.factory<_i679.GetDeletedBooksUseCase>(
      () => _i679.GetDeletedBooksUseCase(gh<_i29.BookRepository>()),
    );
    gh.factory<_i675.RestoreBookUseCase>(
      () => _i675.RestoreBookUseCase(gh<_i29.BookRepository>()),
    );
    gh.factory<_i755.SearchBooksUseCase>(
      () => _i755.SearchBooksUseCase(gh<_i29.BookRepository>()),
    );
    gh.factory<_i552.UpdateBookUseCase>(
      () => _i552.UpdateBookUseCase(gh<_i29.BookRepository>()),
    );
    gh.factory<_i864.WatchAllBooksUseCase>(
      () => _i864.WatchAllBooksUseCase(gh<_i29.BookRepository>()),
    );
    gh.factory<_i693.AddBookResourceUseCase>(
      () => _i693.AddBookResourceUseCase(gh<_i1042.BookResourceRepository>()),
    );
    gh.factory<_i336.CheckBookResourceExistsByHashUseCase>(
      () => _i336.CheckBookResourceExistsByHashUseCase(
        gh<_i1042.BookResourceRepository>(),
      ),
    );
    gh.factory<_i518.DeleteBookResourceUseCase>(
      () =>
          _i518.DeleteBookResourceUseCase(gh<_i1042.BookResourceRepository>()),
    );
    gh.factory<_i1012.GetBookResourceByUuidUseCase>(
      () => _i1012.GetBookResourceByUuidUseCase(
        gh<_i1042.BookResourceRepository>(),
      ),
    );
    gh.factory<_i452.GetBookResourcesUseCase>(
      () => _i452.GetBookResourcesUseCase(gh<_i1042.BookResourceRepository>()),
    );
    gh.factory<_i589.UpdateBookResourceFileUseCase>(
      () => _i589.UpdateBookResourceFileUseCase(
        gh<_i1042.BookResourceRepository>(),
      ),
    );
    gh.factory<_i389.ClearReaderProgressUseCase>(
      () =>
          _i389.ClearReaderProgressUseCase(gh<_i1042.BookResourceRepository>()),
    );
    gh.factory<_i860.SaveReaderProgress>(
      () => _i860.SaveReaderProgress(gh<_i1042.BookResourceRepository>()),
    );
    gh.factory<_i52.OpenLibSearchBloc>(
      () => _i52.OpenLibSearchBloc(
        gh<_i14.OpenLibSearchUseCase>(),
        gh<_i974.Logger>(),
      ),
    );
    gh.factory<_i23.BookDetailCubit>(
      () => _i23.BookDetailCubit(gh<_i137.GetBookUseCase>()),
    );
    gh.factory<_i660.AddBookUseCase>(
      () => _i660.AddBookUseCase(gh<_i29.BookRepository>()),
    );
    gh.factory<_i821.TrashBinCubit>(
      () => _i821.TrashBinCubit(
        gh<_i974.Logger>(),
        gh<_i679.GetDeletedBooksUseCase>(),
        gh<_i675.RestoreBookUseCase>(),
      ),
    );
    gh.factory<_i641.SearchGtdBloc>(
      () => _i641.SearchGtdBloc(gh<_i750.GtdGetBooksUseCase>()),
    );
    gh.factory<_i113.BookEditorActionCubit>(
      () => _i113.BookEditorActionCubit(
        gh<_i151.DownloadOlCoverUseCase>(),
        gh<_i138.OlGetWorkUseCase>(),
        gh<_i466.DownloadGtdCoverUseCase>(),
      ),
    );
    gh.factory<_i724.EpubViewCubit>(
      () => _i724.EpubViewCubit(
        gh<_i765.GetEpubUseCase>(),
        gh<_i1012.GetBookResourceByUuidUseCase>(),
        gh<_i860.SaveReaderProgress>(),
        gh<_i880.ParseEpubUseCase>(),
        gh<_i120.Logger>(),
      ),
    );
    gh.factory<_i607.BookActorCubit>(
      () => _i607.BookActorCubit(
        gh<_i660.AddBookUseCase>(),
        gh<_i552.UpdateBookUseCase>(),
        gh<_i565.DeleteBookUseCase>(),
        gh<_i429.BulkUpdateUseCase>(),
        gh<_i909.BulkDeleteUseCase>(),
        gh<_i693.AddBookResourceUseCase>(),
      ),
    );
    gh.factory<_i407.BookResourceCubit>(
      () => _i407.BookResourceCubit(
        gh<_i452.GetBookResourcesUseCase>(),
        gh<_i1072.EpubFileRepository>(),
        gh<_i589.UpdateBookResourceFileUseCase>(),
      ),
    );
    gh.factory<_i939.LibraryCubit>(
      () => _i939.LibraryCubit(
        gh<_i864.WatchAllBooksUseCase>(),
        gh<_i120.Logger>(),
      ),
    );
    gh.factory<_i365.LocalSearchBloc>(
      () => _i365.LocalSearchBloc(gh<_i755.SearchBooksUseCase>()),
    );
    return this;
  }
}

class _$StorageModule extends _i847.StorageModule {}

class _$LoggerModule extends _i454.LoggerModule {}

class _$NetworkModule extends _i881.NetworkModule {}
