import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/ui/settings/epub_reader/appearance/colors/color_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/chapters/chapters_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/typography/typography_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/image/image_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/misc/misc_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/layout/layout_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/progress/progress_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/reading_mode/reading_mode_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/reading_speed/reading_speed_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/system/system_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/text/text_subcategory.dart';
import 'package:leafy/ui/settings/epub_reader/reader/translator/translator_subcategory.dart';

class EpubReaderSettingsSheet extends StatefulWidget {
  const EpubReaderSettingsSheet({super.key});

  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const EpubReaderSettingsSheet(),
    );
  }

  @override
  State<EpubReaderSettingsSheet> createState() =>
      _EpubReaderSettingsSheetState();
}

class _EpubReaderSettingsSheetState extends State<EpubReaderSettingsSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Height ~ 45% screen
    final height = MediaQuery.of(context).size.height * 0.7;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Drag handle
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.colorScheme.onSurfaceVariant.withValues(
                  alpha: 0.4,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Tabs
          TabBar(
            controller: _tabController,
            labelColor: context.colorScheme.primary,
            unselectedLabelColor: context.colorScheme.onSurfaceVariant,
            indicatorColor: context.colorScheme.primary,
            dividerColor: context.colorScheme.outlineVariant.withValues(
              alpha: 0.5,
            ),
            tabs: const [
              Tab(text: "General"),
              Tab(text: "Reader"),
              Tab(text: "Color"),
            ],
          ),
          // Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [_GeneralTab(), _ReaderTab(), _ColorTab()],
            ),
          ),
        ],
      ),
    );
  }
}

class _GeneralTab extends StatelessWidget {
  const _GeneralTab();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          ReadingModeSubcategory(),
          Divider(height: 32),
          LayoutSubcategory(),
          Divider(height: 32),
          SystemSubcategory(),
          Divider(height: 32),
          ReadingSpeedSubcategory(),
          Divider(height: 32),
          MiscSubcategory(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _ReaderTab extends StatelessWidget {
  const _ReaderTab();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          TypographySubcategory(),
          Divider(height: 32),
          TextSubcategory(),
          Divider(height: 32),
          ImageSubcategory(),
          Divider(height: 32),
          ChaptersSubcategory(),
          Divider(height: 32),
          ProgressSubcategory(),
          Divider(height: 32),
          TranslatorSubcategory(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _ColorTab extends StatelessWidget {
  const _ColorTab();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      physics: const BouncingScrollPhysics(),
      child: const ColorSubcategory(),
    );
  }
}
