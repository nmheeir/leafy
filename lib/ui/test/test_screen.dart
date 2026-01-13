import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/domain/epub_reader/entities/epub_chapter.dart';
import 'package:leafy/domain/epub_reader/entities/epub_display_item.dart';
import 'package:leafy/domain/epub_reader/entities/epub_image.dart';
import 'package:leafy/ui/test/cubit/test_cubit.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TestEpubReaderScreen extends StatefulWidget {
  final String filePath;

  const TestEpubReaderScreen({super.key, required this.filePath});

  @override
  State<TestEpubReaderScreen> createState() => _TestEpubReaderScreenState();
}

class _TestEpubReaderScreenState extends State<TestEpubReaderScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TestCubit>().parseEpub(widget.filePath);
  }

  @override
  void didUpdateWidget(covariant TestEpubReaderScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.filePath != widget.filePath) {
      context.read<TestCubit>().parseEpub(widget.filePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<TestCubit>(),
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
    with SingleTickerProviderStateMixin {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

  final ValueNotifier<double> _chapterProgressNotifier = ValueNotifier(0.0);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _showControls = false;
  bool _isProgrammaticScroll = false;
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

    // --- SỬA LOGIC TÍNH % ---
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

    if (_isProgrammaticScroll) return;

    // 2. Cập nhật Chapter Index hiện tại (Giữ nguyên logic cũ của bạn)
    final currentState = context.read<TestCubit>().state;
    currentState.mapOrNull(
      loaded: (data) {
        if (currentItemIdx < data.displayItems.length) {
          final currentDisplayItem = data.displayItems[currentItemIdx];
          if (data.currentChapterIndex != currentDisplayItem.chapterIndex) {
            context.read<TestCubit>().updateChapterIndexOnly(
              currentDisplayItem.chapterIndex,
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestCubit, TestCubitState>(
      builder: (context, state) {
        return PopScope(
          canPop: true,
          onPopInvokedWithResult: (didPop, result) {
            // Lưu tiến trình khi thoát màn hình
            if (didPop) {
              context.read<TestCubit>().saveProgress();
            }
          },
          child: Scaffold(
            key: _scaffoldKey,
            drawer: _buildDrawer(context, state),
            body: SafeArea(
              child: Stack(
                children: [
                  state.map(
                    initial: (_) => const SizedBox.shrink(),
                    loading: (data) => _buildLoading(data.progress),
                    error: (data) => _buildError(data.message),
                    loaded: (data) {
                      _totalDisplayItems = data.displayItems.length;
                      return _buildContinuousReaderBody(
                        context,
                        data.displayItems,
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
                      child: _buildTopBar(context, state),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SizeTransition(
                      sizeFactor: _controlsAnimController,
                      axisAlignment: 1.0,
                      child: state.maybeMap(
                        loaded: (data) => _buildBottomControlBar(context, data),
                        orElse: () => const SizedBox(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContinuousReaderBody(
    BuildContext context,
    List<EpubDisplayItem> items,
  ) {
    _totalDisplayItems = items.length;

    return GestureDetector(
      onTap: () => _toggleControls(),
      // 1. Đổi từ .separated sang .builder thường để tránh lỗi Layout Cycle
      child: ScrollablePositionedList.builder(
        itemCount: items.length,
        itemScrollController: _itemScrollController,
        itemPositionsListener: _itemPositionsListener,
        padding: const EdgeInsets.symmetric(vertical: 24),

        itemBuilder: (context, index) {
          final item = items[index];

          // A. Xây dựng Widget chính (Nội dung)
          Widget content;
          if (item is ChapterHeaderItem) {
            content = Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                item.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Georgia',
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else if (item is ParagraphItem) {
            content = Text(
              item.content,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
                height: 1.6,
                fontFamily: 'Georgia',
                color: context.colorScheme.onSurface.withValues(alpha: 0.9),
              ),
            );
          } else if (item is ImageItem) {
            content = Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.memory(item.imageBytes, fit: BoxFit.contain),
              ),
            );
          } else {
            content = const SizedBox.shrink();
          }

          // B. Xây dựng Separator (Đường kẻ) ngay bên trong Item
          Widget bottomSpacing = const SizedBox.shrink();

          // Kiểm tra xem có phải phần tử cuối cùng không
          if (index < items.length - 1) {
            final nextItem = items[index + 1];

            // Logic cũ: So sánh chapterIndex
            if (item.chapterIndex != nextItem.chapterIndex) {
              // KHÁC NHAU -> Vẽ "Hết chương"
              bottomSpacing = Column(
                children: [
                  const SizedBox(height: 40),
                  Divider(
                    color: context.colorScheme.primary.withValues(alpha: 0.2),
                  ),
                  Text(
                    "Hết chương ${item.chapterIndex + 1}",
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  const SizedBox(height: 40),
                ],
              );
            } else {
              // GIỐNG NHAU -> Khoảng cách giãn dòng
              bottomSpacing = const SizedBox(height: 16);
            }
          }

          // C. Gộp Content và Spacing vào 1 Column duy nhất
          // Điều này giúp ScrollablePositionedList tính toán layout dễ hơn hẳn
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [content, bottomSpacing],
          );
        },
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, TestCubitState state) {
    return Container(
      color: context.colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
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
              // Mở Drawer bằng key
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildBottomControlBar(BuildContext context, dynamic data) {
    final items = data.displayItems as List<EpubDisplayItem>;
    final totalItems = items.length;

    return Container(
      color: context.colorScheme.surface,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Slider lướt toàn bộ sách
          ValueListenableBuilder<double>(
            valueListenable:
                _chapterProgressNotifier, // Giá trị từ 0.0 -> 1.0 (Global)
            builder: (context, value, child) {
              return Column(
                children: [
                  Text("${(value * 100).toInt()}%"), // Hiển thị VD: 48%
                  Slider(
                    value: value,
                    onChanged: (val) {
                      // Nhảy tới vị trí % của file
                      final targetIndex = (val * totalItems).toInt();
                      _itemScrollController.jumpTo(index: targetIndex);
                    },
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 4),

          // 2. Chèn bộ nút Navigation vừa tạo vào đây
          _buildNavigationButtons(context, items),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context, TestCubitState state) {
    return state.maybeMap(
      loaded: (data) => Drawer(
        width: MediaQuery.of(context).size.width * 0.85,
        child: Column(
          children: [
            // Header Drawer: Hiển thị bìa sách (nếu có)
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
            // Danh sách Chapter
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
                      Navigator.pop(context); // Đóng drawer

                      // SỬA: Tìm vị trí thực tế của Header chương trong danh sách items phẳng
                      // data.displayItems là danh sách chứa cả text và ảnh
                      final targetItemIndex = data.displayItems.indexWhere(
                        (item) =>
                            item is ChapterHeaderItem &&
                            item.chapterIndex == index,
                      );

                      // Nhảy đến vị trí tìm được
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

  // Thay thế toàn bộ hàm _buildNavigationButtons cũ bằng hàm này
  Widget _buildNavigationButtons(
    BuildContext context,
    List<EpubDisplayItem> items,
  ) {
    // SỬA: Dùng ValueListenableBuilder để lắng nghe vị trí cuộn theo thời gian thực
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

extension StringExtension on String {
  String take(int n) => length > n ? substring(0, n) : this;
  bool get isNotBlank => trim().isNotEmpty;
}

class ImgEntry {
  final String path;
  final double? yrel;

  ImgEntry(this.path, this.yrel);

  static ImgEntry? fromXmlString(String text) {
    // Regex khớp với format: <img src="path" yrel="1.5">
    final RegExp regex = RegExp(r'<img\s+src="([^"]+)"\s+yrel="([^"]+)">');
    final match = regex.firstMatch(text);

    if (match != null) {
      return ImgEntry(match.group(1)!, double.tryParse(match.group(2) ?? ''));
    }
    return null;
  }
}

class ChapterContentItem extends StatelessWidget {
  final EpubChapter chapter;
  final List<EpubImage> images;
  final int index;

  const ChapterContentItem({
    super.key,
    required this.chapter,
    required this.images,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // Logic Chunk Text
    final List<String> paragraphs = chapter.body
        .split('\n\n')
        .where((s) => s.trim().isNotEmpty)
        .toList();

    final textStyle = TextStyle(
      fontSize: 18,
      height: 1.6,
      color: context.colorScheme.onSurface.withValues(alpha: 0.88),
      fontFamily: 'Georgia',
    );

    // Tiêu đề chương (được render ngay đầu mỗi chương)
    final titleWidget = Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      child: Text(
        chapter.title,
        style: textStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        textAlign: TextAlign.center,
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (chapter.title.isNotEmpty) titleWidget,

          ..._renderParagraphs(context, paragraphs, textStyle),
        ],
      ),
    );
  }

  List<Widget> _renderParagraphs(
    BuildContext context,
    List<String> paragraphs,
    TextStyle style,
  ) {
    final List<Widget> widgets = [];
    final StringBuffer textBuffer = StringBuffer();

    for (int i = 0; i < paragraphs.length; i++) {
      final para = paragraphs[i];
      final imgEntry = ImgEntry.fromXmlString(para);

      if (imgEntry == null) {
        textBuffer.write(para);
        textBuffer.write("\n\n");
      } else {
        if (textBuffer.isNotEmpty) {
          widgets.add(
            Text(
              textBuffer.toString().trimRight(),
              style: style,
              textAlign: TextAlign.justify,
            ),
          );
          textBuffer.clear();
        }

        final imageEntity = images.firstWhereOrNull(
          (img) =>
              img.absPath.endsWith(imgEntry.path) ||
              imgEntry.path.endsWith(img.absPath),
        );

        if (imageEntity != null) {
          widgets.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.memory(imageEntity.image!, fit: BoxFit.contain),
              ),
            ),
          );
        }
      }

      if (i == paragraphs.length - 1 && textBuffer.isNotEmpty) {
        widgets.add(
          Text(
            textBuffer.toString().trimRight(),
            style: style,
            textAlign: TextAlign.justify,
          ),
        );
      }
    }
    return widgets;
  }
}

class ReaderProgressWidget extends StatelessWidget {
  final double progress; // Giá trị từ 0.0 đến 1.0
  final int currentChapterIndex;
  final int totalChapters;
  final VoidCallback? onNext;
  final VoidCallback? onPrev;

  const ReaderProgressWidget({
    super.key,
    required this.progress,
    required this.currentChapterIndex,
    required this.totalChapters,
    this.onNext,
    this.onPrev,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: context.colorScheme.outlineVariant.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Dòng 1: Thông tin text + %
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Chương ${currentChapterIndex + 1} / $totalChapters",
                style: TextStyle(
                  fontSize: 12,
                  color: context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "${(progress * 100).toInt()}%",
                style: TextStyle(
                  fontSize: 12,
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Dòng 2: Thanh Progress Bar + Nút điều hướng nhỏ
          Row(
            children: [
              // Nút lùi chương nhỏ gọn
              IconButton(
                onPressed: onPrev,
                icon: const Icon(Icons.skip_previous_rounded),
                iconSize: 20,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                color: context.colorScheme.primary,
              ),

              const SizedBox(width: 12),

              // Thanh Progress Bar
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor:
                        context.colorScheme.surfaceContainerHighest,
                    color: context.colorScheme.primary,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Nút tiến chương nhỏ gọn
              IconButton(
                onPressed: onNext,
                icon: const Icon(Icons.skip_next_rounded),
                iconSize: 20,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                color: context.colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
