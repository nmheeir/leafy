import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/main.dart';

class EditBookCoverCubit extends Cubit<Uint8List?> {
  EditBookCoverCubit() : super(null);

  void setCover(Uint8List? cover) {
    imageCache.clear();

    emit(cover);
  }

  Future<void> deleteCover(int? bookID) async {
    if (bookID == null) return;

    emit(null);

    final coverExists = await File(
      '${appDocumentsDirectory.path}/$bookID.jpg',
    ).exists();

    if (coverExists) {
      await File('${appDocumentsDirectory.path}/$bookID.jpg').delete();
    }
  }
}
