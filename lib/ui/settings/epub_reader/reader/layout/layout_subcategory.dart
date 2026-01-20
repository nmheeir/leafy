import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';
import 'package:leafy/logic/utils/extensions.dart';

class LayoutSubcategory extends StatelessWidget {
  const LayoutSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpubReaderSettingCubit, EpubReaderSettingState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.epub_reader_layout_title.tr(),
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    LocaleKeys.epub_reader_layout_requires_re_layout.tr(),
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.tertiary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            _buildSliderTile(
              context: context,
              title: LocaleKeys.epub_reader_layout_side_margin.tr(),
              value: state.sideMargin,
              min: 0,
              max: 60,
              divisions: 12,
              onChanged: (val) =>
                  context.epubReaderSettingCubit.updateSideMargin(val),
            ),
            _buildSliderTile(
              context: context,
              title: LocaleKeys.epub_reader_layout_vertical_margin.tr(),
              value: state.verticalMargin,
              min: 0,
              max: 60,
              divisions: 12,
              onChanged: (val) =>
                  context.epubReaderSettingCubit.updateVerticalMargin(val),
            ),
            SwitchListTile(
              title: Text(LocaleKeys.epub_reader_layout_cutout_margin.tr()),
              value: state.cutoutMargin,
              onChanged: (_) =>
                  context.epubReaderSettingCubit.toggleCutoutMargin(),
              secondary: Icon(
                Icons.edgesensor_high,
                color: context.colorScheme.primary,
              ),
            ),
            _buildSliderTile(
              context: context,
              title: LocaleKeys.epub_reader_layout_bottom_bar_margin.tr(),
              value: state.bottomBarMargin,
              min: 0,
              max: 100,
              divisions: 20,
              onChanged: (val) =>
                  context.epubReaderSettingCubit.updateBottomBarMargin(val),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSliderTile({
    required BuildContext context,
    required String title,
    required double value,
    required double min,
    required double max,
    required int divisions,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: context.textTheme.bodyMedium),
              Text(
                "${value.round()} px",
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
