import 'package:equatable/equatable.dart';

class CheckBookResourceExistsByHashParams extends Equatable {
  final String fileHash;

  const CheckBookResourceExistsByHashParams({required this.fileHash});

  @override
  List<Object> get props => [fileHash];
}
