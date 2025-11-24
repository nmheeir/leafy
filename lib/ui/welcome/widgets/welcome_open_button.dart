import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class WelcomeOpenButton extends StatelessWidget {
  const WelcomeOpenButton({
    super.key,
    required this.description,
    required this.onPressed,
  });

  final String description;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: FilledButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10),
                backgroundColor: context.colorScheme.primaryContainer,
                foregroundColor: context.colorScheme.onPrimaryContainer,
              ),
              onPressed: onPressed,
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
