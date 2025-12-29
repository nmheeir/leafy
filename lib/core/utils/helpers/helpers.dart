import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/main.dart';

Future<CroppedFile?> cropImage(BuildContext context, Uint8List cover) async {
  final colorScheme = Theme.of(context).colorScheme;

  //write temporary file as ImageCropper requires a file
  final tmpCoverTimestamp = DateTime.now().millisecondsSinceEpoch;
  final tmpCoverFile = File('${appTempDirectory.path}/$tmpCoverTimestamp.jpg');
  await tmpCoverFile.writeAsBytes(cover);

  return await ImageCropper().cropImage(
    maxWidth: 1024,
    maxHeight: 1024,
    sourcePath: tmpCoverFile.path,
    compressQuality: 90,
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: LocaleKeys.edit_cover.tr(),
        toolbarColor: Colors.black,
        statusBarLight: true,
        toolbarWidgetColor: Colors.white,
        backgroundColor: colorScheme.surface,
        cropGridColor: Colors.black87,
        activeControlsWidgetColor: colorScheme.primary,
        cropFrameColor: Colors.black87,
        lockAspectRatio: false,
        hideBottomControls: false,
      ),
      IOSUiSettings(
        title: LocaleKeys.edit_cover.tr(),
        cancelButtonTitle: LocaleKeys.cancel.tr(),
        doneButtonTitle: LocaleKeys.save.tr(),
        rotateButtonsHidden: false,
        rotateClockwiseButtonHidden: true,
        aspectRatioPickerButtonHidden: false,
        aspectRatioLockDimensionSwapEnabled: false,
      ),
    ],
  );
}
