import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/epub_reader_setting/image_alignment.dart';
import 'package:leafy/core/constants/enums/epub_reader_setting/image_color_effect.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';
import 'package:leafy/ui/common/slider_list_tile.dart';

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
                "Images",
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SwitchListTile(
              title: const Text("Display Images"),
              value: state.displayImage,
              onChanged: (_) {
                context.read<EpubReaderSettingCubit>().toggleDisplayImage();
              },
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: state.displayImage
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(indent: 16, endIndent: 16, height: 32),
                        SwitchListTile(
                          title: const Text("Show Caption"),
                          value: state.showImageCaption,
                          onChanged: (_) {
                            context
                                .read<EpubReaderSettingCubit>()
                                .toggleShowImageCaption();
                          },
                        ),
                        const Divider(indent: 16, endIndent: 16, height: 32),
                        _ColorEffectSelector(
                          selectedEffect: state.imageColorEffect,
                        ),
                        const Divider(indent: 16, endIndent: 16, height: 32),
                        _CornerRadiusSlider(
                          cornerRadius: state.imageCornerRadius,
                        ),
                        const Divider(indent: 16, endIndent: 16, height: 32),
                        _AlignmentSelector(
                          currentAlignment: state.imageAlignment,
                        ),
                        const Divider(indent: 16, endIndent: 16, height: 32),
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
          child: Text("Color Effect", style: context.textTheme.labelLarge),
        ),
        SizedBox(
          height: 48,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: ImageColorEffect.values.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final effect = ImageColorEffect.values[index];
              final isSelected = selectedEffect == effect;
              return ChoiceChip(
                label: Text(_getEffectLabel(effect)),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected) {
                    context
                        .read<EpubReaderSettingCubit>()
                        .updateImageColorEffect(effect);
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }

  String _getEffectLabel(ImageColorEffect effect) {
    switch (effect) {
      case ImageColorEffect.off:
        return "Off";
      case ImageColorEffect.grayscale:
        return "Grayscale";
      case ImageColorEffect.fontColor:
        return "Font Color";
      case ImageColorEffect.backgroundColor:
        return "Background";
    }
  }
}

class _CornerRadiusSlider extends StatelessWidget {
  final double cornerRadius;
  const _CornerRadiusSlider({required this.cornerRadius});

  @override
  Widget build(BuildContext context) {
    return SliderListTile(
      title: "Corner Radius",
      value: cornerRadius,
      min: 0.0,
      max: 24.0,
      divisions: 24,
      label: "${cornerRadius.toInt()} pt",
      onChanged: (value) =>
          context.read<EpubReaderSettingCubit>().updateImageCornerRadius(value),
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
          child: Text("Alignment", style: context.textTheme.labelLarge),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ToggleButtons(
                isSelected: isSelected,
                onPressed: (index) {
                  context.read<EpubReaderSettingCubit>().updateImageAlignment(
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
      title: "Size",
      value: multiplier,
      min: 0.0,
      max: 100.0,
      divisions: 100,
      label: "${multiplier.toInt()}%",
      onChanged: (value) => context
          .read<EpubReaderSettingCubit>()
          .updateImageSizeMultiplier(value),
    );
  }
}
