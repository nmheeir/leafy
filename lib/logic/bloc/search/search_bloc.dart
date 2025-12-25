import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/domain/entities/ol_search_result_doc.dart';
import 'package:leafy/domain/usecases/open_lib_usecases/open_lib_search.dart';
import 'package:leafy/domain/usecases/open_lib_usecases/open_lib_search_params.dart';
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
    _logger.i('[SearchBloc] TypeChanged: ${state.searchType} → ${event.type}');

    _logger.d(
      '[SearchBloc] Save cache for ${state.searchType} | '
      'books=${state.books.length}, page=${state.page}',
    );
    // 1. LƯU DỮ LIỆU CŨ VÀO CACHE
    // Tạo object data từ state hiện tại
    final dataToSave = SearchTabData(
      books: state.books,
      page: state.page,
      hasReachedMax: state.hasReachedMax,
      numberOfResults: state.numberOfResults,
      queryAtMoment: state.currentQuery, // Lưu từ khoá lúc tìm ra kết quả này
    );

    // Cập nhật map cache: Giữ cache cũ và thêm/đè data của type hiện tại
    final updatedCache = Map<OLSearchType, SearchTabData>.from(state.cache);
    updatedCache[state.searchType] = dataToSave;

    // 2. CHUẨN BỊ DỮ LIỆU CHO TYPE MỚI
    final newType = event.type;
    final cachedData = updatedCache[newType]; // Lấy dữ liệu từ cache (nếu có)

    // Kiểm tra xem cache có dùng được không?
    // Cache dùng được khi: có tồn tại VÀ từ khoá tìm kiếm không đổi (nếu UI dùng chung 1 ô search)
    // Nếu bạn muốn mỗi tab 1 từ khoá riêng biệt thì bỏ check state.currentQuery
    bool useCache = cachedData != null;

    if (useCache) {
      _logger.i(
        '[SearchBloc] Restore cache for $newType | '
        'books=${cachedData.books.length}, page=${cachedData.page}',
      );
    } else {
      _logger.i('[SearchBloc] No cache for $newType → trigger new search');
    }

    // Nếu dùng cache thì lấy data cũ, nếu không thì reset về initial
    emit(
      state.copyWith(
        searchType: newType,
        cache: updatedCache, // Cập nhật cache mới vào state
        // Restore hoặc Reset
        books: useCache ? cachedData.books : [],
        page: useCache ? cachedData.page : 0,
        hasReachedMax: useCache ? cachedData.hasReachedMax : false,
        numberOfResults: useCache ? cachedData.numberOfResults : 0,
        // Nếu có cache -> Success (để hiện list), nếu không -> Initial (để hiện empty hoặc loading)
        status: useCache && cachedData.books.isNotEmpty
            ? SearchStatus.success
            : SearchStatus.initial,

        // Tuỳ chọn logic Query:
        // Nếu bạn muốn giữ query cũ khi switch tab thì giữ nguyên dòng này.
        // Nếu query đổi thì bạn phải gọi event QueryChanged ở dưới.
      ),
    );

    // LOGIC KÍCH HOẠT TÌM KIẾM LẠI (Nếu chưa có trong cache)
    // Nếu không có cache, VÀ đang có chữ trong ô search -> Gọi tìm kiếm mới
    if (!useCache && state.currentQuery.isNotEmpty) {
      add(SearchEvent.queryChanged(state.currentQuery));
    }
  }

  Future<void> _onQueryChanged(
    _QueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      _logger.i('[SearchBloc] Query cleared → reset state');
      emit(state.copyWith(status: SearchStatus.initial, books: []));
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
