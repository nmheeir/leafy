import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart'; // Thư viện render HTML
import 'package:go_router/go_router.dart';
import 'package:leafy/core/utils/extensions/extensions.dart'; // Giả sử bạn có extension cho colorScheme
import 'package:leafy/domain/epub_reader/entities/epub_book.dart';
import 'package:leafy/ui/test/cubit/test_cubit.dart';

class TestEpubReaderScreen extends StatelessWidget {
  final String filePath;

  const TestEpubReaderScreen({
    super.key,
    // this.filePath =
    //     'https://github.com/IDPF/epub3-samples/releases/download/20230704/accessible_epub_3.epub',
    this.filePath =
        '/data/data/com.example.leafy/app_flutter/8237d9dc918d61024e81ee23f6e2cea8.epub',
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<TestCubit>()..parseEpub(filePath),
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
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<double> _chapterProgressNotifier = ValueNotifier(0.0);

  bool _showControls = false;
  late AnimationController _controlsAnimController;

  @override
  void initState() {
    super.initState();
    _controlsAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 1.0,
    );

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    // Nếu nội dung ngắn quá thì maxScroll = 0 -> progress = 100%
    if (maxScroll <= 0) {
      _chapterProgressNotifier.value = 1.0;
      return;
    }

    // Cập nhật % đọc
    _chapterProgressNotifier.value = (currentScroll / maxScroll).clamp(
      0.0,
      1.0,
    );

    // Logic ẩn/hiện controls tự động khi cuộn (Option)
    if (_showControls &&
        _scrollController.position.userScrollDirection.index != 0) {
      _toggleControls(false); // Bỏ comment nếu muốn tự ẩn khi cuộn
    }
  }

  void _toggleControls([bool? show]) {
    setState(() {
      _showControls = show ?? !_showControls;
      _showControls
          ? _controlsAnimController.forward()
          : _controlsAnimController.reverse();
    });
  }

  void _navigateChapter(BuildContext context, int newIndex, int totalChapters) {
    if (newIndex >= 0 && newIndex < totalChapters) {
      context.read<TestCubit>().selectChapter(newIndex);
      // QUAN TRỌNG: Reset cuộn lên đầu khi sang chương mới
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _chapterProgressNotifier.dispose();
    _controlsAnimController.dispose();
    super.dispose();
  }

  void _onChapterChanged() {
    // Reset scroll lên đầu khi đổi chương
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
      _chapterProgressNotifier.value = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestCubit, TestCubitState>(
      listener: (context, state) {
        state.mapOrNull(
          loaded: (data) {
            _onChapterChanged();
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          // drawer: _buildDrawer(context, state),
          body: SafeArea(
            child: Stack(
              children: [
                state.map(
                  initial: (_) => const SizedBox.shrink(),
                  loading: (data) => _buildLoading(data.progress),
                  error: (data) => _buildError(data.message),
                  loaded: (data) => _buildReaderBody(
                    context,
                    data.book,
                    data.currentChapterIndex,
                  ),
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
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, TestCubitState state) {
    return AppBar(
      title: state.maybeMap(
        loaded: (data) => Text(
          data.book.title,
          style: const TextStyle(fontSize: 16),
          overflow: TextOverflow.ellipsis,
        ),
        orElse: () => const Text('Đang tải...'),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => context.pop(),
      ),
      actions: [
        // Hiển thị số trang/chương hiện tại
        state.maybeMap(
          loaded: (data) => Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                "${data.currentChapterIndex + 1}/${data.book.chapters.length}",
                style: TextStyle(color: context.colorScheme.onSurfaceVariant),
              ),
            ),
          ),
          orElse: () => const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildReaderBody(
    BuildContext context,
    EpubBook book,
    int chapterIndex,
  ) {
    // Lấy nội dung chương hiện tại
    // Lưu ý: chapterIndex cần được kiểm tra bounds
    if (chapterIndex >= book.chapters.length) {
      return const Center(child: Text("Hết sách"));
    }

    final currentChapter = book.chapters[chapterIndex];

    // --- THÊM LOG DEBUG ---
    debugPrint("Chapter Index: $chapterIndex");
    debugPrint("Body Length: ${currentChapter.body.length}");
    debugPrint("First 100 chars: ${currentChapter.body.take(100)}");
    // ----------------------

    return GestureDetector(
      onTap: _toggleControls,
      child: Column(
        children: [
          // 1. Thanh Progress Bar (Tiến độ đọc chương hiện tại)
          ValueListenableBuilder<double>(
            valueListenable: _chapterProgressNotifier,
            builder: (context, value, child) {
              return LinearProgressIndicator(
                value: value,
                minHeight: 3,
                backgroundColor: context.colorScheme.surfaceContainerHighest,
                color: context.colorScheme.primary,
              );
            },
          ),

          // 2. Nội dung sách (Render HTML)
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: HtmlWidget(
                currentChapter.body,

                // Tùy chỉnh Style cơ bản
                textStyle: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  color: context.colorScheme.onSurface,
                  fontFamily: 'Georgia', // Font serif dễ đọc sách
                ),

                // Xử lý ảnh (Tạm thời placeholder, cần logic load ảnh từ Uint8List sau)
                onErrorBuilder: (context, element, error) => const Center(
                  child: Icon(Icons.broken_image, color: Colors.grey),
                ),

                // Tùy chỉnh render các thẻ đặc biệt nếu cần
                customStylesBuilder: (element) {
                  if (element.localName == 'h1') {
                    return {'text-align': 'center', 'font-weight': 'bold'};
                  }
                  return null;
                },

                customWidgetBuilder: (element) {
                  if (element.localName == 'img') {
                    final src = element.attributes['src'];
                    if (src != null) {
                      final imageEntity = book.images.firstWhereOrNull(
                        (img) =>
                            img.absPath.endsWith(src) ||
                            src.endsWith(img.absPath),
                      );

                      if (imageEntity != null) {
                        return Image.memory(
                          imageEntity.image!,
                          fit: BoxFit.contain,
                        );
                      }
                    }
                    // Nếu không tìm thấy ảnh thì hiện placeholder
                    return Container(
                      height: 100,
                      color: Colors.grey.shade200,
                      child: const Center(child: Icon(Icons.broken_image)),
                    );
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget hiển thị vùng chạm để chuyển chương Prev/Next
  Widget _buildTapZones(
    BuildContext context,
    int currentIndex,
    int totalChapters,
  ) {
    return Row(
      children: [
        // Vùng quay lại chương trước (20% màn hình trái)
        GestureDetector(
          onTap: () {
            if (currentIndex > 0) {
              context.read<TestCubit>().selectChapter(currentIndex - 1);
            }
          },
          behavior: HitTestBehavior.translucent,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            height: double.infinity,
          ),
        ),
        // Vùng giữa (trống để cuộn)
        const Spacer(),
        // Vùng sang chương sau (20% màn hình phải)
        GestureDetector(
          onTap: () {
            if (currentIndex < totalChapters - 1) {
              context.read<TestCubit>().selectChapter(currentIndex + 1);
            }
          },
          behavior: HitTestBehavior.translucent,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            height: double.infinity,
          ),
        ),
      ],
    );
  }

  Widget _buildTopBar(BuildContext context, TestCubitState state) {
    return Container(
      color: context.colorScheme.surface, // Màu nền tránh bị trong suốt
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
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildBottomControlBar(BuildContext context, dynamic data) {
    final int currentIndex = data.currentChapterIndex;
    final int totalChapters = data.book.chapters.length;

    return Container(
      color: context.colorScheme.surface,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Thanh Slider tiến trình đọc trong chương (Optional)
          Row(
            children: [
              Text(
                "${(currentIndex + 1)} / $totalChapters",
                style: const TextStyle(fontSize: 12),
              ),
              Expanded(
                child: ValueListenableBuilder<double>(
                  valueListenable: _chapterProgressNotifier,
                  builder: (context, value, child) {
                    return Slider(
                      value: value,
                      onChanged: (val) {
                        // Logic kéo slider để cuộn nhanh (Jump)
                        final maxScroll =
                            _scrollController.position.maxScrollExtent;
                        _scrollController.jumpTo(val * maxScroll);
                      },
                    );
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // 2. Nút điều hướng Previous / Next
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton.tonalIcon(
                onPressed: currentIndex > 0
                    ? () => _navigateChapter(
                        context,
                        currentIndex - 1,
                        totalChapters,
                      )
                    : null, // Disable nếu là chương đầu
                icon: const Icon(Icons.arrow_back_ios, size: 16),
                label: const Text("Trước"),
              ),

              FilledButton.tonalIcon(
                onPressed: currentIndex < totalChapters - 1
                    ? () => _navigateChapter(
                        context,
                        currentIndex + 1,
                        totalChapters,
                      )
                    : null, // Disable nếu là chương cuối
                icon: const Icon(Icons.arrow_forward_ios, size: 16),
                // Đảo icon sang phải
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.only(left: 20, right: 12),
                ),
                label: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Sau"),
                    SizedBox(width: 8),
                  ], // Hack layout để icon nằm bên phải
                ),
              ),
            ],
          ),
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
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer,
              ),
            ),
            // Danh sách Chapter
            Expanded(
              child: ListView.builder(
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
                        .withOpacity(0.2),
                    onTap: () {
                      context.read<TestCubit>().selectChapter(index);
                      Navigator.pop(context); // Đóng drawer
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
}

extension StringExtension on String {
  String take(int n) => length > n ? substring(0, n) : this;
}
