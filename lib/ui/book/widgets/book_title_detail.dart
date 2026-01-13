import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:leafy/core/constants/enums/book_format.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class BookTitleDetail extends StatelessWidget {
  const BookTitleDetail({
    super.key,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publicationYear,
    required this.bookType,
    this.tags,
  });

  final String title;
  final String? subtitle;
  final String author;
  final String publicationYear;
  final BookFormat bookType;
  final List<String>? tags;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center alignment
        children: [
          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: context.colorScheme.onSurface,
              height: 1.2,
            ),
          ),

          // Subtitle
          if (subtitle != null && subtitle!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(
                fontStyle: FontStyle.italic,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],

          const SizedBox(height: 12),

          // Author (Clickable look)
          InkWell(
            onTap: () => _navigateToSimiliarAuthorBooksScreen(context),
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                author,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Tags
          if (tags != null && tags!.isNotEmpty)
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: _generateTagChips(context: context),
            ),
        ],
      ),
    );
  }

  List<Widget> _generateTagChips({required BuildContext context}) {
    if (tags == null) return [];

    final sortedTags = List<String>.from(tags!);
    sortedTags.sort(
      (a, b) => removeDiacritics(
        a.toLowerCase(),
      ).compareTo(removeDiacritics(b.toLowerCase())),
    );

    return sortedTags
        .map((tag) => _buildTagChip(tag: tag, context: context))
        .toList();
  }

  Widget _buildTagChip({required String tag, required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Text(
        tag,
        style: TextStyle(
          fontSize: 12,
          color: context.colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  void _navigateToSimiliarAuthorBooksScreen(BuildContext context) {
    // Navigation logic
  }
}
