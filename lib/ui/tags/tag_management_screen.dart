import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/di/injection.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/logic/cubit/tag_management/tag_management_cubit.dart';
import 'package:leafy/logic/cubit/tag_management/tag_management_state.dart';
import 'package:leafy/ui/tags/widgets/tag_details_sheet.dart';
import 'package:leafy/ui/tags/widgets/tag_form_dialog.dart';

/// Premium Tag Management Screen with Material Design 3
class TagManagementScreen extends StatefulWidget {
  const TagManagementScreen({super.key});

  @override
  State<TagManagementScreen> createState() => _TagManagementScreenState();
}

class _TagManagementScreenState extends State<TagManagementScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Tag> _getSystemTags(List<Tag> allTags) =>
      allTags.where((tag) => tag.isSystem).toList();

  List<Tag> _getUserTags(List<Tag> allTags) =>
      allTags.where((tag) => !tag.isSystem).toList();

  List<Tag> _getPopularTags(List<Tag> allTags, Map<Tag, int> tagStats) {
    final tagsWithStats = allTags.where((tag) {
      final count = tagStats[tag] ?? 0;
      return count > 0;
    }).toList();

    tagsWithStats.sort((a, b) {
      final aCount = tagStats[a] ?? 0;
      final bCount = tagStats[b] ?? 0;
      return bCount.compareTo(aCount);
    });

    return tagsWithStats;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TagManagementCubit>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: context.colorScheme.surface,
            appBar: AppBar(
              title: const Text('Tag Management'),
              backgroundColor: context.colorScheme.surface,
              elevation: 0,
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: context.colorScheme.primary,
                labelColor: context.colorScheme.primary,
                unselectedLabelColor: context.colorScheme.onSurfaceVariant,
                indicatorWeight: 3,
                tabs: const [
                  Tab(icon: Icon(Icons.trending_up_rounded), text: 'Popular'),
                  Tab(icon: Icon(Icons.label_rounded), text: 'User Tags'),
                  Tab(icon: Icon(Icons.verified_rounded), text: 'System'),
                ],
              ),
            ),
            body: BlocConsumer<TagManagementCubit, TagManagementState>(
              listener: (context, state) {
                if (state.error != null && state.tags.isNotEmpty) {
                  // Only show error snackbar if checking not generic load error which might be handled by UI
                  // Actually the Cubit callbacks handle specific action errors.
                  // Global errors on load might be handled here?
                  // For now, let's silence listener unless we want to show load errors.
                  // Just relying on callbacks for actions.
                }
              },
              builder: (context, state) {
                if (state.isLoading && state.tags.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: context.colorScheme.primary,
                    ),
                  );
                }

                return TabBarView(
                  controller: _tabController,
                  children: [
                    _buildPopularTagsTab(context, state.tags, state.tagStats),
                    _buildUserTagsTab(context, state.tags, state.tagStats),
                    _buildSystemTagsTab(context, state.tags, state.tagStats),
                  ],
                );
              },
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () => _showCreateTagDialog(context),
              icon: const Icon(Icons.add_rounded),
              label: const Text('New Tag'),
              backgroundColor: context.colorScheme.primaryContainer,
              foregroundColor: context.colorScheme.onPrimaryContainer,
              elevation: 4,
            ),
          );
        },
      ),
    );
  }

  Widget _buildPopularTagsTab(
    BuildContext context,
    List<Tag> tags,
    Map<Tag, int> stats,
  ) {
    final popularTags = _getPopularTags(tags, stats);
    if (popularTags.isEmpty) {
      return _buildEmptyState(context, 'No tags used yet');
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: popularTags.length,
      itemBuilder: (context, index) {
        final tag = popularTags[index];
        final count = stats[tag] ?? 0;

        return _buildTagListItem(
          context,
          tag,
          count,
          showRank: true,
          rank: index + 1,
        );
      },
    );
  }

  Widget _buildUserTagsTab(
    BuildContext context,
    List<Tag> tags,
    Map<Tag, int> stats,
  ) {
    final userTags = _getUserTags(tags);
    if (userTags.isEmpty) {
      return _buildEmptyState(context, 'No custom tags yet');
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: userTags.length,
      itemBuilder: (context, index) {
        final tag = userTags[index];
        final count = stats[tag] ?? 0;

        return _buildTagGridItem(context, tag, count);
      },
    );
  }

  Widget _buildSystemTagsTab(
    BuildContext context,
    List<Tag> tags,
    Map<Tag, int> stats,
  ) {
    final systemTags = _getSystemTags(tags);
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: systemTags.length,
      itemBuilder: (context, index) {
        final tag = systemTags[index];
        final count = stats[tag] ?? 0;

        return _buildTagListItem(context, tag, count, isSystem: true);
      },
    );
  }

  Widget _buildTagListItem(
    BuildContext context,
    Tag tag,
    int count, {
    bool showRank = false,
    int? rank,
    bool isSystem = false,
  }) {
    final tagColor = tag.color != null
        ? Color(tag.color!)
        : context.colorScheme.primary;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.5,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: tagColor.withValues(alpha: 0.2)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: tagColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: showRank
                ? Text(
                    '#$rank',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: tagColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(tag.icon ?? '🏷️', style: const TextStyle(fontSize: 24)),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                tag.name,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (isSystem)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: context.colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.verified_rounded,
                      size: 14,
                      color: context.colorScheme.onTertiaryContainer,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'System',
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onTertiaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            '$count ${count == 1 ? 'book' : 'books'}',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        trailing: !isSystem
            ? PopupMenuButton(
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: context.colorScheme.onSurfaceVariant,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.edit_rounded, size: 20),
                        const SizedBox(width: 12),
                        const Text('Edit'),
                      ],
                    ),
                    onTap: () => _showEditTagDialog(context, tag),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_rounded,
                          size: 20,
                          color: context.colorScheme.error,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Delete',
                          style: TextStyle(color: context.colorScheme.error),
                        ),
                      ],
                    ),
                    onTap: () => _deleteTag(context, tag),
                  ),
                ],
              )
            : null,
        onTap: () => _showTagDetails(context, tag),
      ),
    );
  }

  Widget _buildTagGridItem(BuildContext context, Tag tag, int count) {
    final tagColor = tag.color != null
        ? Color(tag.color!)
        : context.colorScheme.primary;

    return InkWell(
      onTap: () => _showTagDetails(context, tag),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: tagColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: tagColor.withValues(alpha: 0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                if (tag.icon != null) ...[
                  Text(tag.icon!, style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Text(
                    tag.name,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: tagColor,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '$count ${count == 1 ? 'book' : 'books'}',
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.label_off_rounded,
            size: 64,
            color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  void _showCreateTagDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => TagFormDialog(
        onSave: (newTag) async {
          context.read<TagManagementCubit>().createTag(
            newTag,
            onSuccess: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tag "${newTag.name}" created')),
              );
            },
            onError: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Failed to create tag: $message'),
                  backgroundColor: context.colorScheme.error,
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showEditTagDialog(BuildContext context, Tag tag) {
    showDialog(
      context: context,
      builder: (dialogContext) => TagFormDialog(
        tag: tag,
        onSave: (updatedTag) async {
          context.read<TagManagementCubit>().updateTag(
            updatedTag,
            onSuccess: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tag "${updatedTag.name}" updated')),
              );
            },
            onError: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Failed to update tag: $message'),
                  backgroundColor: context.colorScheme.error,
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showTagDetails(BuildContext context, Tag tag) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      builder: (context) => TagDetailsSheet(tag: tag),
    );
  }

  Future<void> _deleteTag(BuildContext context, Tag tag) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Tag'),
        content: Text('Are you sure you want to delete "${tag.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: context.colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      context.read<TagManagementCubit>().deleteTag(
        tag.id!,
        onSuccess: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Tag "${tag.name}" deleted')));
        },
        onError: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to delete tag: $message'),
              backgroundColor: context.colorScheme.error,
            ),
          );
        },
      );
    }
  }
}
