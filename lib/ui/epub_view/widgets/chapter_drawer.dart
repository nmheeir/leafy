import 'package:flutter/material.dart';
import 'package:flutter_epub_viewer/flutter_epub_viewer.dart';

class ChapterDrawer extends StatefulWidget {
  const ChapterDrawer({super.key, required this.controller});

  final EpubController controller;

  @override
  State<ChapterDrawer> createState() => _ChapterDrawerState();
}

class _ChapterDrawerState extends State<ChapterDrawer> {
  List<EpubChapter> chapters = [];

  @override
  void initState() {
    super.initState();
    if (!mounted) return;
    setState(() {
      chapters = widget.controller.getChapters();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Chapter Drawer build');
    return Drawer(
      child: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(chapters[index].title),
            onTap: () async {
              debugPrint('Chapter CFI: ${chapters[index].href}');
              await Future.delayed(const Duration(milliseconds: 300));
              widget.controller.display(cfi: chapters[index].href);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
