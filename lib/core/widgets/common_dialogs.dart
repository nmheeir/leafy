import 'package:flutter/material.dart';
import 'package:leafy/core/constants/constants.dart';

class CommonDialog extends StatelessWidget {
  final String title;
  final Widget child;
  final EdgeInsets padding;

  const CommonDialog({
    super.key,
    required this.title,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: padding,
        child: child
      ),
    );
  }
}
