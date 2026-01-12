import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/book_format.dart';
import 'package:leafy/core/constants/enums/bulk_edit_option.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/domain/book/usecases/params/bulk_update_params.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/book_actor/book_actor_cubit.dart';
import 'package:leafy/logic/cubit/selected_book_cubit.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/ui/book_editor/widgets/form_fields/book_text_field.dart';
import 'package:leafy/ui/book_editor/widgets/form_fields/book_type_dropdown.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MultiSelectFAB extends StatefulWidget {
  const MultiSelectFAB({super.key});

  @override
  State<MultiSelectFAB> createState() => _MultiSelectFABState();
}

class _MultiSelectFABState extends State<MultiSelectFAB> {
  late final TextEditingController _authorCtrl;

  // Cache danh sách chuỗi định dạng sách để dùng cho Dropdown
  late final List<String> _bookFormatLabels;

  @override
  void initState() {
    super.initState();
    _authorCtrl = TextEditingController();
    _bookFormatLabels = [
      LocaleKeys.book_format_paperback.tr(),
      LocaleKeys.book_format_hardcover.tr(),
      LocaleKeys.book_format_ebook.tr(),
      LocaleKeys.book_format_audiobook.tr(),
    ];
  }

  @override
  void dispose() {
    _authorCtrl.dispose();
    super.dispose();
  }

  // --- UI EVENT HANDLERS (Gọi Cubit) ---

  void _onUpdateFormat(
    BuildContext context,
    String bookTypeStr,
    List<int> ids,
  ) {
    // 1. Map từ String hiển thị trên UI sang Enum
    final format = _mapStringToBookFormat(bookTypeStr);

    // 2. Gọi Cubit thực hiện Bulk Update
    context.bookActorCubit.bulkUpdate(
      BulkUpdateBooksParams(ids: ids.toSet(), format: format),
    );

    // 3. Đóng BottomSheet (UI Optimistic)
    Navigator.pop(context);
  }

