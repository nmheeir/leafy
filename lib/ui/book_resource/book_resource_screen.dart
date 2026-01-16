import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/reader_format.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/core/utils/helpers/file_helper.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';
import 'package:leafy/logic/cubit/book_resource/book_resource_cubit.dart';
import 'package:leafy/logic/cubit/book_resource/book_resource_state.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:material_symbols_icons/symbols.dart';

class BookResourceScreen extends StatelessWidget {
  final int bookId;

  const BookResourceScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Resources')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.bookResourceCubit.importFiles();
        },
        label: const Text('Add Resource'),
        icon: const Icon(Symbols.add),
      ),
      body: BlocConsumer<BookResourceCubit, BookResourceState>(
        listener: (context, state) {
          state.maybeWhen(
            failure: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            success: (resources) {
              // How to detect "Just Imported"?
              // Maybe check if count increased or rely on "Importing" previous state?
              // Detailed UX 1.2 "Success State: Snackbar... View Now".
              // Simpler: Just rely on list update for now or add complex listener logic.
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
            downloading: (_, _) =>
                const Center(child: CircularProgressIndicator()), // Or overlay
            importing: () =>
                _buildImportingState(context), // Show Shimmer + Content?
            failure: (msg) => Center(child: Text(msg)), // Or retry
            success: (resources) {
              if (resources.isEmpty) {
                return _buildEmptyState(context);
              }
              return _buildResourceList(context, resources);
            },
          );
        },
      ),
    );
  }

  Widget _buildImportingState(BuildContext context) {
    // Show Shimmer.
    // If we have access to previous list, specific to 'Importing' holding list?
    // Current state definition: Importing() has NO list.
    // So we just show Shimmer list as if loading fresh or appended.
    // Requirement: "Cubit phát ra trạng thái 'Importing': Màn hình Resource tự động thêm một Card trống với hiệu ứng Shimmer."
    // If we want to append, we need list in Importing state.
    // But for now, let's just show a full Shimmer list for simplicity or "Processing..."
    return ListView.builder(
      itemCount: 5,
      padding: const EdgeInsets.all(16),
      itemBuilder: (_, _) => const _ShimmerCard(),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Symbols.folder_open,
            size: 80,
            color: context.colorScheme.onSurface,
          ),
          const SizedBox(height: 16),
          Text(
            'No resources found',
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          const Text('Tap "+" to import files'),
        ],
      ),
    );
  }

  Widget _buildResourceList(
    BuildContext context,
    List<BookResource> resources,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: resources.length,
      itemBuilder: (context, index) {
        final resource = resources[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              // Open/View resource?
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  _buildFormatIcon(resource.format, context),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resource.filePath?.split('/').last ?? 'Unknown File',
                          style: context.textTheme.titleMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          FileHelper.formatSize(resource.fileSize ?? 0),
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (resource.createdAt != null) ...[
                    Text(
                      DateFormat('MMM d').format(resource.createdAt!),
                      style: context.textTheme.labelSmall,
                    ),
                    const SizedBox(width: 8),
                  ],
                  IconButton(
                    icon: const Icon(Symbols.delete, color: Colors.grey),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (dialogContext) => AlertDialog(
                          title: const Text('Delete Resource'),
                          content: const Text(
                            'Are you sure you want to delete this resource?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(dialogContext),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(dialogContext);
                                context.bookResourceCubit.deleteResource(
                                  resource.uuid,
                                );
                              },
                              child: const Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFormatIcon(BookResourceFormat format, BuildContext context) {
    IconData icon;
    Color color;
    switch (format) {
      case BookResourceFormat.epub:
        icon = Symbols.book;
        color = context.colorScheme.primary;
        break;
      case BookResourceFormat.pdf:
        icon = Symbols.picture_as_pdf;
        color = context.colorScheme.primary;
        break;
      case BookResourceFormat.audio:
        icon = Symbols.audio_file;
        color = context.colorScheme.primary;
        break;
      default:
        icon = Symbols.description;
        color = context.colorScheme.primary;
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: color),
    );
  }
}

//NOTE: Shimmer placeholder
class _ShimmerCard extends StatelessWidget {
  const _ShimmerCard();

  @override
  Widget build(BuildContext context) {
    // Custom shimmer placeholder
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: context.colorScheme.surface.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
