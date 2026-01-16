import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

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
    final height = MediaQuery.of(context).size.height * 0.45;

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
    return const Center(child: Text("General Settings (Coming soon)"));
  }
}

class _ReaderTab extends StatelessWidget {
  const _ReaderTab();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Reader Settings (Coming soon)"));
  }
}

class _ColorTab extends StatelessWidget {
  const _ColorTab();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Color Settings (Coming soon)"));
  }
}
