import 'package:equatable/equatable.dart';

class GetFrequentlyTaggedTogetherParams extends Equatable {
  final int tagId;
  final int limit;

  const GetFrequentlyTaggedTogetherParams({
    required this.tagId,
    this.limit = 5,
  });

  @override
  List<Object?> get props => [tagId, limit];
}
