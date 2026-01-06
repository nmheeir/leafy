import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/trash/trash_bin_cubit.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/ui/books/widgets/cards/book_card_list.dart';

class TrashScreen extends StatefulWidget {
  const TrashScreen({super.key});

  @override
  State<TrashScreen> createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  @override
  void initState() {
    super.initState();
    context.trashBinCubit.loadDeletedBooks();
  }

  @override
  Widget build(BuildContext context) {
    // 1. Inject Cubit
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.deleted_books.tr(),
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          // Nút "Dọn sạch thùng rác"
          _buildEmptyTrashButton(),
        ],
      ),
      body: _buildBody(),
    );
  }

  // Nút xóa tất cả
  Widget _buildEmptyTrashButton() {
    return BlocBuilder<TrashBinCubit, TrashBinState>(
      builder: (context, state) {
        // Chỉ hiện nút xóa nếu danh sách không rỗng
        final bool hasBooks = state.maybeWhen(
          loaded: (books) => books.isNotEmpty,
          orElse: () => false,
        );

        if (!hasBooks) return const SizedBox.shrink();

        return IconButton(
          icon: const Icon(Icons.delete_sweep_outlined),
          tooltip: 'Delete all',
          onPressed: () => _confirmEmptyTrash(context),
        );
      },
    );
  }

  Widget _buildBody() {
    // 2. Sử dụng BlocConsumer để xử lý cả UI và Side Effects (SnackBar)
    return BlocConsumer<TrashBinCubit, TrashBinState>(
      listener: (context, state) {
        state.whenOrNull(
          actionSuccess: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.red),
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (msg) => Center(child: Text(msg)),
          // 3. Xử lý UI Empty
          empty: () => Center(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.trashCan,
                    size: 50,
                    color: context.colorScheme.secondary.withValues(alpha: 0.5),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    LocaleKeys.no_deleted_books.tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(letterSpacing: 1.5, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          // 4. Xử lý UI List có Dismissible
          loaded: (books) => _buildTrashList(books),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget _buildTrashList(List<Book> books) {
    return ListView.builder(
      itemCount: books.length,
      padding: const EdgeInsets.only(bottom: 20),
      itemBuilder: (context, index) {
        final book = books[index];
        final uniqueKey = Key('trash_${book.id}');

        return Dismissible(
          key: uniqueKey,
          direction: DismissDirection.horizontal,
          background: _buildSwipeBackground(
            context,
            Alignment.centerLeft,
            Colors.green,
            Icons.restore,
            LocaleKeys.restore_book.tr(),
          ),
          secondaryBackground: _buildSwipeBackground(
            context,
            Alignment.centerRight,
            Colors.red,
            Icons.delete_forever,
            LocaleKeys.delete_permanently.tr(),
          ),
          confirmDismiss: (direction) async {
            // Vuốt phái -> trái: hiển thị confirm delete permently dialog
            if (direction == DismissDirection.endToStart) {
              return await _showConfirmDialog(
                context,
                LocaleKeys.delete_perm_question.tr(),
              );
            }
            return true;
          },
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              context.trashBinCubit.deletePermanently(book.id!);
            } else {
              context.trashBinCubit.restoreBook(book.id!);
            }
          },
          child: BookCardList(
            book: book,
            heroTag: 'trash_hero_${book.id}',
            addBottomPadding: index == books.length - 1,
            onPressed: () {},
          ),
        );
      },
    );
  }

  Widget _buildSwipeBackground(
    BuildContext context,
    Alignment alignment,
    Color color,
    IconData icon,
    String label,
  ) {
    return Container(
      alignment: alignment,
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          if (alignment == Alignment.centerLeft)
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }

  Future<bool> _showConfirmDialog(BuildContext context, String title) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cornerRadius),
              ),
              title: Text(title, style: const TextStyle(fontSize: 16)),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(LocaleKeys.no.tr()),
                ),
                FilledButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(cornerRadius),
                    ),
                    backgroundColor: Colors.red, // Nút xóa màu đỏ cho cảnh báo
                  ),
                  child: Text(LocaleKeys.yes.tr()),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  void _confirmEmptyTrash(BuildContext context) {
    _showConfirmDialog(context, 'Do you want to empty trash').then((confirmed) {
      if (confirmed && context.mounted) {
        context.trashBinCubit.emptyTrash();
      }
    });
  }
}
