import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/epub_reader_setting/image_alignment.dart';
import 'package:leafy/core/constants/enums/epub_reader_setting/image_color_effect.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/ui/common/slider_list_tile.dart';
import 'package:leafy/generated/locale_keys.g.dart';

class ImageSubcategory extends StatelessWidget {
  const ImageSubcategory({super.key});

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
                LocaleKeys.epub_reader_image_title.tr(),
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SwitchListTile(
              title: Text(LocaleKeys.epub_reader_image_display_images.tr()),
              value: state.displayImage,
              onChanged: (_) {
                context.epubReaderSettingCubit.toggleDisplayImage();
              },
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: state.displayImage
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SwitchListTile(
                          title: Text(
                            LocaleKeys.epub_reader_image_show_caption.tr(),
                          ),
                          value: state.showImageCaption,
                          onChanged: (_) {
                            context.epubReaderSettingCubit
                                .toggleShowImageCaption();
                          },
                        ),
                        const SizedBox(height: 16),
                        _ColorEffectSelector(
                          selectedEffect: state.imageColorEffect,
                        ),
                        const SizedBox(height: 16),
                        _CornerRadiusSlider(
                          cornerRadius: state.imageCornerRadius,
                        ),
                        const SizedBox(height: 16),
                        _AlignmentSelector(
                          currentAlignment: state.imageAlignment,
                        ),
                        const SizedBox(height: 16),
                        _SizeSlider(multiplier: state.imageSizeMultiplier),
                        const SizedBox(height: 16),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }
}

class _ColorEffectSelector extends StatelessWidget {
  final ImageColorEffect selectedEffect;
  const _ColorEffectSelector({required this.selectedEffect});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            LocaleKeys.epub_reader_image_color_effect.tr(),
            style: context.textTheme.labelLarge,
          ),
        ),
        SizedBox(
          height: 48,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: ImageColorEffect.values.length,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final effect = ImageColorEffect.values[index];
              final isSelected = selectedEffect == effect;
              return ChoiceChip(
                label: Text(effect.label),
                selected: isSelected,
                onSelected: (_) {
                  context.epubReaderSettingCubit.updateImageColorEffect(effect);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CornerRadiusSlider extends StatelessWidget {
  final double cornerRadius;
  const _CornerRadiusSlider({required this.cornerRadius});

  @override
  Widget build(BuildContext context) {
    return SliderListTile(
      title: LocaleKeys.epub_reader_image_corner_radius.tr(),
      value: cornerRadius,
      min: 0.0,
      max: 24.0,
      divisions: 24,
      label: "${cornerRadius.toInt()} pt",
      onChanged: (value) =>
          context.epubReaderSettingCubit.updateImageCornerRadius(value),
    );
  }
}

class _AlignmentSelector extends StatelessWidget {
  final ImageAlignment currentAlignment;
  const _AlignmentSelector({required this.currentAlignment});

  @override
  Widget build(BuildContext context) {
    final List<ImageAlignment> alignments = [
      ImageAlignment.start,
      ImageAlignment.center,
      ImageAlignment.end,
    ];

    final List<IconData> icons = [
      Icons.align_horizontal_left,
      Icons.align_horizontal_center,
      Icons.align_horizontal_right,
    ];

    final List<bool> isSelected = alignments
        .map((align) => align == currentAlignment)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            LocaleKeys.epub_reader_image_alignment.tr(),
            style: context.textTheme.labelLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ToggleButtons(
                isSelected: isSelected,
                onPressed: (index) {
                  context.epubReaderSettingCubit.updateImageAlignment(
                    alignments[index],
                  );
                },
                borderRadius: BorderRadius.circular(8),
                constraints: BoxConstraints(
                  minWidth: (constraints.maxWidth - 4) / 3,
                  minHeight: 40,
                ),
                children: icons.map((icon) => Icon(icon)).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SizeSlider extends StatelessWidget {
  final double multiplier;
  const _SizeSlider({required this.multiplier});

  @override
  Widget build(BuildContext context) {
    return SliderListTile(
      title: LocaleKeys.epub_reader_image_size.tr(),
      value: multiplier,
      min: 0.0,
      max: 100.0,
      divisions: 100,
      label: "${multiplier.toInt()}%",
      onChanged: (value) =>
          context.epubReaderSettingCubit.updateImageSizeMultiplier(value),
    );
  }
}
