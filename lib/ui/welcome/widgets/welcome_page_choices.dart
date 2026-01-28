import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/ui/welcome/widgets/welcome_choice_button.dart';
import 'package:leafy/ui/welcome/widgets/welcome_open_button.dart';

class WelcomePageChoices extends StatelessWidget {
  const WelcomePageChoices({
    super.key,
    required this.restoreBackup,
    required this.importOpenreadsCsv,
    required this.importGoodreadsCsv,
    required this.importBookwyrmCsv,
    required this.skipImportingBooks,
  });

  final Function() restoreBackup;
  final Function() importOpenreadsCsv;
  final Function() importGoodreadsCsv;
  final Function() importBookwyrmCsv;
  final Function() skipImportingBooks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        LocaleKeys.help_to_get_started.tr(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        WelcomeChoiceButton(
                          description: LocaleKeys.restore_title.tr(),
                          onPressed: restoreBackup,
                        ),
                        WelcomeChoiceButton(
                          description: LocaleKeys.csv_import.tr(),
                          onPressed: importOpenreadsCsv,
                        ),
                      ],
                    ),
                  ),
                ),
                WelcomeOpenButton(
                  description: LocaleKeys.start_adding_books.tr(),
                  onPressed: skipImportingBooks,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
