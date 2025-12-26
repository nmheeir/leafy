import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/domain/open_lib/entities/ol_search_result_doc.dart';
import 'package:leafy/domain/open_lib/usecases/open_lib_search.dart';
import 'package:leafy/domain/open_lib/usecases/open_lib_search_params.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final OpenLibSearchUseCase _openLibSearchUseCase;
  final Logger _logger;
  static const int _pageSize = 20;

  SearchBloc(this._openLibSearchUseCase, this._logger)
    : super(const SearchState()) {
    on<_TypeChanged>(_onTypeChanged);

    on<_QueryChanged>(
      _onQueryChanged,
      transformer: _debounce(const Duration(milliseconds: 500)),
    );

    on<_LoadMore>(
      _onLoadMore,
      transformer: _debounce(const Duration(milliseconds: 300)),
    );
  }

  EventTransformer<T> _debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  void _onTypeChanged(_TypeChanged event, Emitter<SearchState> emit) {
    _logger.d('[SearchBloc] _onTypeChanged event: ${event.type}');

    // 1. LƯU DỮ LIỆU TAB CŨ VÀO CACHE
    // Tạo snapshot dữ liệu hiện tại
    // Lưu ý: Tính toán hasNoResults cho tab hiện tại trước khi lưu
    // Nếu books rỗng VÀ status là success -> nghĩa là không tìm thấy kết quả
    final bool currentTabHasNoResults =
        state.books.isEmpty && state.status == SearchStatus.success;

    final dataToSave = SearchTabData(
      books: state.books,
      page: state.page,
      hasReachedMax: state.hasReachedMax,
      numberOfResults: state.numberOfResults,
      hasNoResults: currentTabHasNoResults,
    );
    _logger.d(
      '[SearchBloc] Caching old tab data for type ${state.searchType}: '
      'books_count=${dataToSave.books.length}, page=${dataToSave.page}, '
      'hasReachedMax=${dataToSave.hasReachedMax}, '
      'numberOfResults=${dataToSave.numberOfResults}',
    );

    // Copy cache cũ và cập nhật dữ liệu mới cho searchType hiện tại
    final updatedCache = Map<OLSearchType, SearchTabData>.from(state.cache);
    updatedCache[state.searchType] = dataToSave;
    _logger.d(
      '[SearchBloc] Cache updated. Current cache keys: ${updatedCache.keys}',
    );

    // 2. CHUẨN BỊ CHUYỂN SANG TAB MỚI
    final newType = event.type;
    final cachedData = updatedCache[newType];
    final currentQuery = state.currentQuery;
    _logger.d(
      '[SearchBloc] Switching to new type: $newType. '
      'Current query: "$currentQuery"',
    );

    // Kiểm tra xem có cache hợp lệ không (Có cache và có dữ liệu sách)
    // Cache hợp lệ khi:
    // 1. Dữ liệu không null
    // 2. VÀ (Có sách HOẶC Đã xác nhận không có sách từ lần tìm trước)
    final bool hasValidCache =
        cachedData != null &&
        (cachedData.books.isNotEmpty || cachedData.hasNoResults);
    _logger.d('[SearchBloc] Has valid cache for $newType: $hasValidCache');

    if (hasValidCache) {
      // TRƯỜNG HỢP A: ĐÃ CÓ CACHE -> HIỂN THỊ NGAY (SUCCESS)
      // Không cần load lại, show list ngay lập tức
      _logger.d(
        '[SearchBloc] Using cached data for $newType: '
        'books_count=${cachedData.books.length}, page=${cachedData.page}, '
        'hasReachedMax=${cachedData.hasReachedMax}, '
        'numberOfResults=${cachedData.numberOfResults}',
      );
      emit(
        state.copyWith(
          searchType: newType,
          cache: updatedCache,
          books: cachedData.books,
          page: cachedData.page,
          hasReachedMax: cachedData.hasReachedMax,
          numberOfResults: cachedData.numberOfResults,
          status: SearchStatus.success,
        ),
      );
      _logger.d(
        '[SearchBloc] Emitted state with SearchStatus.success (from cache)',
      );
    } else {
      // TRƯỜNG HỢP B: CHƯA CÓ CACHE
      _logger.d('[SearchBloc] No valid cache found for $newType.');

      if (currentQuery.isNotEmpty) {
        // B1: Có từ khoá -> Show LOADING ngay lập tức (Theo yêu cầu của bạn)
        // Việc này giúp UI hiện vòng xoay thay vì màn hình trắng trong lúc chờ debounce
        _logger.d(
          '[SearchBloc] Current query is not empty, '
          'emitting SearchStatus.loading for new type $newType.',
        );
        emit(
          state.copyWith(
            searchType: newType,
            cache: updatedCache,
            books: [],
            page: 0,
            numberOfResults: 0,
            hasReachedMax: false,
            status: SearchStatus.loading,
          ),
        );

        // Kích hoạt tìm kiếm dữ liệu mới
        _logger.d(
          '[SearchBloc] Adding QueryChanged event for query: "$currentQuery"',
        );
        add(SearchEvent.queryChanged(currentQuery));
      } else {
        // B2: Không có từ khoá -> Về Initial
        _logger.d(
          '[SearchBloc] Current query is empty, '
          'emitting SearchStatus.initial for new type $newType.',
        );
        emit(
          state.copyWith(
            searchType: newType,
            cache: updatedCache,

            books: [],
            page: 0,
            numberOfResults: 0,
            hasReachedMax: false,
            status: SearchStatus.initial,
          ),
        );
        _logger.d(
          '[SearchBloc] Emitted state with SearchStatus.initial (no query)',
        );
      }
    }
  }

  Future<void> _onQueryChanged(
    _QueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      _logger.i('[SearchBloc] Query cleared → reset state');
      emit(
        state.copyWith(
          status: SearchStatus.initial,
          books: [],
          currentQuery: '',
        ),
      );
      return;
    }

    _logger.i(
      '[SearchBloc] Search start | '
      'query="${event.query}", type=${state.searchType}',
    );

    emit(
      state.copyWith(
        status: SearchStatus.loading,
        page: 0,
        books: [],
        currentQuery: event.query,
      ),
    );

    final nextPage = state.page + 1;
    final offset = (nextPage - 1) * _pageSize;

    _logger.d(
      '[SearchBloc] Call API | '
      'offset=$offset, limit=$_pageSize',
    );

    final result = await _openLibSearchUseCase(
      OpenLibSearchParams(
        query: event.query,
        offset: offset,
        limit: _pageSize,
        searchType: state.searchType,
      ),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: SearchStatus.failure,
          // TODO: Fix
          errorMessage: failure.toString(),
        ),
      ),
      (data) {
        // Tính toán hasNoResults
        final bool isNoResults = data.docs.isEmpty;

        // Update state hiển thị
        var newState = state.copyWith(
          status: SearchStatus.success,
          books: data.docs,
          hasReachedMax: data.docs.length < _pageSize,
          page: 1,
        );

        // Update luôn vào cache để đồng bộ
        final currentData = SearchTabData(
          books: newState.books,
          page: newState.page,
          hasReachedMax: newState.hasReachedMax,
          queryAtMoment: newState.currentQuery,
          numberOfResults: data.numFound ?? 0,
          hasNoResults: isNoResults,
        );
        final newCache = Map<OLSearchType, SearchTabData>.from(state.cache);
        newCache[state.searchType] = currentData;

        emit(newState.copyWith(cache: newCache));
      },
    );
  }

  Future<void> _onLoadMore(_LoadMore event, Emitter<SearchState> emit) async {
    if (state.hasReachedMax || state.status == SearchStatus.loading) return;

    // Không emit Loading để tránh UI giật, user chỉ thấy list dài ra

    final nextPage = state.page + 1;
    final offset = (nextPage - 1) * _pageSize;

    final result = await _openLibSearchUseCase(
      OpenLibSearchParams(
        query: state.currentQuery,
        offset: offset,
        limit: _pageSize,
        searchType: state.searchType,
      ),
    );

    result.fold(
      (failure) => {}, // Load more lỗi thì có thể show snackbar hoặc ignore
      (data) => emit(
        state.copyWith(
          // Nối list cũ + list mới
          books: List.of(state.books)..addAll(data.docs),
          hasReachedMax: data.docs.length < _pageSize,
          page: nextPage,
        ),
      ),
    );
  }
}
