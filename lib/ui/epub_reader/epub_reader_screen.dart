import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/domain/epub_reader/entities/epub_display_item.dart';
import 'package:leafy/logic/cubit/epub_reader/epub_reader_cubit.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/ui/epub_reader/widgets/epub_reader_settings_sheet.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:flutter/services.dart';
import 'package:extended_image/extended_image.dart';

class EpubReaderScreen extends StatefulWidget {
  final String filePath;

  const EpubReaderScreen({super.key, required this.filePath});

  @override
  State<EpubReaderScreen> createState() => _EpubReaderScreenState();
}

class _EpubReaderScreenState extends State<EpubReaderScreen> {
  @override
  void initState() {
    super.initState();
    context.epubReaderCubit.parseEpub(widget.filePath);
  }

  @override
  void didUpdateWidget(covariant EpubReaderScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.filePath != widget.filePath) {
      context.epubReaderCubit.parseEpub(widget.filePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.epubReaderCubit,
      child: const _EpubReaderContent(),
    );
  }
}

class _EpubReaderContent extends StatefulWidget {
  const _EpubReaderContent();

  @override
  State<_EpubReaderContent> createState() => _EpubReaderContentState();
}

class _EpubReaderContentState extends State<_EpubReaderContent>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

  final ValueNotifier<double> _chapterProgressNotifier = ValueNotifier(0.0);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _showControls = false;
  bool _isProgrammaticScroll = false;
  bool _canPop = false;
  bool _hasMarkedFinished = false;
  late AnimationController _controlsAnimController;

  int _totalDisplayItems = 1;

  @override
  void initState() {
    super.initState();
    _controlsAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 1.0,
    );

    WidgetsBinding.instance.addObserver(this);
    _itemPositionsListener.itemPositions.addListener(_onVisibleItemsChanged);
  }

  void _onVisibleItemsChanged() {
    final positions = _itemPositionsListener.itemPositions.value;
    if (positions.isEmpty) return;

    // Sắp xếp để lấy cả item đầu và item cuối đang hiển thị
    final sorted = positions.toList()
      ..sort((a, b) => a.index.compareTo(b.index));

    final first = sorted.first;
    final last = sorted.last; // Lấy item cuối cùng đang hiển thị

    final currentItemIdx = first.index;

    // --- LOGIC TÍNH % ---
    // Nếu item cuối cùng của sách đang hiển thị VÀ đáy của nó đã nằm trong màn hình
    // (itemTrailingEdge <= 1.05 là cho phép sai số nhỏ để bắt dính đáy)
    if (last.index == _totalDisplayItems - 1 && last.itemTrailingEdge <= 1.05) {
      _chapterProgressNotifier.value = 1.0;
    } else {
      // Logic bình thường: Tính dựa trên item đầu tiên
      if (_totalDisplayItems > 1) {
        // Chia cho (total - 1) để index cuối cùng trùng khớp với 100%
        final globalProgress = currentItemIdx / (_totalDisplayItems - 1);
        _chapterProgressNotifier.value = globalProgress.clamp(0.0, 1.0);
      } else {
        _chapterProgressNotifier.value = 1.0;
      }
    }

    // ------------------------
    // ------------------------

    if (_isProgrammaticScroll) return;

    // 2. Cập nhật Chapter Index hiện tại (Giữ nguyên logic cũ của bạn)
    final currentState = context.epubReaderCubit.state;
    currentState.mapOrNull(
      loaded: (data) {
        if (currentItemIdx < data.displayItems.length) {
          final currentDisplayItem = data.displayItems[currentItemIdx];
          if (data.currentItemIndex != currentItemIdx ||
              data.currentChapterIndex != currentDisplayItem.chapterIndex) {
            context.epubReaderCubit.updateReadingPosition(
              currentDisplayItem.chapterIndex,
              currentItemIdx,
            );
          }
        }
      },
    );
  }

  void _toggleControls([bool? show]) {
    setState(() {
      _showControls = show ?? !_showControls;
      _showControls
          ? _controlsAnimController.forward()
          : _controlsAnimController.reverse();
    });
  }

  // Hàm nhảy đến chương (từ Drawer hoặc nút Next/Prev)
  // Hàm tìm vị trí Header của chương SAU
  int _findNextChapterHeaderIndex(int currentIdx, List<EpubDisplayItem> items) {
    for (int i = currentIdx + 1; i < items.length; i++) {
      if (items[i] is ChapterHeaderItem) {
        return i;
      }
    }
    return -1; // Không còn chương nào
  }

  // Hàm tìm vị trí Header của chương TRƯỚC (hoặc đầu chương hiện tại)
  int _findPrevChapterHeaderIndex(int currentIdx, List<EpubDisplayItem> items) {
    // 1. Tìm đầu chương hiện tại trước
    // Quét ngược từ vị trí hiện tại lên trên
    int currentChapterStart = 0;
    for (int i = currentIdx; i >= 0; i--) {
      if (items[i] is ChapterHeaderItem) {
        currentChapterStart = i;
        break;
      }
    }

    // Logic thông minh:
    // Nếu đang ở quá xa đầu chương (> 5 item) -> Quay về đầu chương hiện tại
    if (currentIdx - currentChapterStart > 5) {
      return currentChapterStart;
    }

    // Nếu đang ở sát đầu chương -> Tìm chương trước đó nữa
    for (int i = currentChapterStart - 1; i >= 0; i--) {
      if (items[i] is ChapterHeaderItem) {
        return i;
      }
    }

    return 0; // Về đầu sách
  }

  // Hàm thực hiện nhảy
  void _jumpToTarget(int targetIndex) {
    if (targetIndex != -1) {
      _itemScrollController.jumpTo(index: targetIndex, alignment: 0);
      _isProgrammaticScroll = true; // Chặn update ngược
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) _isProgrammaticScroll = false;
      });
    }
  }

  @override
  void dispose() {
    _chapterProgressNotifier.dispose();
    _controlsAnimController.dispose();
    _itemPositionsListener.itemPositions.removeListener(_onVisibleItemsChanged);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      context.epubReaderCubit.pauseSession();
    } else if (state == AppLifecycleState.resumed) {
      context.epubReaderCubit.resumeSession();
    }
  }

  void _handleHorizontalDrag(
    DragEndDetails details,
    HorizontalGestureMode mode,
  ) {
    if (mode == HorizontalGestureMode.off) return;

    // Sensitivity threshold
    if (details.primaryVelocity == null || details.primaryVelocity!.abs() < 200)
      return;

    final isSwipeRight = details.primaryVelocity! > 0;
    // Swipe Right -> Prev Page (if logic is: move content to right, shows left content)
    // Swipe Left -> Next Page

    // mode: scroll vs swift
    // For now we just implement simple next/prev chapter or page flip simulation logic
    // But since this is a vertical scroll reader, "Horizontal Navigation" usually implies changing chapters.

    if (isSwipeRight) {
      // Swipe Right -> Go to Previous
      final items = context.epubReaderCubit.state.maybeMap(
        loaded: (data) => data.displayItems,
        orElse: () => <EpubDisplayItem>[],
      );
      if (items.isEmpty) return;
      // Find current index
      final positions = _itemPositionsListener.itemPositions.value;
      if (positions.isNotEmpty) {
        final currentIdx = positions.first.index;
        final target = _findPrevChapterHeaderIndex(currentIdx, items);
        _jumpToTarget(target);
      }
    } else {
      // Swipe Left -> Go to Next
      final items = context.epubReaderCubit.state.maybeMap(
        loaded: (data) => data.displayItems,
        orElse: () => <EpubDisplayItem>[],
      );
      if (items.isEmpty) return;
      final positions = _itemPositionsListener.itemPositions.value;
      if (positions.isNotEmpty) {
        final currentIdx = positions.first.index;
        final target = _findNextChapterHeaderIndex(currentIdx, items);
        if (target != -1) _jumpToTarget(target);
      }
    }
  }

  void _onKeyEvent(KeyEvent event) {
    // Only handle Key down
    if (event is! KeyDownEvent) return;

    // Only handle if volume navigation is enabled in state
    // We need access to state here, so we might need to look it up or rely on the builder
    // Ideally this listener should be added/removed based on state, or check state inside.
    final state = context.read<EpubReaderSettingCubit>().state;
    if (!state.volumeKeyNavigation) return;

    if (event.logicalKey == LogicalKeyboardKey.audioVolumeUp) {
      // Prev
      final items = context.epubReaderCubit.state.maybeMap(
        loaded: (data) => data.displayItems,
        orElse: () => <EpubDisplayItem>[],
      );
      if (items.isNotEmpty) {
        final positions = _itemPositionsListener.itemPositions.value;
        if (positions.isNotEmpty) {
          _jumpToTarget(
            _findPrevChapterHeaderIndex(positions.first.index, items),
          );
        }
      }
    } else if (event.logicalKey == LogicalKeyboardKey.audioVolumeDown) {
      // Next
      final items = context.epubReaderCubit.state.maybeMap(
        loaded: (data) => data.displayItems,
        orElse: () => <EpubDisplayItem>[],
      );
      if (items.isNotEmpty) {
        final positions = _itemPositionsListener.itemPositions.value;
        if (positions.isNotEmpty) {
          final target = _findNextChapterHeaderIndex(
            positions.first.index,
            items,
          );
          if (target != -1) _jumpToTarget(target);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpubReaderCubit, EpubReaderCubitState>(
      builder: (context, epubState) {
        return BlocBuilder<EpubReaderSettingCubit, EpubReaderSettingState>(
          builder: (context, settingState) {
            // Apply brightness overlay if needed or SystemChrome
            // For now we will wrap body with an opacity layer if custom brightness is enabled

            return KeyboardListener(
              focusNode: FocusNode(),
              autofocus: true,
              onKeyEvent: _onKeyEvent,
              child: PopScope(
                canPop: _canPop,
                onPopInvokedWithResult: (didPop, result) async {
                  if (didPop) return;

                  final progress = _chapterProgressNotifier.value;

                  // Check if finished when popping
                  if (progress >= 1.0) {
                    final shouldMarkFinished = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Hoàn thành sách?'),
                        content: const Text(
                          'Bạn đã đọc đến cuối sách. Bạn có muốn đánh dấu là đã đọc xong không?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Chưa xong'),
                          ),
                          FilledButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Đã xong'),
                          ),
                        ],
                      ),
                    );

                    if (shouldMarkFinished != true) {
                      return;
                    }

                    await context.epubReaderCubit.markBookAsFinished();
                    _hasMarkedFinished = true;
                  }

                  // Lưu tiến trình khi thoát màn hình
                  await context.epubReaderCubit.saveProgress(progress);
                  await context.epubReaderCubit.endSession();

                  if (context.mounted) {
                    setState(() {
                      _canPop = true;
                    });
                    Navigator.of(
                      context,
                    ).pop({'is_just_finished': _hasMarkedFinished});
                  }
                },
                child: Scaffold(
                  key: _scaffoldKey,
                  backgroundColor: settingState.customBrightnessEnabled
                      ? Colors.white
                      : null, // Base color
                  drawer: _buildDrawer(context, epubState),
                  body: SafeArea(
                    top: !settingState.cutoutMargin,
                    bottom: !settingState.cutoutMargin,
                    left: !settingState.cutoutMargin,
                    right: !settingState.cutoutMargin,
                    child: Listener(
                      onPointerDown: (_) =>
                          context.epubReaderCubit.onUserInteraction(),
                      child: Stack(
                        children: [
                          // Main Content
                          epubState.map(
                            initial: (_) => const SizedBox.shrink(),
                            loading: (data) => _buildLoading(data.progress),
                            error: (data) => _buildError(data.message),
                            loaded: (data) {
                              _totalDisplayItems = data.displayItems.length;
                              return Positioned.fill(
                                child: GestureDetector(
                                  onHorizontalDragEnd: (details) =>
                                      _handleHorizontalDrag(
                                        details,
                                        settingState.horizontalGestureMode,
                                      ),
                                  onDoubleTap: settingState.doubleTapTranslate
                                      ? () {
                                          // Toggle translate or similar action
                                        }
                                      : null,
                                  child: _buildContinuousReaderBody(
                                    context,
                                    data.displayItems,
                                    data.currentItemIndex,
                                    settingState,
                                  ),
                                ),
                              );
                            },
                          ),

                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: SizeTransition(
                              sizeFactor: _controlsAnimController,
                              axisAlignment: -1.0,
                              child: _buildTopBar(context, epubState),
                            ),
                          ),

                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: SizeTransition(
                              sizeFactor: _controlsAnimController,
                              axisAlignment: 1.0,
                              child: epubState.maybeMap(
                                loaded: (data) => _buildBottomControlBar(
                                  context,
                                  data,
                                  settingState,
                                ),
                                orElse: () => const SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildContinuousReaderBody(
    BuildContext context,
    List<EpubDisplayItem> items,
    int initialIndex, // Add parameter
    EpubReaderSettingState settings,
  ) {
    _totalDisplayItems = items.length;

    return GestureDetector(
      onTap: () => _toggleControls(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: settings.sideMargin,
          vertical: settings.verticalMargin,
        ),
        child: ScrollablePositionedList.builder(
          initialScrollIndex: initialIndex,
          itemCount: items.length,
          itemScrollController: _itemScrollController,
          itemPositionsListener: _itemPositionsListener,

          // padding: const EdgeInsets.symmetric(vertical: 24), // Use container padding instead
          itemBuilder: (context, index) {
            final item = items[index];

            // A. Xây dựng Widget chính (Nội dung)
            Widget content;
            if (item is ChapterHeaderItem) {
              content = _ChapterHeaderItemWidget(
                item: item,
                settings: settings,
              );
            } else if (item is ParagraphItem) {
              content = _ParagraphItemWidget(
                item: item,
                settings: settings,
                onTap: _toggleControls,
              );
            } else if (item is ImageItem) {
              content = _ImageItemWidget(item: item, settings: settings);
            } else {
              content = const SizedBox.shrink();
            }

            // B. Xây dựng Separator (Đường kẻ) ngay bên trong Item
            Widget bottomSpacing = const SizedBox.shrink();

            // Kiểm tra xem có phải phần tử cuối cùng không
            if (index < items.length - 1) {
              final nextItem = items[index + 1];
              final isEndOfChapter = item.chapterIndex != nextItem.chapterIndex;

              bottomSpacing = _EpubItemSeparator(
                isEndOfChapter: isEndOfChapter,
                nextChapterIndex: item.chapterIndex + 1,
                settings: settings,
              );
            }

            // C. Gộp Content và Spacing vào 1 Column duy nhất
            // Điều này giúp ScrollablePositionedList tính toán layout dễ hơn hẳn
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [content, bottomSpacing],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, EpubReaderCubitState state) {
    return Container(
      color: context.colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          Expanded(
            child: state.maybeMap(
              loaded: (data) => Text(
                data.book.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              orElse: () => const Text(""),
            ),
          ),
          IconButton(
            tooltip: "Mục lục",
            icon: const Icon(Icons.format_list_bulleted),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              EpubReaderSettingsSheet.show(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControlBar(
    BuildContext context,
    dynamic data,
    EpubReaderSettingState settings,
  ) {
    // data comes from loaded() callback, so it has all the fields of the loaded state.
    // However, since it is passed as dynamic due to freezed internal types, we simply access the properties dynamically
    // or we could cast it to the specific 'Loaded' interface if it was exported.
    // For now, dynamic access is safe enough as we know the source.
    final items = data.displayItems as List<EpubDisplayItem>;
    final totalItems = items.length;
    final int currentChapter = data.currentChapterIndex as int;
    final Map<int, TranslationStatus> statuses =
        data.translationStatuses as Map<int, TranslationStatus>;
    final TranslationStatus translationStatus =
        statuses[currentChapter] ?? TranslationStatus.initial;
    final bool isBilingual = data.isBilingual as bool;

    return Container(
      color: context.colorScheme.surface,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16 + settings.bottomBarMargin,
        bottom: 16 + settings.bottomBarMargin,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    if (settings.showProgressBar)
                      ValueListenableBuilder<double>(
                        valueListenable: _chapterProgressNotifier,
                        builder: (context, value, child) {
                          return Column(
                            children: [
                              if (settings.progressCountType ==
                                  ProgressCountType.percentage)
                                Text("${(value * 100).toInt()}%")
                              else
                                Text(
                                  "${(value * (totalItems - 1)).toInt() + 1}/$totalItems",
                                ),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 10,
                                child: Slider(
                                  value: value,
                                  activeColor: Color(
                                    settings.progressBarColor,
                                  ).withValues(alpha: 1.0),
                                  onChanged: (val) {
                                    final targetIndex = (val * totalItems)
                                        .toInt();
                                    _itemScrollController.jumpTo(
                                      index: targetIndex,
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                  ],
                ),
              ),
              // Bilingual Toggle Button
              IconButton.filledTonal(
                tooltip: "Chế độ song ngữ",
                onPressed: () {
                  if (translationStatus == TranslationStatus.initial ||
                      translationStatus == TranslationStatus.error) {
                    // If not translated yet, trigger translation
                    context.read<EpubReaderCubit>().translateChapter(
                      currentChapter,
                    );
                  }
                  context.read<EpubReaderCubit>().toggleBilingualMode();
                },
                icon: _buildTranslationIcon(translationStatus, isBilingual),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // 2. Chèn bộ nút Navigation vừa tạo vào đây
          _buildNavigationButtons(context, items),
        ],
      ),
    );
  }

  Widget _buildTranslationIcon(TranslationStatus status, bool isBilingual) {
    switch (status) {
      case TranslationStatus.loadingContext:
      case TranslationStatus.translating:
      case TranslationStatus.finalizing:
        return const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        );
      case TranslationStatus.success:
        return Icon(Icons.translate, color: isBilingual ? null : Colors.grey);
      case TranslationStatus.error:
        return const Icon(Icons.error_outline, color: Colors.red);
      case TranslationStatus.initial:
        return const Icon(Icons.translate, color: Colors.grey);
    }
  }

  Widget _buildDrawer(BuildContext context, EpubReaderCubitState state) {
    return state.maybeMap(
      loaded: (data) => Drawer(
        width: MediaQuery.of(context).size.width * 0.85,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                data.book.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              accountEmail: Text(data.book.author),
              currentAccountPicture: data.book.coverImage != null
                  ? Image.memory(data.book.coverImage!, fit: BoxFit.cover)
                  : const CircleAvatar(child: Icon(Icons.book)),
              //NOTE: background nên dùng blurhash của ảnh bìa cuốn sách cho đep
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer,
              ),
            ),
            Expanded(
              child: ScrollablePositionedList.builder(
                initialAlignment: 0.3,
                initialScrollIndex: data.currentChapterIndex,
                itemCount: data.book.chapters.length,
                itemBuilder: (context, index) {
                  final chapter = data.book.chapters[index];
                  final isSelected = index == data.currentChapterIndex;

                  return ListTile(
                    title: Text(
                      chapter.title.isEmpty
                          ? "Chương ${index + 1}"
                          : chapter.title,
                      style: TextStyle(
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isSelected ? context.colorScheme.primary : null,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    selected: isSelected,
                    selectedTileColor: context.colorScheme.primaryContainer
                        .withValues(alpha: 0.2),
                    onTap: () {
                      Navigator.pop(context);

                      final targetItemIndex = data.displayItems.indexWhere(
                        (item) =>
                            item is ChapterHeaderItem &&
                            item.chapterIndex == index,
                      );

                      if (targetItemIndex != -1) {
                        _jumpToTarget(targetItemIndex);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }

  Widget _buildLoading(double progress) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(value: progress > 0 ? progress : null),
          const SizedBox(height: 16),
          Text("Đang phân tích sách... ${(progress * 100).toInt()}%"),
        ],
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(child: Text("Lỗi: $message"));
  }

  Widget _buildNavigationButtons(
    BuildContext context,
    List<EpubDisplayItem> items,
  ) {
    // Dùng ValueListenableBuilder để lắng nghe vị trí cuộn theo thời gian thực
    return ValueListenableBuilder<Iterable<ItemPosition>>(
      valueListenable: _itemPositionsListener.itemPositions,
      builder: (context, positions, child) {
        // Logic lấy vị trí hiện tại (copy logic cũ của bạn vào đây)
        int currentIdx = 0;
        if (positions.isNotEmpty) {
          // Sắp xếp để lấy item đầu tiên đang hiển thị
          final sorted = positions.toList()
            ..sort((a, b) => a.index.compareTo(b.index));
          currentIdx = sorted.first.index;
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // NÚT PREV
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FilledButton.tonalIcon(
                  onPressed: () {
                    final target = _findPrevChapterHeaderIndex(
                      currentIdx,
                      items,
                    );
                    _jumpToTarget(target);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                  label: const Text(
                    "Chương trước",
                    overflow: TextOverflow.ellipsis,
                  ),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),

            // NÚT NEXT
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: FilledButton.tonalIcon(
                  onPressed: () {
                    final target = _findNextChapterHeaderIndex(
                      currentIdx,
                      items,
                    );
                    if (target != -1) {
                      _jumpToTarget(target);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Đã là chương cuối cùng"),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    }
                  },
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  icon: const SizedBox.shrink(),
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Chương sau", overflow: TextOverflow.ellipsis),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ChapterHeaderItemWidget extends StatelessWidget {
  final ChapterHeaderItem item;
  final EpubReaderSettingState settings;

  const _ChapterHeaderItemWidget({required this.item, required this.settings});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Text(
        item.title,
        style: TextStyle(
          fontSize: settings.fontSize * 1.5,
          fontWeight: FontWeight.bold,
          fontFamily: settings.fontFamily,
        ),
        textAlign: settings.chapterAlignment,
      ),
    );
  }
}

class _ParagraphItemWidget extends StatefulWidget {
  final ParagraphItem item;
  final EpubReaderSettingState settings;
  final VoidCallback onTap;

  const _ParagraphItemWidget({
    required this.item,
    required this.settings,
    required this.onTap,
  });

  @override
  State<_ParagraphItemWidget> createState() => _ParagraphItemWidgetState();
}

class _ParagraphItemWidgetState extends State<_ParagraphItemWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final cubitState = context.watch<EpubReaderCubit>().state;
    final isBilingual = cubitState.map(
      initial: (_) => false,
      loading: (_) => false,
      error: (_) => false,
      loaded: (s) => s.isBilingual,
    );

    final translatedText = widget.item.translatedContent;
    final hasTranslation = translatedText != null && translatedText.isNotEmpty;

    // Original Text Widget
    final originalWidget = SelectableText.rich(
      TextSpan(
        children: [
          WidgetSpan(child: SizedBox(width: widget.settings.indent)),
          TextSpan(
            text: widget.item.content,
            style: TextStyle(
              fontSize: widget.settings.fontSize,
              height: widget.settings.lineHeight,
              fontFamily: widget.settings.fontFamily,
              fontStyle: widget.settings.fontStyle,
              fontWeight: widget.settings.fontThickness.weight,
              letterSpacing: widget.settings.letterSpacing,
              color: context.colorScheme.onSurface.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
      textAlign: widget.settings.textAlignment,
      onTap: widget.onTap,
      contextMenuBuilder: (context, editableTextState) {
        return AdaptiveTextSelectionToolbar.buttonItems(
          anchors: editableTextState.contextMenuAnchors,
          buttonItems: [
            ...editableTextState.contextMenuButtonItems,
            ContextMenuButtonItem(
              label: 'Dịch chương này',
              onPressed: () {
                editableTextState.hideToolbar();
                context.read<EpubReaderCubit>().translateChapter(
                  widget.item.chapterIndex,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đang bắt đầu dịch chương...')),
                );
              },
            ),
            ContextMenuButtonItem(
              label: 'Đọc',
              onPressed: () {
                editableTextState.hideToolbar();
                // TODO: Implement TTS here
              },
            ),
          ],
        );
      },
    );

    if (isBilingual && hasTranslation) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          originalWidget,
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.only(
              left: 12,
              right: 8,
              top: 4,
              bottom: 4,
            ),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: context.colorScheme.primary.withValues(alpha: 0.5),
                  width: 3,
                ),
              ),
              color: context.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.3,
              ),
            ),
            child: SelectableText(
              translatedText,
              style: TextStyle(
                fontSize: widget.settings.fontSize * 0.9,
                height: widget.settings.lineHeight,
                fontFamily: widget.settings.fontFamily,
                color: context.colorScheme.onSurface,
                fontStyle: FontStyle.italic,
              ),
              textAlign: widget.settings.textAlignment,
            ),
          ),
        ],
      );
    }

    return originalWidget;
  }
}

class _ImageItemWidget extends StatelessWidget {
  final ImageItem item;
  final EpubReaderSettingState settings;

  const _ImageItemWidget({required this.item, required this.settings});

  @override
  Widget build(BuildContext context) {
    if (!settings.displayImage) {
      return const SizedBox.shrink();
    }
    return Align(
      alignment: settings.imageAlignment == ImageAlignment.center
          ? Alignment.center
          : settings.imageAlignment == ImageAlignment.start
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        width:
            (settings.imageSizeMultiplier / 100) *
            MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                opaque: false,
                barrierColor: Colors.black,
                pageBuilder: (_, _, _) => _FullScreenImageViewer(item: item),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
              ),
            );
          },
          child: Hero(
            tag: item.hashCode,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(settings.imageCornerRadius),
              child: Image.memory(
                item.imageBytes,
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) => const Icon(Icons.broken_image),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FullScreenImageViewer extends StatelessWidget {
  final ImageItem item;

  const _FullScreenImageViewer({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: ExtendedImage.memory(
              item.imageBytes,
              fit: BoxFit.contain,
              mode: ExtendedImageMode.gesture,
              heroBuilderForSlidingPage: (widget) {
                return Hero(
                  tag: item.hashCode,
                  child: widget,
                  flightShuttleBuilder:
                      (
                        flightContext,
                        animation,
                        flightDirection,
                        fromHeroContext,
                        toHeroContext,
                      ) {
                        final Hero hero =
                            (flightDirection == HeroFlightDirection.pop
                                    ? fromHeroContext.widget
                                    : toHeroContext.widget)
                                as Hero;
                        return hero.child;
                      },
                );
              },
              initGestureConfigHandler: (state) {
                return GestureConfig(
                  minScale: 0.9,
                  animationMinScale: 0.7,
                  maxScale: 4.0,
                  animationMaxScale: 4.5,
                  speed: 1.0,
                  inertialSpeed: 100.0,
                  initialScale: 1.0,
                  inPageView: false,
                );
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 16,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black.withValues(alpha: 0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EpubItemSeparator extends StatelessWidget {
  final bool isEndOfChapter;
  final int nextChapterIndex;
  final EpubReaderSettingState settings;

  const _EpubItemSeparator({
    required this.isEndOfChapter,
    required this.nextChapterIndex,
    required this.settings,
  });

  @override
  Widget build(BuildContext context) {
    if (isEndOfChapter) {
      return Column(
        children: [
          const SizedBox(height: 40),
          Divider(color: context.colorScheme.primary.withValues(alpha: 0.2)),
          Text(
            "Hết chương $nextChapterIndex",
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
          const SizedBox(height: 40),
        ],
      );
    } else {
      return SizedBox(
        height: settings.paragraphSpacing > 0 ? settings.paragraphSpacing : 16,
      );
    }
  }
}
