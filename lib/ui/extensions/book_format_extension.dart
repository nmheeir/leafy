import 'package:easy_localization/easy_localization.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/generated/locale_keys.g.dart';

extension BookFormatX on BookFormat {
  String get text {
    switch (this) {
      case BookFormat.paperback:
        return LocaleKeys.book_format_paperback.tr();
      case BookFormat.hardcover:
        return LocaleKeys.book_format_hardcover.tr();
      case BookFormat.ebook:
        return LocaleKeys.book_format_ebook.tr();
      case BookFormat.audiobook:
        return LocaleKeys.book_format_audiobook.tr();
    }
  }
}
