import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_epub_viewer/flutter_epub_viewer.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/core/utils/helpers/reading_touching_handler.dart';
import 'package:leafy/domain/services/epub_cached_service.dart';
import 'package:leafy/ui/epub_view/widgets/chapter_drawer.dart';

class EpubViewScreen extends StatefulWidget {
  final String epubUrl;
  const EpubViewScreen({
    super.key,
    this.epubUrl = 'https://www.gutenberg.org/ebooks/84.epub3.images',
  });

  @override
  State<EpubViewScreen> createState() => _EpubViewScreenState();
}

class _EpubViewScreenState extends State<EpubViewScreen> {
  final epubController = EpubController();

  late EpubDisplaySettings _epubDisplaySettings;

  final EpubCachedService _service = EpubCachedService();
  CancelToken? _cancelToken;
  double _downloadProgress = 0.0;
  bool _isLoading = true;
  File? _epubFile;
  String? _error;

  final ValueNotifier<double> _readingProgressNotifier = ValueNotifier(0.0);

  final ReadingTouchHandler _touchHandler = ReadingTouchHandler(
    centerZoneScale: 0.5,
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
    _downloadAndOpen();
  }

  Future<void> _downloadAndOpen() async {
    _cancelToken = CancelToken();
    try {
      final file = await _service.getEpub(
        url: widget.epubUrl,
        cancelToken: _cancelToken,
        onProgress: (progress) {
          if (mounted) {
            setState(() {
              _downloadProgress = progress;
            });
          }
        },
      );
      if (mounted) {
        setState(() {
          _epubFile = file;
          _isLoading = false;
        });
      }
    } catch (e) {
      print(e);
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _cancelToken?.cancel();
    _readingProgressNotifier.dispose();
    debugPrint('Progress: ${_readingProgressNotifier.value}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Epub View Screen build');
    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value: _downloadProgress),
              SizedBox(height: 10),
              Text(
                'Đang tải sách: ${(_downloadProgress * 100).toStringAsFixed(0)}%',
              ),
            ],
          ),
        ),
      );
    }

    if (_error != null) {
      return Scaffold(body: Center(child: Text('Lỗi: $_error')));
    }

    if (_epubFile == null) {
      return const Scaffold(body: Center(child: Text("Không tìm thấy file")));
    }

    // Hiển thị FlutterEpubViewer khi đã có file
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Title'),
        actions: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ],
      ),
      drawer: ChapterDrawer(controller: epubController),
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
                  epubController: epubController,
                  epubSource: EpubSource.fromFile(_epubFile!),
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
                      // _toggleMenu();
                    } else {
                      // Để thư viện tự xử lý lật trang
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
                widthFactor: 0.5, // ~70.7% chiều rộng
                heightFactor: 0.5, // ~70.7% chiều cao
                child: Container(
                  decoration: BoxDecoration(
                    // Màu cơ bản nhạt (Primary Color với độ mờ 20%)
                    color: context.colorScheme.primaryContainer.withValues(
                      alpha: 0.2,
                    ),
                    // Viền nét đứt hoặc nét liền để dễ nhìn biên
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
