import 'package:flutter/material.dart';
import 'package:heatmap_calendar/src/data/heatmap_color.dart';

class HeatMapContainer extends StatelessWidget {
  final DateTime date;
  final double? size;
  final double? fontSize;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? textColor;
  final EdgeInsets? margin;
  final bool? showText;
  final Function(DateTime dateTime)? onClick;
  final String? tooltip;

  const HeatMapContainer({
    super.key,
    required this.date,
    this.margin,
    this.size,
    this.fontSize,
    this.borderRadius,
    this.backgroundColor,
    this.selectedColor,
    this.textColor,
    this.onClick,
    this.showText,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(2),
      child: GestureDetector(
        child: tooltip != null
            ? Tooltip(
                message: tooltip!,
                triggerMode: TooltipTriggerMode.tap,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius ?? 5),
                  ),
                ),
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                child: _container(),
              )
            : _container(),
        onTap: () {
          onClick != null ? onClick!(date) : null;
        },
      ),
    );
  }

  Widget _container() {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? HeatMapColor.defaultColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 5)),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOutQuad,
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selectedColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 5)),
        ),
        child: (showText ?? true)
            ? Text(
                date.day.toString(),
                style: TextStyle(
                  color: textColor ?? const Color(0xFF8A8A8A),
                  fontSize: fontSize,
                ),
              )
            : null,
      ),
    );
  }
}
