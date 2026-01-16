import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class SystemSubcategory extends StatelessWidget {
  const SystemSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "System",
            style: context.textTheme.titleSmall?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const _BrightnessControl(),
        const Divider(indent: 16, endIndent: 16, height: 32),
        const _OrientationLock(),
      ],
    );
  }
}

class _BrightnessControl extends StatefulWidget {
  const _BrightnessControl();

  @override
  State<_BrightnessControl> createState() => _BrightnessControlState();
}

class _BrightnessControlState extends State<_BrightnessControl> {
  double _brightness = 0.5;
  bool _useSystemBrightness = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile(
          title: const Text("Use System Brightness"),
          value: _useSystemBrightness,
          onChanged: (value) => setState(() => _useSystemBrightness = value),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        if (!_useSystemBrightness)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Icon(
                  Icons.brightness_low,
                  size: 20,
                  color: context.colorScheme.onSurfaceVariant,
                ),
                Expanded(
                  child: Slider(
                    value: _brightness,
                    onChanged: (value) => setState(() => _brightness = value),
                  ),
                ),
                Icon(
                  Icons.brightness_high,
                  size: 20,
                  color: context.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
      ],
    );
  }
}

class _OrientationLock extends StatefulWidget {
  const _OrientationLock();

  @override
  State<_OrientationLock> createState() => _OrientationLockState();
}

class _OrientationLockState extends State<_OrientationLock> {
  bool _isLocked = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text("Lock Orientation"),
      subtitle: Text(
        _isLocked ? "Portrait (Locked)" : "Auto-rotate",
        style: context.textTheme.bodySmall?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
      value: _isLocked,
      onChanged: (value) => setState(() => _isLocked = value),
      secondary: Icon(
        _isLocked ? Icons.screen_lock_portrait : Icons.screen_rotation,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
