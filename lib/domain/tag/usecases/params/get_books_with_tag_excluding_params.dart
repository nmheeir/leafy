import 'package:equatable/equatable.dart';

class GetBooksWithTagExcludingParams extends Equatable {
  final int includeTagId;
  final int excludeTagId;

  const GetBooksWithTagExcludingParams({
    required this.includeTagId,
    required this.excludeTagId,
  });

  @override
  List<Object?> get props => [includeTagId, excludeTagId];
}
