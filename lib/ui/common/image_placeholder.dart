import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 3.0,
  });

  final double? width;
  final double? height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.5,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: context.colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Center(
        child: FaIcon(
          FontAwesomeIcons.bookOpen,
          color: context.colorScheme.primary.withValues(alpha: 0.5),
          size: 24,
        ),
      ),
    );
  }
}
