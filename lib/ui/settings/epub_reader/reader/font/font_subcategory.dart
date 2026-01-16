import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class FontSubcategory extends StatelessWidget {
  const FontSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(title: "Typography"),
        const _FontFamilySelector(),
        const Divider(indent: 16, endIndent: 16, height: 32),
        const _FontSizeSelector(),
        const Divider(indent: 16, endIndent: 16, height: 32),
        const _FontWeightSelector(),
        const Divider(indent: 16, endIndent: 16, height: 32),
        const _FontStyleToggle(),
        const Divider(indent: 16, endIndent: 16, height: 32),
        const _LetterSpacingSelector(),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
      child: Text(
        title,
        style: context.textTheme.titleSmall?.copyWith(
          color: context.colorScheme.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _FontFamilySelector extends StatefulWidget {
  const _FontFamilySelector();

  @override
  State<_FontFamilySelector> createState() => _FontFamilySelectorState();
}

class _FontFamilySelectorState extends State<_FontFamilySelector> {
  String selectedFont = "Serif";
  final List<String> fonts = [
    "Serif",
    "Sans-serif",
    "Monospace",
    "Literata",
    "Montserrat",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text("Font Family", style: context.textTheme.labelLarge),
        ),
        SizedBox(
          height: 48,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: fonts.length,
            itemBuilder: (context, index) {
              final font = fonts[index];
              final isSelected = selectedFont == font;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  label: Text(font),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => selectedFont = font);
                    }
                  },
                  selectedColor: context.colorScheme.primaryContainer,
                  labelStyle: TextStyle(
                    color: isSelected
                        ? context.colorScheme.primary
                        : context.colorScheme.onSurface,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _FontSizeSelector extends StatefulWidget {
  const _FontSizeSelector();

  @override
  State<_FontSizeSelector> createState() => _FontSizeSelectorState();
}

class _FontSizeSelectorState extends State<_FontSizeSelector> {
  double fontSize = 18;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Font Size", style: context.textTheme.labelLarge),
              Text(
                "${fontSize.toInt()} sp",
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: fontSize > 12
                  ? () => setState(() => fontSize--)
                  : null,
            ),
            Expanded(
              child: Slider(
                value: fontSize,
                min: 12,
                max: 40,
                divisions: 28,
                onChanged: (value) => setState(() => fontSize = value),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: fontSize < 40
                  ? () => setState(() => fontSize++)
                  : null,
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    );
  }
}

class _FontWeightSelector extends StatefulWidget {
  const _FontWeightSelector();

  @override
  State<_FontWeightSelector> createState() => _FontWeightSelectorState();
}

class _FontWeightSelectorState extends State<_FontWeightSelector> {
  double thickness = 400; // Normal

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Font Thickness", style: context.textTheme.labelLarge),
              Text(
                _getWeightLabel(thickness),
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Slider(
          value: thickness,
          min: 100,
          max: 900,
          divisions: 8,
          onChanged: (value) => setState(() => thickness = value),
        ),
      ],
    );
  }

  String _getWeightLabel(double value) {
    if (value <= 200) return "Light";
    if (value <= 400) return "Normal";
    if (value <= 600) return "Medium";
    if (value <= 700) return "Bold";
    return "Extra Bold";
  }
}

class _FontStyleToggle extends StatefulWidget {
  const _FontStyleToggle();

  @override
  State<_FontStyleToggle> createState() => _FontStyleToggleState();
}

class _FontStyleToggleState extends State<_FontStyleToggle> {
  bool isItalic = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text("Italic Style"),
      subtitle: const Text("Apply italic style to text"),
      value: isItalic,
      onChanged: (value) => setState(() => isItalic = value),
      secondary: Icon(
        Icons.format_italic,
        color: isItalic ? context.colorScheme.primary : null,
      ),
    );
  }
}

class _LetterSpacingSelector extends StatefulWidget {
  const _LetterSpacingSelector();

  @override
  State<_LetterSpacingSelector> createState() => _LetterSpacingSelectorState();
}

class _LetterSpacingSelectorState extends State<_LetterSpacingSelector> {
  double spacing = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Letter Spacing", style: context.textTheme.labelLarge),
              Text(
                spacing.toStringAsFixed(1),
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Slider(
          value: spacing,
          min: -2.0,
          max: 10.0,
          divisions: 60,
          onChanged: (value) => setState(() => spacing = value),
        ),
      ],
    );
  }
}
