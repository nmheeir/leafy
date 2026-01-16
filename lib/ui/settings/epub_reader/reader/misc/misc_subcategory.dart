import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class MiscSubcategory extends StatelessWidget {
  const MiscSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
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
        const _MiscToggle(
          title: "Volume Key Navigation",
          subtitle: "Use volume keys to turn pages",
          initialValue: false,
          icon: Icons.volume_up_outlined,
        ),
        const Divider(indent: 56, height: 1),
        const _MiscToggle(
          title: "Keep Screen On",
          subtitle: "Prevent screen from sleeping while reading",
          initialValue: true,
          icon: Icons.screen_lock_portrait_outlined,
        ),
        const Divider(indent: 56, height: 1),
        const _MiscToggle(
          title: "Double Tap Translate",
          subtitle: "Quick translate paragraph",
          initialValue: true,
          icon: Icons.translate_outlined,
        ),
      ],
    );
  }
}

class _MiscToggle extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool initialValue;
  final IconData icon;

  const _MiscToggle({
    required this.title,
    required this.subtitle,
    required this.initialValue,
    required this.icon,
  });

  @override
  State<_MiscToggle> createState() => _MiscToggleState();
}

class _MiscToggleState extends State<_MiscToggle> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      title: Text(widget.title, style: context.textTheme.bodyLarge),
      subtitle: Text(
        widget.subtitle,
        style: context.textTheme.bodySmall?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
      value: _value,
      onChanged: (value) => setState(() => _value = value),
      secondary: Icon(widget.icon, color: context.colorScheme.onSurfaceVariant),
    );
  }
}
