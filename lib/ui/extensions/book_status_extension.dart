import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/generated/locale_keys.g.dart';

extension BookStatusX on BookStatus {
  IconData? get icon {
    switch (this) {
      case BookStatus.finished:
        return Icons.done;

      case BookStatus.inProgress:
        return Icons.autorenew;

      case BookStatus.forLater:
        return Icons.timelapse;

      case BookStatus.unfinished:
        return Icons.not_interested;
    }
  }

  String get text {
    switch (this) {
      case BookStatus.finished:
        return LocaleKeys.book_status_finished.tr();

      case BookStatus.inProgress:
        return LocaleKeys.book_status_in_progress.tr();

      case BookStatus.forLater:
        return LocaleKeys.book_status_for_later.tr();

      case BookStatus.unfinished:
        return LocaleKeys.book_status_unfinished.tr();
    }
  }

  String get changeStatus {
    switch (this) {
      case BookStatus.finished:
        return '';

      case BookStatus.inProgress:
        return LocaleKeys.finish_reading.tr();

      case BookStatus.forLater:
        return LocaleKeys.start_reading.tr();

      case BookStatus.unfinished:
        return LocaleKeys.start_reading.tr();
    }
  }
}
