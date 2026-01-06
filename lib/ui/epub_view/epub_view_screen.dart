import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_epub_viewer/flutter_epub_viewer.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/core/utils/helpers/reading_touching_handler.dart';
import 'package:leafy/di/injection.dart';
import 'package:leafy/logic/cubit/epub_view/epub_view_cubit.dart';
import 'package:leafy/ui/epub_view/widgets/chapter_drawer.dart';

class EpubViewScreen extends StatelessWidget {
  final String epubUrl;

  const EpubViewScreen({
    super.key,
    this.epubUrl = 'https://www.gutenberg.org/ebooks/84.epub3.images',
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Inject Cubit và gọi hàm load ngay khi khởi tạo
      create: (context) => getIt<EpubViewCubit>()..loadEpub(epubUrl),
      child: const _EpubViewContent(),
    );
  }
}

class _EpubViewContent extends StatefulWidget {
  const _EpubViewContent();

  @override
  State<_EpubViewContent> createState() => _EpubViewContentState();
}

class _EpubViewContentState extends State<_EpubViewContent> {
  final _epubController = EpubController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _readingProgressNotifier = ValueNotifier<double>(0.0);

  late final EpubDisplaySettings _epubDisplaySettings;
  late final ReadingTouchHandler _touchHandler;

  @override
  void initState() {
    super.initState();
    _epubDisplaySettings = EpubDisplaySettings(
      spread: EpubSpread.always,
      flow: EpubFlow.scrolled,
      useSnapAnimationAndroid: false,
      snap: true,
      theme: EpubTheme.light(),
      allowScriptedContent: true,
    );

    _touchHandler = ReadingTouchHandler(centerZoneScale: 0.5);
  }

  @override
  void dispose() {
    _readingProgressNotifier.dispose();
    // _epubController thường không cần dispose thủ công nếu thư viện không yêu cầu,
    // nhưng nếu cần thì gọi ở đây.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpubViewCubit, EpubViewState>(
      builder: (context, state) {
        return state.map(
          initial: (value) {
            return const SizedBox.shrink();
          },
          loading: (value) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: context.colorScheme.primaryContainer,
                    value: value.progress > 0 ? value.progress : null,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Đang tải sách: ${(value.progress * 100).toStringAsFixed(0)}%',
                  ),
                ],
              ),
            ),
          ),

          // 2. Trạng thái Error
          error: (value) => Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Lỗi: ${value.message}'),
              ),
            ),
          ),

          loaded: (value) => _buildEpubViewer(context, value.file),
        );
      },
    );
  }

  Widget _buildEpubViewer(BuildContext context, File file) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Title'),
        actions: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ],
      ),
      drawer: ChapterDrawer(controller: _epubController),
      body: Stack(
        children: [
          Column(
            children: [
              ValueListenableBuilder<double>(
                valueListenable: _readingProgressNotifier,
                builder: (context, value, child) {
                  return LinearProgressIndicator(
                    value: value,
                    backgroundColor: Colors.transparent,
                    color: context.colorScheme.inversePrimary,
                  );
                },
              ),
              Expanded(
                child: EpubViewer(
                  epubController: _epubController,
                  epubSource: EpubSource.fromFile(file),
                  displaySettings: _epubDisplaySettings,
                  onRelocated: (value) {
                    _readingProgressNotifier.value = value.progress;
                  },
                  onTouchDown: (x, y) {
                    debugPrint('on touch down');
                    final shouldOpenMenu = _touchHandler.shouldToggleMenu(
                      x: x,
                      y: y,
                      scaffoldKey: _scaffoldKey,
                    );

                    debugPrint('shouldOpenMenu: $shouldOpenMenu');
                    if (shouldOpenMenu) {
                      // Logic toggle menu (hiện tại đang comment trong code gốc)
                    }
                  },
                ),
              ),
            ],
          ),

          IgnorePointer(
            ignoring: true,
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.primaryContainer.withValues(
                      alpha: 0.2,
                    ),
                    border: Border.all(
                      color: context.colorScheme.primaryContainer.withValues(
                        alpha: 0.5,
                      ),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Touch Zone (50% Area)",
                      style: TextStyle(
                        color: context.colorScheme.primaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
