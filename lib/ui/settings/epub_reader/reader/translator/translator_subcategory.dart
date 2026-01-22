import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/logic/cubit/epub_reader_setting/epub_reader_setting_cubit.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/utils/extensions.dart';

class TranslatorSubcategory extends StatelessWidget {
  const TranslatorSubcategory({super.key});

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
                LocaleKeys.epub_reader_translator_title.tr(),
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const _TargetLanguageSelector(),
            const SizedBox(height: 16),
            const _AutoDetectToggle(),
            const SizedBox(height: 16),
            SwitchListTile(
              title: Text(
                LocaleKeys.epub_reader_translator_double_click_translation.tr(),
              ),
              subtitle: Text(
                LocaleKeys
                    .epub_reader_translator_double_click_translation_description
                    .tr(),
              ),
              value: state.doubleTapTranslate,
              onChanged: (_) {
                context.epubReaderSettingCubit.toggleDoubleTapTranslate();
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ],
        );
      },
    );
  }
}

class _TargetLanguageSelector extends StatelessWidget {
  const _TargetLanguageSelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpubReaderSettingCubit, EpubReaderSettingState>(
      builder: (context, state) {
        return ListTile(
          title: const Text("Translate to"),
          subtitle: Text(
            state.translationLanguage.displayName,
            style: TextStyle(color: context.colorScheme.primary),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            showModalBottomSheet(
              showDragHandle: true,
              context: context,
              builder: (context) => ListView.builder(
                shrinkWrap: true,
                itemCount: TranslationLanguage.values.length,
                itemBuilder: (context, index) {
                  final language = TranslationLanguage.values[index];
                  return ListTile(
                    title: Text(language.displayName),
                    trailing: language == state.translationLanguage
                        ? Icon(Icons.check, color: context.colorScheme.primary)
                        : null,
                    onTap: () {
                      context.epubReaderSettingCubit.updateTranslationLanguage(
                        language,
                      );
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

class _AutoDetectToggle extends StatefulWidget {
  const _AutoDetectToggle();

  @override
  State<_AutoDetectToggle> createState() => _AutoDetectToggleState();
}

class _AutoDetectToggleState extends State<_AutoDetectToggle> {
  bool _isAutoDetect = true;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        LocaleKeys.epub_reader_translator_auto_detect_source_language.tr(),
      ),
      value: _isAutoDetect,
      onChanged: (value) => setState(() => _isAutoDetect = value),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
