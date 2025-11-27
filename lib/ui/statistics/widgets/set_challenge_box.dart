import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/ui/statistics/widgets/challenge_dialog.dart';

class SetChallengeBox extends StatelessWidget {
  const SetChallengeBox({
    super.key,
    required this.setChallenge,
    required this.year,
    this.booksTarget,
    this.pagesTarget,
  });

  final Function(int, int, int) setChallenge;
  final int year;
  final int? booksTarget;
  final int? pagesTarget;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: InkWell(
        borderRadius: BorderRadius.circular(cornerRadius),
        onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return ChallengeDialog(
              setChallenge: setChallenge,
              year: year,
              booksTarget: booksTarget,
              pagesTarget: pagesTarget,
            );
          },
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  LocaleKeys.click_here_to_set_challenge.tr(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
