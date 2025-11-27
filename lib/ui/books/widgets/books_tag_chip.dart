import 'package:flutter/material.dart';

class BooksTagChip extends StatefulWidget {
  const BooksTagChip({
    super.key,
    required this.index,
    required this.tabController,
    required this.title,
  });

  final int index;
  final TabController tabController;
  final String title;

  @override
  State<BooksTagChip> createState() => _BookTabChipState();
}

class _BookTabChipState extends State<BooksTagChip> {
  void _scrollToChip(int index, BuildContext context) {
// ...existing code...
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    // Thêm listener để rebuild widget khi tab thay đổi
    widget.tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    // Gỡ bỏ listener để tránh memory leak
    widget.tabController.removeListener(_handleTabSelection);
    super.dispose();
  }

  void _handleTabSelection() {
    // Cuộn chip vào tầm nhìn khi tab của nó được chọn
    if (widget.index == widget.tabController.index) {
      _scrollToChip(widget.index, context);
    }
    // Gọi setState để widget tự rebuild và cập nhật trạng thái selected
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // Xác định trạng thái selected trực tiếp từ TabController
    final isSelected = widget.tabController.index == widget.index;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      // Loại bỏ BlocBuilder
      child: FilterChip(
        selectedColor: Theme.of(context).colorScheme.primaryContainer,
        selected: isSelected,
        label: Text(
          widget.title,
          style: TextStyle(
            color: isSelected
                ? Theme.of(context).colorScheme.onPrimaryContainer
                : null,
          ),
        ),
        showCheckmark: false,
        onSelected: (bool _) {
          // Cập nhật trực tiếp TabController, không cần BLoC
          widget.tabController.index = widget.index;
          // Việc cuộn đã được xử lý trong listener _handleTabSelection
        },
      ),
    );
  }
}