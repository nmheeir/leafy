import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/logic/cubit/tag_filter/tag_filter_cubit.dart';
import 'package:leafy/logic/cubit/tag_filter/tag_filter_state.dart';
import 'package:leafy/ui/common/tag_chip.dart';

class TagFilterSheet extends StatelessWidget {
  final Function(List<Tag> selectedTags, TagFilterMode mode) onFilterChanged;

  const TagFilterSheet({super.key, required this.onFilterChanged});

  static Future<void> show(
    BuildContext context, {
    required Function(List<Tag> selectedTags, TagFilterMode mode)
    onFilterChanged,
    List<Tag>? initialTags,
    TagFilterMode initialMode = TagFilterMode.any,
  }) async {
    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (ctx) => BlocProvider.value(
        value: context.read<TagFilterCubit>(),
        child: DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          snapSizes: [0.5, 0.9],
          expand: false,
          builder: (context, scrollController) => TagFilterSheetView(
            scrollController: scrollController,
            onFilterChanged: onFilterChanged,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class TagFilterSheetView extends StatefulWidget {
  final ScrollController scrollController;
  final Function(List<Tag> selectedTags, TagFilterMode mode) onFilterChanged;

  const TagFilterSheetView({
    super.key,
    required this.scrollController,
    required this.onFilterChanged,
  });

  @override
  State<TagFilterSheetView> createState() => _TagFilterSheetViewState();
}

class _TagFilterSheetViewState extends State<TagFilterSheetView> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TagFilterCubit, TagFilterState>(
      listenWhen: (previous, current) {
        return previous.selectedTags != current.selectedTags ||
            previous.filterMode != current.filterMode;
      },
      listener: (context, state) {
        widget.onFilterChanged(state.selectedTags, state.filterMode);
      },
      child: Column(
        children: [
          _buildHeader(context),
          _buildFilterModeSelector(context),
          _buildSearchBar(context),
          Expanded(child: _buildTagList(context)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return BlocBuilder<TagFilterCubit, TagFilterState>(
      buildWhen: (previous, current) =>
          previous.selectedTags != current.selectedTags,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
              if (state.selectedTags.isNotEmpty)
                TextButton.icon(
                  onPressed: () {
                    context.read<TagFilterCubit>().clearFilters();
                    _searchController.clear();
                  },
                  icon: const Icon(Icons.clear_all_rounded, size: 18),
                  label: const Text('Reset'),
                  style: TextButton.styleFrom(
                    foregroundColor: context.colorScheme.error,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterModeSelector(BuildContext context) {
    return BlocBuilder<TagFilterCubit, TagFilterState>(
      buildWhen: (previous, current) =>
          previous.filterMode != current.filterMode,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: SegmentedButton<TagFilterMode>(
            segments: const [
              ButtonSegment(
                value: TagFilterMode.any,
                label: Text('Any'),
                icon: Icon(Icons.category_rounded, size: 18),
                tooltip: 'Match any selected tag',
              ),
              ButtonSegment(
                value: TagFilterMode.all,
                label: Text('All'),
                icon: Icon(Icons.checklist_rounded, size: 18),
                tooltip: 'Match all selected tags',
              ),
              ButtonSegment(
                value: TagFilterMode.exclude,
                label: Text('Exclude'),
                icon: Icon(Icons.block_rounded, size: 18),
                tooltip: 'Exclude selected tags',
              ),
            ],
            selected: {state.filterMode},
            onSelectionChanged: (Set<TagFilterMode> newSelection) {
              context.read<TagFilterCubit>().changeFilterMode(
                newSelection.first,
              );
            },
            style: const ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          context.read<TagFilterCubit>().search(value);
        },
        decoration: InputDecoration(
          hintText: 'Search tags...',
          prefixIcon: const Icon(Icons.search_rounded),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          filled: true,
          fillColor: context.colorScheme.surfaceContainerHighest.withValues(
            alpha: 0.5,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildTagList(BuildContext context) {
    return BlocBuilder<TagFilterCubit, TagFilterState>(
      builder: (context, state) {
        if (state.status == TagFilterStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == TagFilterStatus.failure) {
          return Center(
            child: Text(state.errorMessage ?? 'Error loading tags'),
          );
        }

        if (state.filteredTags.isEmpty) {
          return Center(
            child: Text(
              'No matching tags found',
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          );
        }

        return ListView(
          controller: widget.scrollController,
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
          children: [
            if (state.selectedTags.isNotEmpty) ...[
              Text(
                'Selected (${state.selectedTags.length})',
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: state.selectedTags.map((tag) {
                  return TagChip(
                    tag: tag,
                    selected: true,
                    onDelete: () =>
                        context.read<TagFilterCubit>().toggleTag(tag),
                  );
                }).toList(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(),
              ),
            ],

            Text(
              'Available Tags',
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: state.filteredTags.map((tag) {
                final isSelected = state.selectedTags.any(
                  (t) => t.id == tag.id,
                );
                return TagChip(
                  key: ValueKey(tag.id),
                  tag: tag,
                  selected: isSelected,
                  onTap: () => context.read<TagFilterCubit>().toggleTag(tag),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
