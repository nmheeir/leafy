import 'package:flutter/material.dart';
import 'package:flutter_epub_viewer/flutter_epub_viewer.dart';

class EpubViewScreen extends StatefulWidget {
  const EpubViewScreen({super.key});

  @override
  State<EpubViewScreen> createState() => _EpubViewScreenState();
}

class _EpubViewScreenState extends State<EpubViewScreen> {
  final epubController = EpubController();

  var textSelectionCfi = '';

  bool isLoading = true;

  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ChapterDrawer(controller: epubController),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Title'),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: SafeArea(
        child: Column(
          children: [
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.transparent,
            ),
            Expanded(
              child: Stack(
                children: [
                  EpubViewer(
                    // initialCfi: 'epubcfi(/6/20!/4/2[introduction]/2[c1_h]/1:0)',
                    epubSource: EpubSource.fromUrl(
                      'https://www.gutenberg.org/ebooks/1524.epub3.images',
                    ),
                    epubController: epubController,
                    displaySettings: EpubDisplaySettings(
                      spread: EpubSpread.always,
                      flow: EpubFlow.scrolled,
                      useSnapAnimationAndroid: false,
                      snap: true,
                      theme: EpubTheme.light(),
                      allowScriptedContent: true,
                    ),
                    selectionContextMenu: ContextMenu(
                      menuItems: [
                        ContextMenuItem(
                          title: "Highlight",
                          id: 1,
                          action: () async {
                            epubController.addHighlight(cfi: textSelectionCfi);
                            debugPrint(
                              'DEBUG: ContextMenu: Highlight action triggered for CFI: $textSelectionCfi',
                            );
                          },
                        ),
                      ],
                      settings: ContextMenuSettings(
                        hideDefaultSystemContextMenuItems: true,
                      ),
                    ),
                    onChaptersLoaded: (chapters) {
                      setState(() {
                        isLoading = false;
                      });
                      debugPrint(
                        'DEBUG: onChaptersLoaded: ${chapters.length} chapters loaded. isLoading set to false.',
                      );
                    },
                    onEpubLoaded: () async {
                      debugPrint(
                        'DEBUG: onEpubLoaded: Epub has been successfully loaded.',
                      );
                    },
                    onRelocated: (value) {
                      debugPrint(
                        "DEBUG: onRelocated: Relocated to ${value.toJson()} with progress: ${value.progress}",
                      );
                      setState(() {
                        progress = value.progress;
                      });
                    },
                    onAnnotationClicked: (cfi, data) {
                      debugPrint(
                        "DEBUG: onAnnotationClicked: Annotation clicked at CFI: $cfi with data: $data",
                      );
                    },
                    onTextSelected: (epubTextSelection) {
                      textSelectionCfi = epubTextSelection.selectionCfi;
                      debugPrint(
                        "DEBUG: onTextSelected: Text selected: '${epubTextSelection.selectedText}' at CFI: $textSelectionCfi",
                      );
                    },
                    onLocationLoaded: () {
                      debugPrint(
                        'DEBUG: onLocationLoaded: Epub location data has been loaded. Progress is now available.',
                      );
                    },
                    onSelection: (selectedText, cfiRange, selectionRect, viewRect) {
                      debugPrint(
                        "DEBUG: onSelection: Selection changed. Selected text: '$selectedText', CFI range: '$cfiRange', Selection Rect: $selectionRect, View Rect: $viewRect",
                      );
                    },
                    onDeselection: () {
                      debugPrint(
                        "DEBUG: onDeselection: Text selection has been deselected.",
                      );
                    },
                    onSelectionChanging: () {
                      debugPrint(
                        "DEBUG: onSelectionChanging: User is actively changing text selection.",
                      );
                    },
                    onTouchDown: (x, y) {
                      debugPrint(
                        "DEBUG: onTouchDown: Touch down event at X: $x, Y: $y",
                      );
                    },
                    onTouchUp: (x, y) {
                      debugPrint(
                        "DEBUG: onTouchUp: Touch up event at X: $x, Y: $y",
                      );
                    },
                    selectAnnotationRange: true,
                  ),

                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: IconButton(
                      onPressed: () {
                        epubController.next();
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  Visibility(
                    visible: isLoading,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChapterDrawer extends StatefulWidget {
  const ChapterDrawer({super.key, required this.controller});

  final EpubController controller;

  @override
  State<ChapterDrawer> createState() => _ChapterDrawerState();
}

class _ChapterDrawerState extends State<ChapterDrawer> {
  late List<EpubChapter> chapters;

  @override
  void initState() {
    chapters = widget.controller.getChapters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(chapters[index].title),
            onTap: () {
              widget.controller.display(cfi: chapters[index].href);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
