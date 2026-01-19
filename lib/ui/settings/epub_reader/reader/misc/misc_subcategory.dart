import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';

class MiscSubcategory extends StatelessWidget {
  const MiscSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpubReaderSettingCubit, EpubReaderSettingState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Miscellaneous",
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SwitchListTile(
              title: const Text("Volume Key Navigation"),
              subtitle: const Text("Sử dụng phím âm lượng để chuyển trang"),
              value: state.volumeKeyNavigation,
              secondary: Icon(
                Icons.volume_up_outlined,
                color: context.colorScheme.onSurfaceVariant,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              onChanged: (value) => context
                  .read<EpubReaderSettingCubit>()
                  .toggleVolumeKeyNavigation(),
            ),
            const Divider(indent: 56, height: 1),
            SwitchListTile(
              title: const Text("Keep Screen On"),
              subtitle: const Text("Ngăn màn hình tự động tắt khi đang đọc"),
              value: state.keepScreenOn,
              secondary: Icon(
                Icons.screen_lock_portrait_outlined,
                color: context.colorScheme.onSurfaceVariant,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              onChanged: (value) =>
                  context.read<EpubReaderSettingCubit>().toggleKeepScreenOn(),
            ),
            const Divider(indent: 56, height: 1),
            SwitchListTile(
              title: const Text("Double Tap Translate"),
              subtitle: const Text("Chạm hai lần vào từ để dịch nhanh"),
              value: state.doubleTapTranslate,
              secondary: Icon(
                Icons.translate_outlined,
                color: context.colorScheme.onSurfaceVariant,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              onChanged: (value) => context
                  .read<EpubReaderSettingCubit>()
                  .toggleDoubleTapTranslate(),
            ),
          ],
        );
      },
    );
  }
}
