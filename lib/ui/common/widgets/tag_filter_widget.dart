import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';
import 'package:leafy/ui/common/widgets/tag_chip.dart';

enum TagFilterMode { any, all, exclude }

/// Beautiful Material Design 3 tag filter widget
class TagFilterWidget extends StatefulWidget {
  final Function(List<Tag> selectedTags, TagFilterMode mode) onFilterChanged;
  final List<Tag>? initialTags;
  final TagFilterMode initialMode;

  const TagFilterWidget({
    super.key,
    required this.onFilterChanged,
    this.initialTags,
    this.initialMode = TagFilterMode.any,
  });

  @override
  State<TagFilterWidget> createState() => _TagFilterWidgetState();
}

class _TagFilterWidgetState extends State<TagFilterWidget> {
  List<Tag> _selectedTags = [];
  TagFilterMode _filterMode = TagFilterMode.any;
  List<Tag> _availableTags = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _selectedTags = widget.initialTags ?? [];
    _filterMode = widget.initialMode;
    _loadTags();
  }

  Future<void> _loadTags() async {
    setState(() => _isLoading = true);

    final tagRepository = context.read<TagRepository>();
    final result = await tagRepository.getAllActiveTags();

    result.fold(
      (failure) {
        setState(() => _isLoading = false);
      },
      (tags) {
        setState(() {
          _availableTags = tags;
          _isLoading = false;
        });
      },
    );
  }

  void _toggleTag(Tag tag) {
    setState(() {
      if (_selectedTags.any((t) => t.id == tag.id)) {
        _selectedTags.removeWhere((t) => t.id == tag.id);
      } else {
        _selectedTags.add(tag);
      }
    });
    widget.onFilterChanged(_selectedTags, _filterMode);
  }

  void _changeMode(TagFilterMode mode) {
    setState(() => _filterMode = mode);
    widget.onFilterChanged(_selectedTags, _filterMode);
  }

  void _clearFilters() {
    setState(() => _selectedTags.clear());
    widget.onFilterChanged(_selectedTags, _filterMode);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              color: context.colorScheme.onSurfaceVariant.withValues(
                alpha: 0.4,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(
                  Icons.filter_list_rounded,
                  color: context.colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  'Filter by Tags',
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                if (_selectedTags.isNotEmpty)
                  TextButton.icon(
                    onPressed: _clearFilters,
                    icon: const Icon(Icons.clear_rounded, size: 18),
                    label: const Text('Clear'),
                    style: TextButton.styleFrom(
                      foregroundColor: context.colorScheme.error,
                    ),
                  ),
              ],
            ),
          ),

          // Filter mode selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SegmentedButton<TagFilterMode>(
              segments: [
                ButtonSegment(
                  value: TagFilterMode.any,
                  label: Text('Any'),
                  icon: Icon(Icons.category_rounded, size: 18),
                ),
                ButtonSegment(
                  value: TagFilterMode.all,
                  label: Text('All'),
                  icon: Icon(Icons.checklist_rounded, size: 18),
                ),
                ButtonSegment(
                  value: TagFilterMode.exclude,
                  label: Text('Exclude'),
                  icon: Icon(Icons.block_rounded, size: 18),
                ),
              ],
              selected: {_filterMode},
              onSelectionChanged: (Set<TagFilterMode> newSelection) {
                _changeMode(newSelection.first);
              },
            ),
          ),

          const SizedBox(height: 16),

          // Selected tags
          if (_selectedTags.isNotEmpty) ...[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: context.colorScheme.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected (${_selectedTags.length})',
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _selectedTags.map((tag) {
                      return TagChip(
                        tag: tag,
                        selected: true,
                        onDelete: () => _toggleTag(tag),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Available tags
          Flexible(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _availableTags.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Text(
                        'No tags available',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  )
                : ListView(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    shrinkWrap: true,
                    children: [
                      Text(
                        'All Tags',
                        style: context.textTheme.labelMedium?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _availableTags.map((tag) {
                          final isSelected = _selectedTags.any(
                            (t) => t.id == tag.id,
                          );
                          return TagChip(
                            tag: tag,
                            selected: isSelected,
                            onTap: () => _toggleTag(tag),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

/// Show tag filter bottom sheet
Future<void> showTagFilterSheet(
  BuildContext context, {
  required Function(List<Tag> selectedTags, TagFilterMode mode) onFilterChanged,
  List<Tag>? initialTags,
  TagFilterMode initialMode = TagFilterMode.any,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) => TagFilterWidget(
        onFilterChanged: onFilterChanged,
        initialTags: initialTags,
        initialMode: initialMode,
      ),
    ),
  );
}
