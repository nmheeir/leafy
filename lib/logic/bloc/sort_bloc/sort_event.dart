import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:equatable/equatable.dart';
import 'package:leafy/core/constants/enums/index.dart';

abstract class SortEvent extends Equatable {
  const SortEvent();
}

class ChangeSortTypeEvent extends SortEvent {
  final SortType sortType;

  const ChangeSortTypeEvent(this.sortType);

  @override
  List<Object?> get props => [sortType];
}

class ToggleOrderEvent extends SortEvent {
  const ToggleOrderEvent();

  @override
  List<Object?> get props => [];
}

class ChangeOnlyFavouriteEvent extends SortEvent {
  final bool onlyFavourite;

  const ChangeOnlyFavouriteEvent(this.onlyFavourite);

  @override
  List<Object?> get props => [];
}

class ChangeBookTypeEvent extends SortEvent {
  final BookFormat? bookType;

  const ChangeBookTypeEvent(this.bookType);

  @override
  List<Object?> get props => [bookType];
}

class ChangeYearsEvent extends SortEvent {
  final String? years;

  const ChangeYearsEvent(this.years);

  @override
  List<Object?> get props => [years];
}

class FilterByTagsChanged extends SortEvent {
  final List<Tag> tags;
  final TagFilterMode mode;

  const FilterByTagsChanged({required this.tags, required this.mode});

  @override
  List<Object?> get props => [tags, mode];
}
