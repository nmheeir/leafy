import 'package:leafy/core/constants/enums/index.dart';

class OpenLibSearchParams {
  final String query;
  final int offset;
  final int limit;
  final OLSearchType searchType;

  const OpenLibSearchParams({
    required this.query,
    required this.offset,
    required this.limit,
    required this.searchType,
  });
}
