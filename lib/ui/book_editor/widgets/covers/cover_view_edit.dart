import 'dart:io';

import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/ui/book_editor/widgets/covers/cover_placeholder.dart';
import 'package:leafy/ui/book_editor/widgets/edit_cover_options.dart';

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:image/image.dart' as img;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/// Một widget chỉ để hiển thị ảnh bìa và các tùy chọn chỉnh sửa.
/// Widget này không chứa logic, chỉ nhận dữ liệu và các callbacks.
class CoverViewEdit extends StatelessWidget {
  const CoverViewEdit({
    super.key,
    this.coverBytes,
    this.blurHash,
    this.isLoading = false,
    required this.onPickFromGallery,
    required this.onEditCover,
    required this.onDeleteCover,
    required this.onSearchOnline,
    required this.onLoadFromOpenLibrary,
  });

  // --- Dữ liệu và trạng thái UI được truyền từ bên ngoài ---
  final Uint8List? coverBytes;
  final String? blurHash;
  final bool isLoading;

  // --- Callbacks để thông báo cho widget cha về các hành động ---
  final VoidCallback onPickFromGallery;
  final VoidCallback onEditCover;
  final VoidCallback onDeleteCover;
  final VoidCallback onSearchOnline;
  final VoidCallback onLoadFromOpenLibrary;

  /// Hiển thị bottom sheet với các tùy chọn chỉnh sửa ảnh bìa.
  void _showCoverLoadBottomSheet(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    // Hàm helper để đóng bottom sheet trước khi gọi callback
    void actionWrapper(VoidCallback action) {
      Navigator.of(context).pop();
      action();
    }

    final options = EditCoverOptions(
      loadCoverFromStorage: () => actionWrapper(onPickFromGallery),
      searchForCoverOnline: () => actionWrapper(onSearchOnline),
      loadCoverFromOpenLibrary: () => actionWrapper(onLoadFromOpenLibrary),
      editCurrentCover: () => actionWrapper(onEditCover),
    );

    if (Platform.isIOS) {
      showCupertinoModalBottomSheet(
        context: context,
        expand: false,
        builder: (_) => options,
      );
    } else if (Platform.isAndroid) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        builder: (_) => options,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Hiển thị thanh tiến trình nếu đang tải
        isLoading
            ? const LinearProgressIndicator(minHeight: 3)
            : const SizedBox(height: 3),
        const SizedBox(height: 5),
        // Hiển thị ảnh bìa hoặc placeholder
        if (coverBytes != null)
          _buildCoverView(context, () => _showCoverLoadBottomSheet(context))
        else
          CoverPlaceholder(
            defaultHeight: Constants.formHeight,
            onPressed: () => _showCoverLoadBottomSheet(context),
          ),
      ],
    );
  }

  /// Xây dựng giao diện khi có ảnh bìa.
  Widget _buildCoverView(BuildContext context, VoidCallback onTap) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        return InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              SizedBox(
                width: boxConstraints.maxWidth,
                height: boxConstraints.maxWidth / 1.2,
                child: Stack(
                  children: [_buildBlurHash(context, blurHash, boxConstraints)],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    height: (boxConstraints.maxWidth / 1.2) - 40,
                    width: boxConstraints.maxWidth - 40,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Stack(
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(cornerRadius),
                            child: (coverBytes != null)
                                ? Image.memory(
                                    coverBytes!,
                                    fit: BoxFit.contain,
                                    width: double.infinity,
                                    height: double.infinity,
                                  )
                                : const SizedBox(),
                          ),
                        ),
                        Positioned(
                          right: 1,
                          bottom: 1,
                          child: IconButton(
                            style: IconButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red.shade400,
                            ),
                            icon: const Icon(FontAwesomeIcons.trash),
                            // Gọi callback khi nhấn nút xóa
                            onPressed: onDeleteCover,
                            iconSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Xây dựng hình ảnh từ blurhash.
  Widget _buildBlurHash(
    BuildContext context,
    String? blurHashString,
    BoxConstraints boxConstraints,
  ) {
    if (blurHashString == null) {
      return const SizedBox();
    }
    try {
      final image = BlurHash.decode(blurHashString).toImage(35, 20);
      return Image(
        image: MemoryImage(Uint8List.fromList(img.encodeJpg(image))),
        fit: BoxFit.cover,
        width: boxConstraints.maxWidth,
        height: boxConstraints.maxWidth / 1.2,
      );
    } catch (e) {
      // Trả về SizedBox nếu blurhash không hợp lệ
      return const SizedBox();
    }
  }
}