  void _onUpdateAuthor(BuildContext context, List<int> ids) {
    final author = _authorCtrl.text.trim();
    if (author.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(LocaleKeys.bulk_update_unsuccessful_message.tr()),
        ),
      );
      return;
    }

    // Gọi Cubit
    context.bookActorCubit.bulkUpdate(
      BulkUpdateBooksParams(ids: ids.toSet(), author: author),
    );

    Navigator.pop(context); // Đóng BottomSheet
  }

  void _onBulkDelete(BuildContext context, List<int> ids) {
    // Gọi Cubit (Giả sử bạn đã thêm hàm bulkDelete hoặc dùng bulkUpdate status)
    // Nếu chưa có bulkDelete, dùng logic update deleted = true
    context.bookActorCubit.bulkDelete(ids.toSet());

    Navigator.pop(context); // Đóng Dialog
  }

  // --- HELPER FUNCTIONS ---

  BookFormat _mapStringToBookFormat(String label) {
    if (label == _bookFormatLabels[1]) return BookFormat.hardcover;
    if (label == _bookFormatLabels[2]) return BookFormat.ebook;
    if (label == _bookFormatLabels[3]) return BookFormat.audiobook;
    return BookFormat.paperback; // Default
  }

  String _getLabel(BulkEditOption bulkEditOption) {
    switch (bulkEditOption) {
      case BulkEditOption.format:
        return LocaleKeys.change_book_format.tr();
      case BulkEditOption.author:
        return LocaleKeys.change_books_author.tr();
      case BulkEditOption.delete:
        return LocaleKeys.delete_book.tr();
    }
  }

  // --- BUILD METHODS ---

  @override
  Widget build(BuildContext context) {
    // BlocListener để lắng nghe kết quả từ BookActorCubit
    return BlocListener<BookActorCubit, BookActorState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message, _) {
            // Reset selection sau khi thành công
            context.read<SelectedBooksCubit>().resetSelection();

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.red),
            );
          },
        );
      },
      child: BlocBuilder<SelectedBooksCubit, List<int>>(
        builder: (context, selectedList) {
          // Nếu không chọn sách nào thì ẩn FAB (hoặc disable)
          if (selectedList.isEmpty) return const SizedBox.shrink();

          return Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: SpeedDial(
              spacing: 20,
              icon: FontAwesomeIcons.penToSquare,
              activeIcon: Icons.close,
              childPadding: const EdgeInsets.all(5),
              spaceBetweenChildren: 10,
              children: [
                _buildSpeedDialChild(
                  context,
                  icon: FontAwesomeIcons.bookOpen,
                  label: LocaleKeys.change_book_format.tr(),
                  color: context.colorScheme.secondary,
                  onColor: context.colorScheme.onSecondary,
                  onTap: () => _showBottomSheet(
                    context,
                    BulkEditOption.format,
                    selectedList,
                  ),
                ),
                _buildSpeedDialChild(
                  context,
                  icon: FontAwesomeIcons.user,
                  label: LocaleKeys.change_books_author.tr(),
                  color: context.colorScheme.secondary,
                  onColor: context.colorScheme.onSecondary,
                  onTap: () => _showBottomSheet(
                    context,
                    BulkEditOption.author,
                    selectedList,
                  ),
                ),
                _buildSpeedDialChild(
                  context,
                  icon: FontAwesomeIcons.trash,
                  label: LocaleKeys.delete_books.tr(),
                  color: context.colorScheme.tertiary,
                  onColor: context.colorScheme.onTertiary,
                  onTap: () => _showDeleteBooksDialog(context, selectedList),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  SpeedDialChild _buildSpeedDialChild(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required Color onColor,
    required VoidCallback onTap,
  }) {
    return SpeedDialChild(
      child: FaIcon(icon, color: onColor, size: 18),
      backgroundColor: color,
      labelBackgroundColor: context.colorScheme.surfaceContainerHighest,
      foregroundColor: context.colorScheme.onSurfaceVariant,
      label: label,
      onTap: onTap,
    );
  }

  void _showBottomSheet(
    BuildContext context,
    BulkEditOption option,
    List<int> selectedList,
  ) {
    if (Platform.isIOS) {
      showCupertinoModalBottomSheet(
        context: context,
        expand: false,
        builder: (_) => _buildBottomSheetContent(context, option, selectedList),
      );
    } else {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) => _buildBottomSheetContent(context, option, selectedList),
      );
    }
  }

  Widget _buildBottomSheetContent(
    BuildContext context,
    BulkEditOption option,
    List<int> selectedList,
  ) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (Platform.isAndroid) ...[
                Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onSurfaceVariant.withOpacity(
                      0.4,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                const SizedBox(height: 10),
              ],
              _buildHeader(option),
              const SizedBox(height: 30),
              if (option == BulkEditOption.format)
                _buildEditFormat(context, selectedList)
              else if (option == BulkEditOption.author)
                _buildEditAuthor(context, selectedList),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditAuthor(BuildContext context, List<int> selectedList) {
    return Column(
      children: [
        BookTextField(
          controller: _authorCtrl,
          hint: LocaleKeys.enter_author.tr(),
          icon: Icons.person,
          keyboardType: TextInputType.name,
          maxLines: 5,
          maxLength: 255,
          textCapitalization: TextCapitalization.words,
          padding: EdgeInsets.zero,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cornerRadius),
              ),
            ),
            onPressed: () => _onUpdateAuthor(context, selectedList),
            child: Text(LocaleKeys.save.tr()),
          ),
        ),
      ],
    );
  }

  Widget _buildEditFormat(BuildContext context, List<int> selectedList) {
    return BookTypeDropdown(
      bookTypes: _bookFormatLabels,
      padding: EdgeInsets.zero,
      changeBookType: (bookTypeStr) {
        if (bookTypeStr == null) return;
        _onUpdateFormat(context, bookTypeStr, selectedList);
      },
    );
  }

  Widget _buildHeader(BulkEditOption option) {
    return Row(
      children: [
        Expanded(
          child: Text(
            _getLabel(option),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  void _showDeleteBooksDialog(BuildContext context, List<int> selectedList) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
          title: Text(
            LocaleKeys.delete_books_question.tr(),
            style: const TextStyle(fontSize: 18),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            FilledButton.tonal(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(cornerRadius),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(LocaleKeys.no.tr()),
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(cornerRadius),
                ),
              ),
              onPressed: () => _onBulkDelete(context, selectedList),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(LocaleKeys.yes.tr()),
              ),
            ),
          ],
        );
      },
    );
  }
}
