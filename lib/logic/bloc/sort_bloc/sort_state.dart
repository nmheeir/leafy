import 'package:equatable/equatable.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/domain/tag/entities/tag.dart';

class SortState extends Equatable {
  const SortState({
    required this.sortType,
    required this.isAsc,
    required this.onlyFavorite,
    this.years,
    this.selectedTags = const [],
    this.filterMode = TagFilterMode.any,
    this.filteredBookIds,
    this.bookType,
  });

  final SortType sortType;
  final bool isAsc;
  final bool onlyFavorite;
  final String? years;
  final List<Tag> selectedTags;
  final TagFilterMode filterMode;
  final Set<int>? filteredBookIds;
  final BookFormat? bookType;

  SortState copyWith({
    SortType? sortType,
    bool? isAsc,
    bool? onlyFavourite,
    String? years,
    bool resetYears = false,
    List<Tag>? selectedTags,
    TagFilterMode? filterMode,
    Set<int>? filteredBookIds,
    bool resetFilteredBookIds = false,
    BookFormat? bookType,
    bool resetBookType = false,
  }) {
    return SortState(
      sortType: sortType ?? this.sortType,
      isAsc: isAsc ?? this.isAsc,
      onlyFavorite: onlyFavourite ?? onlyFavorite,
      years: resetYears ? null : years ?? this.years,
      selectedTags: selectedTags ?? this.selectedTags,
      filterMode: filterMode ?? this.filterMode,
      filteredBookIds: resetFilteredBookIds
          ? null
          : filteredBookIds ?? this.filteredBookIds,
      bookType: resetBookType ? null : bookType ?? this.bookType,
    );
  }

  // NOTE: JSON serialization for Tags is complex because we need full Tag objects.
  // For simplicity, we might skip persisting complex tag filters or implement simple persistence later.
  // For now, let's keep basic persistence but reset tags on reload to avoid sync isues.
  factory SortState.fromJson(Map<String, dynamic> json) {
    final sortTypeInt = json['sort_type'] as int? ?? SortType.byTitle.index;

    final isAsc = json['sort_order'] as bool? ?? true;
    final onlyFavourite = json['only_favourite'] as bool? ?? false;
    final years = json['years'] as String?;
    final bookType = json['filter_book_type'] as String?;

    final sortType = sortTypeInt < SortType.values.length
        ? SortType.values[sortTypeInt]
        : SortType.byTitle;

    return SortState(
      sortType: sortType,
      isAsc: isAsc,
      onlyFavorite: onlyFavourite,
      years: years,
      selectedTags: const [], // Reset tags on restart
      filterMode: TagFilterMode.any,
      filteredBookIds: null, // Reset filtered IDs on restart
      bookType: bookType == null ? null : BookFormat.values.byName(bookType),
    );
  }

  Map<String, dynamic>? toJson() {
    return {
      'sort_type': sortType.index,
      'sort_order': isAsc,
      'only_favourite': onlyFavorite,
      'years': years,
      // 'selected_tags': ... // Skip persisting tags for now
      'filter_book_type': bookType?.name,
    };
  }

  @override
  List<Object?> get props => [
    sortType,
    isAsc,
    onlyFavorite,
    years,
    selectedTags,
    filterMode,
    filteredBookIds,
    bookType,
  ];
}
