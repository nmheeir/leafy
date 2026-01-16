import 'package:flutter/material.dart';
import 'package:leafy/ui/settings/epub_reader/reader/font/font_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/image/image_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/misc/misc_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/padding/padding_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/progress/progress_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/reading_mode/reading_mode_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/reading_speed/reading_speed_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/system/system_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/text/text_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/translator/translator_subcategory.dart';

class ReaderTab extends StatelessWidget {
  const ReaderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: const [
          ReadingModeSubcategory(),
          Divider(height: 32),
          FontSubcategory(),
          Divider(height: 32),
          TextSubcategory(),
          Divider(height: 32),
          PaddingSubcategory(),
          Divider(height: 32),
          SystemSubcategory(),
          Divider(height: 32),
          ImageSubcategory(),
          Divider(height: 32),
          TranslatorSubcategory(),
          Divider(height: 32),
          ReadingSpeedSubcategory(),
          Divider(height: 32),
          ProgressSubcategory(),
          Divider(height: 32),
          MiscSubcategory(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
