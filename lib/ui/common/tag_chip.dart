import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/domain/tag/entities/tag.dart';

class TagChip extends StatelessWidget {
  final Tag tag;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final bool selected;
  final bool showCount;
  final int? bookCount;

  const TagChip({
    super.key,
    required this.tag,
    this.onTap,
    this.onDelete,
    this.selected = false,
    this.showCount = false,
    this.bookCount,
  });

  @override
  Widget build(BuildContext context) {
    // Use tag color or fallback to primary
    final tagColor = tag.color != null
        ? Color(tag.color!)
        : context.colorScheme.primary;

    final backgroundColor = selected
        ? tagColor.withValues(alpha: 0.2)
        : context.colorScheme.surfaceContainerHighest;

    final borderColor = selected ? tagColor : tagColor.withValues(alpha: 0.3);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: selected ? 2 : 1),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: tagColor.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon (emoji or material icon)
              if (tag.icon != null) ...[
                Text(tag.icon!, style: TextStyle(fontSize: 16, height: 1)),
                const SizedBox(width: 6),
              ],

              // Tag name
              Flexible(
                child: Text(
                  tag.name,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: selected ? tagColor : context.colorScheme.onSurface,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Book count badge
              if (showCount && bookCount != null) ...[
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: tagColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    bookCount.toString(),
                    style: context.textTheme.labelSmall?.copyWith(
                      color: tagColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],

              // Delete button
              if (onDelete != null) ...[
                const SizedBox(width: 4),
                InkWell(
                  onTap: onDelete,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Icon(
                      Icons.close_rounded,
                      size: 16,
                      color: selected
                          ? tagColor
                          : context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Compact version for displaying tags in lists
class TagChipCompact extends StatelessWidget {
  final Tag tag;
  final VoidCallback? onTap;

  const TagChipCompact({super.key, required this.tag, this.onTap});

  @override
  Widget build(BuildContext context) {
    final tagColor = tag.color != null
        ? Color(tag.color!)
        : context.colorScheme.primary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: tagColor.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (tag.icon != null) ...[
              Text(tag.icon!, style: const TextStyle(fontSize: 12)),
              const SizedBox(width: 4),
            ],
            Text(
              tag.name,
              style: context.textTheme.labelSmall?.copyWith(
                color: tagColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
