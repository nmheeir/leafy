import 'package:equatable/equatable.dart';

class MergeTagsParams extends Equatable {
  final int sourceTagId;
  final int targetTagId;

  const MergeTagsParams({required this.sourceTagId, required this.targetTagId});

  @override
  List<Object?> get props => [sourceTagId, targetTagId];
}
