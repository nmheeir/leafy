enum GtdSortType {
  popular,
  ascending,
  descending;

  String get value {
    switch (this) {
      case GtdSortType.popular:
        return 'popular';
      case GtdSortType.ascending:
        return 'ascending';
      case GtdSortType.descending:
        return 'descending';
    }
  }
}
