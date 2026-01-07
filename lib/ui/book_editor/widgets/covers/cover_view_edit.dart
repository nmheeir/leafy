// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/utils/helpers/helpers.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/edit_book_cover/edit_book_cover_cubit.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/main.dart';
import 'package:leafy/ui/book_editor/widgets/covers/cover_placeholder.dart';
import 'package:leafy/ui/book_editor/widgets/duck_duck_go_alert.dart';
import 'package:leafy/ui/book_editor/widgets/edit_cover_options.dart';
import 'package:leafy/ui/search_covers/search_covers_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoverViewEdit extends StatefulWidget {
  const CoverViewEdit({super.key});

  static void showInfoSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  @override
  State<CoverViewEdit> createState() => _CoverViewEditState();
}

class _CoverViewEditState extends State<CoverViewEdit> {
  Future<void> _pickAndCropImage(
    BuildContext context, {
    Uint8List? sourceBytes,
  }) async {
    Navigator.of(context).pop();

    Uint8List? bytesToCrop = sourceBytes;

    if (bytesToCrop == null) {
      final photoXFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (photoXFile == null) return;
      bytesToCrop = await photoXFile.readAsBytes();
    }

    if (!context.mounted) return;

    final croppedPhoto = await cropImage(context, bytesToCrop);
    if (croppedPhoto == null) return;

    final croppedBytes = await croppedPhoto.readAsBytes();

    if (!context.mounted) return;

    context.editBookCoverCubit.setCoverImage(croppedBytes);
  }

  void _editCurrentCover(BuildContext context, Uint8List? currentCover) {
    if (currentCover == null) return;
    _pickAndCropImage(context, sourceBytes: currentCover);
  }

  void _deleteCover(BuildContext context) {
    context.editBookCoverCubit.deleteCover(context.editBookCubit.state.id);
  }

  void _loadCoverFromOpenLibrary(BuildContext context) {
    Navigator.of(context).pop();
    final isbn = context.editBookCubit.state.isbn;

    if (isbn == null || isbn.isEmpty) {
      CoverViewEdit.showInfoSnackbar(LocaleKeys.isbn_cannot_be_empty.tr());
      return;
    }

    context.editBookCoverCubit.loadFromOpenLibrary(isbn);
  }

  void _showDuckDuckGoWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext _) {
        return DuckDuckGoAlert(
          openDuckDuckGoSearchScreen: _openDuckDuckGoSearchScreen,
        );
      },
    );
  }

  Future<void> _searchForCoverOnline(BuildContext context) async {
    Navigator.of(context).pop();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? showDuckDuckGoWarning = prefs.getBool(
      SharedPreferencesKeys.duckDuckGoWarning,
    );

    if (showDuckDuckGoWarning == false) {
      _openDuckDuckGoSearchScreen(context);
    } else {
      _showDuckDuckGoWarning(context);
    }
  }

  void _openDuckDuckGoSearchScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SearchCoversScreen(book: context.editBookCubit.state),
      ),
    );
  }

  void showCoverLoadBottomSheet(BuildContext context, Uint8List? currentCover) {
    FocusManager.instance.primaryFocus?.unfocus();

    final options = EditCoverOptions(
      loadCoverFromStorage: () => _pickAndCropImage(context),
      searchForCoverOnline: () => _searchForCoverOnline(context),
      loadCoverFromOpenLibrary: () => _loadCoverFromOpenLibrary(context),
      editCurrentCover: () => _editCurrentCover(context, currentCover),
    );

    if (Platform.isIOS) {
      showCupertinoModalBottomSheet(
        context: context,
        expand: false,
        builder: (_) => options,
      );
    } else {
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
  void initState() {
    super.initState();
    // FIX LỖI CHỚP NHÁY:
    // Lấy dữ liệu hiện tại từ EditBookCubit (đã có sẵn khi vào màn hình)
    // và nạp ngay vào EditBookCoverCubit trước khi UI kịp vẽ frame đầu tiên.
    final editBookState = context.editBookCubit.state;

    // Lưu ý: Giả sử EditBookState có trường 'cover' (Uint8List?) lưu ảnh raw.
    // Nếu EditBookState chỉ lưu đường dẫn file, bạn cần xử lý đọc file ở đây
    // hoặc chỉ reset về null để tránh hiện ảnh cũ.
    // Ở đây tôi giả định bạn muốn clear ảnh cũ đi để tránh hiện sai:

    context.read<EditBookCoverCubit>().initialize(
      currentCover: null,
      currentBlurHash: editBookState.blurHash,
    );

    // NẾU EditBookCubit đã có sẵn bytes ảnh (ví dụ state.coverBytes), hãy truyền vào:
    // currentCover: editBookState.coverBytes
    // Để người dùng thấy ngay ảnh hiện tại mà không cần chờ load.
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditBookCoverCubit, EditBookCoverState>(
      listener: (context, state) {
        if (state.status == EditCoverStatus.failure &&
            state.errorMessage != null) {
          final msg = state.errorMessage == 'cover_not_found_in_ol'
              ? LocaleKeys.cover_not_found_in_ol.tr()
              : state.errorMessage!;
          CoverViewEdit.showInfoSnackbar(msg);
        }

        if (state.status == EditCoverStatus.success) {
          final editBookCubit = context.editBookCubit;
          editBookCubit.setHasCover(true);
          editBookCubit.setBlurHash(state.blurHash);
        }

        if (state.status == EditCoverStatus.deleted) {
          final editBookCubit = context.editBookCubit;

          editBookCubit.setHasCover(false);
          editBookCubit.setBlurHash(null);
        }
      },
      child: BlocBuilder<EditBookCoverCubit, EditBookCoverState>(
        builder: (context, state) {
          final isLoading = state.status == EditCoverStatus.loading;
          final coverData = state.coverData;

          return Column(
            children: [
              isLoading
                  ? const LinearProgressIndicator(minHeight: 3)
                  : const SizedBox(height: 3),
              const SizedBox(height: 5),
              coverData != null
                  ? _buildCoverViewEdit(context, coverData, state.blurHash)
                  : CoverPlaceholder(
                      defaultHeight: Constants.formHeight,
                      onPressed: () => showCoverLoadBottomSheet(context, null),
                    ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCoverViewEdit(
    BuildContext context,
    Uint8List coverData,
    String? blurHash,
  ) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        return InkWell(
          onTap: () => showCoverLoadBottomSheet(context, coverData),
          child: Stack(
            children: [
              // Background BlurHash
              SizedBox(
                width: boxConstraints.maxWidth,
                height: boxConstraints.maxWidth / 1.2,
                child: _buildBlurHash(blurHash, boxConstraints),
              ),
              // Main Image
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
                            child: Image.memory(
                              coverData,
                              fit: BoxFit.contain,
                              width: double.infinity,
                              height: double.infinity,
                            ),
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
                            onPressed: () => _deleteCover(context),
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

  Widget _buildBlurHash(String? blurHashString, BoxConstraints boxConstraints) {
    if (blurHashString == null) return const SizedBox();

    final image = BlurHash.decode(blurHashString).toImage(35, 20);
    return Image(
      image: MemoryImage(Uint8List.fromList(img.encodeJpg(image))),
      fit: BoxFit.cover,
      width: boxConstraints.maxWidth,
      height: boxConstraints.maxWidth / 1.2,
    );
  }
}
