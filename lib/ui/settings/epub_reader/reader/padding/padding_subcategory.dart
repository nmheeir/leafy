import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';

class PaddingSubcategory extends StatelessWidget {
  const PaddingSubcategory({super.key});

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
                    "Layout",
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Requires re-layout",
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
              title: "Side Margin",
              value: state.sideMargin,
              min: 0,
              max: 60,
              divisions: 12,
              onChanged: (val) =>
                  context.read<EpubReaderSettingCubit>().updateSideMargin(val),
            ),
            _buildSliderTile(
              context: context,
              title: "Vertical Margin",
              value: state.verticalMargin,
              min: 0,
              max: 60,
              divisions: 12,
              onChanged: (val) => context
                  .read<EpubReaderSettingCubit>()
                  .updateVerticalMargin(val),
            ),
            SwitchListTile(
              title: const Text("Cutout Margin"),
              value: state.cutoutMargin,
              onChanged: (_) =>
                  context.read<EpubReaderSettingCubit>().toggleCutoutMargin(),
              secondary: Icon(
                Icons.edgesensor_high,
                color: context.colorScheme.primary,
              ),
            ),
            _buildSliderTile(
              context: context,
              title: "Bottom Bar Margin",
              value: state.bottomBarMargin,
              min: 0,
              max: 100,
              divisions: 20,
              onChanged: (val) => context
                  .read<EpubReaderSettingCubit>()
                  .updateBottomBarMargin(val),
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
