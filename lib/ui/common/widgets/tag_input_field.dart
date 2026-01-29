import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';
import 'package:leafy/ui/common/widgets/tag_chip.dart';

/// Premium tag input widget with autocomplete and Material Design 3 aesthetics
class TagInputField extends StatefulWidget {
  final List<Tag> selectedTags;
  final Function(List<Tag>) onTagsChanged;
  final String? hintText;
  final int? maxTags;

  const TagInputField({
    super.key,
    required this.selectedTags,
    required this.onTagsChanged,
    this.hintText,
    this.maxTags,
  });

  @override
  State<TagInputField> createState() => _TagInputFieldState();
}

class _TagInputFieldState extends State<TagInputField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<Tag> _availableTags = [];
  List<Tag> _filteredTags = [];
  @override
  void initState() {
    super.initState();
    _loadAvailableTags();
    _controller.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _loadAvailableTags() async {
    final tagRepository = context.read<TagRepository>();
    final result = await tagRepository.getAllActiveTags();

    result.fold(
      (failure) {
        // Handle error
      },
      (tags) {
        setState(() {
          _availableTags = tags;
          _filteredTags = [];
        });
      },
    );
  }

  void _onSearchChanged() {
    final query = _controller.text.toLowerCase().trim();

    if (query.isEmpty) {
      setState(() => _filteredTags = []);
      return;
    }

    setState(() {
      _filteredTags = _availableTags
          .where(
            (tag) =>
                tag.name.toLowerCase().contains(query) &&
                !widget.selectedTags.any((t) => t.id == tag.id),
          )
          .take(8)
          .toList();
    });
  }

  void _addTag(Tag tag) {
    if (widget.maxTags != null &&
        widget.selectedTags.length >= widget.maxTags!) {
      return;
    }

    final newTags = [...widget.selectedTags, tag];
    widget.onTagsChanged(newTags);
    _controller.clear();
    setState(() => _filteredTags = []);
  }

  Future<void> _createAndAddTag(String name) async {
    final tagRepository = context.read<TagRepository>();
    final result = await tagRepository.getOrCreateTag(name.trim());

    result.fold(
      (failure) {
        // Show error snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create tag: ${failure.message}')),
        );
      },
      (tag) {
        _addTag(tag);
        _loadAvailableTags(); // Refresh available tags
      },
    );
  }

  void _removeTag(Tag tag) {
    final newTags = widget.selectedTags.where((t) => t.id != tag.id).toList();
    widget.onTagsChanged(newTags);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Selected tags display
        if (widget.selectedTags.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.5,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: context.colorScheme.outline.withValues(alpha: 0.2),
              ),
            ),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.selectedTags.map((tag) {
                return TagChip(
                  tag: tag,
                  selected: true,
                  onDelete: () => _removeTag(tag),
                );
              }).toList(),
            ),
          ),

        if (widget.selectedTags.isNotEmpty) const SizedBox(height: 12),

        // Input field with autocomplete
        Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _focusNode.hasFocus
                  ? context.colorScheme.primary
                  : context.colorScheme.outline.withValues(alpha: 0.3),
              width: _focusNode.hasFocus ? 2 : 1,
            ),
            boxShadow: _focusNode.hasFocus
                ? [
                    BoxShadow(
                      color: context.colorScheme.primary.withValues(alpha: 0.1),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: widget.hintText ?? 'Add tags...',
              hintStyle: TextStyle(
                color: context.colorScheme.onSurfaceVariant.withValues(
                  alpha: 0.6,
                ),
              ),
              prefixIcon: Icon(
                Icons.label_outline_rounded,
                color: _focusNode.hasFocus
                    ? context.colorScheme.primary
                    : context.colorScheme.onSurfaceVariant,
              ),
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.add_circle_rounded),
                      color: context.colorScheme.primary,
                      onPressed: () {
                        if (_controller.text.trim().isNotEmpty) {
                          _createAndAddTag(_controller.text);
                        }
                      },
                      tooltip: 'Create new tag',
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
            onSubmitted: (value) {
              if (value.trim().isNotEmpty) {
                if (_filteredTags.isNotEmpty) {
                  _addTag(_filteredTags.first);
                } else {
                  _createAndAddTag(value);
                }
              }
            },
          ),
        ),

        // Autocomplete suggestions
        if (_filteredTags.isNotEmpty) ...[
          const SizedBox(height: 8),
          Container(
            constraints: const BoxConstraints(maxHeight: 200),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: _filteredTags.length,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: context.colorScheme.outlineVariant.withValues(
                    alpha: 0.3,
                  ),
                ),
                itemBuilder: (context, index) {
                  final tag = _filteredTags[index];
                  final tagColor = tag.color != null
                      ? Color(tag.color!)
                      : context.colorScheme.primary;

                  return ListTile(
                    dense: true,
                    leading: Container(
                      width: 4,
                      height: 32,
                      decoration: BoxDecoration(
                        color: tagColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    title: Row(
                      children: [
                        if (tag.icon != null) ...[
                          Text(tag.icon!, style: const TextStyle(fontSize: 16)),
                          const SizedBox(width: 8),
                        ],
                        Expanded(
                          child: Text(
                            tag.name,
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.add_rounded,
                      color: tagColor,
                      size: 20,
                    ),
                    onTap: () => _addTag(tag),
                  );
                },
              ),
            ),
          ),
        ],

        // Create new tag hint
        if (_controller.text.trim().isNotEmpty && _filteredTags.isEmpty) ...[
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _createAndAddTag(_controller.text),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: context.colorScheme.primary.withValues(alpha: 0.3),
                  style: BorderStyle.solid,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add_circle_outline_rounded,
                    color: context.colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Create "${_controller.text.trim()}"',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
