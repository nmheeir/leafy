import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/core/constants/enums/reader_format.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book_resource/entities/book_resource.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/book_progress/book_progress_cubit.dart';
import 'package:leafy/logic/cubit/book_progress/book_progress_state.dart';
import 'package:leafy/logic/cubit/book_resource/book_resource_cubit.dart';
import 'package:leafy/logic/cubit/book_resource/book_resource_state.dart';

import 'package:leafy/ui/book/widgets/celebration_dialog.dart';
import 'package:leafy/ui/epub_reader/epub_reader_screen.dart';

class BookReaderLauncherButton extends StatelessWidget {
  const BookReaderLauncherButton({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    // Only show actions for relevant statuses
    if (book.status == BookStatus.finished) {
      return const SizedBox.shrink();
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<BookResourceCubit, BookResourceState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (resources) {
                // Auto load progress if we have exactly one valid local file
                // and we are simply updating state.
                // However, for optimization, we might defer this until viewed.
                // But keeping previous behavior:
                if (resources.length == 1) {
                  final resource = resources.first;
                  if (resource.filePath != null &&
                      File(resource.filePath!).existsSync()) {
                    context.bookProgressCubit.loadProgress(resource.filePath!);
                  }
                }
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: BlocBuilder<BookResourceCubit, BookResourceState>(
        builder: (context, resourceState) {
          return BlocBuilder<BookProgressCubit, BookProgressState>(
            builder: (context, progressState) {
              return _buildContent(context, resourceState, progressState);
            },
          );
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    BookResourceState resourceState,
    BookProgressState progressState,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: resourceState.maybeWhen(
        initial: () => const SizedBox.shrink(),
        loading: () => const Center(child: CircularProgressIndicator()),
        importing: () =>
            _buildActionButton(context, text: "Importing...", isLoading: true),
        downloading: (_, progress) => _buildActionButton(
          context,
          text:
              "${(progress * 100).toInt()}% ${LocaleKeys.downloading.tr()}...",
          downloadProgress: progress,
          isLoading: true,
        ),
        success: (resources) {
          return _buildSmartAction(context, resources, progressState);
        },
        failure: (error) => _buildActionButton(
          context,
          text: LocaleKeys.error.tr(),
          icon: Icons.error_outline,
          onTap: () => context.bookResourceCubit.loadResources(book.id ?? 0),
        ),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildSmartAction(
    BuildContext context,
    List<BookResource> resources,
    BookProgressState progressState,
  ) {
    // Case 0: No resources
    if (resources.isEmpty) {
      return _buildActionButton(
        context,
        text: "Import Book",
        icon: Icons.upload_file,
        onTap: () => context.bookResourceCubit.importFiles(),
      );
    }

    // Case 1: Single Resource
    if (resources.length == 1) {
      final resource = resources.first;
      final fileExists =
          resource.filePath != null && File(resource.filePath!).existsSync();

      if (fileExists) {
        String text = "Start Reading";
        double? progress;

        if (progressState is BookProgressLoaded) {
          if (progressState.progress > 0) {
            text = "Continue Reading";
            progress = progressState.progress;
          }
        }

        return _buildActionButton(
          context,
          text: text,
          readingProgress: progress,
          onTap: () => _openReader(context, resource),
        );
      } else if (resource.url != null) {
        return _buildActionButton(
          context,
          text: "Download",
          icon: Icons.download,
          onTap: () => context.bookResourceCubit.downloadResource(resource),
        );
      } else {
        return _buildActionButton(
          context,
          text: "Import Book", // Fallback for invalid single resource
          icon: Icons.upload_file,
          onTap: () => context.bookResourceCubit.importFiles(),
        );
      }
    }

    // Case > 1: Multiple Resources
    return _buildActionButton(
      context,
      text: "Start Reading",
      icon: Icons.expand_more, // Indicate selection
      onTap: () => _showResourceSelectionSheet(context, resources),
    );
  }

  Future<void> _showResourceSelectionSheet(
    BuildContext context,
    List<BookResource> resources,
  ) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Select Version",
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ...resources.map((resource) {
                final fileExists =
                    resource.filePath != null &&
                    File(resource.filePath!).existsSync();

                String subtitle = "";
                if (fileExists) {
                  subtitle = "Available locally";
                } else if (resource.url != null) {
                  subtitle = "Tap to download";
                } else {
                  subtitle = "Missing file";
                }

                IconData icon = Icons.book;
                if (resource.format == BookResourceFormat.pdf) {
                  icon = Icons.picture_as_pdf;
                }

                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: context.colorScheme.primaryContainer,
                    child: Icon(icon, color: context.colorScheme.primary),
                  ),
                  title: Text(resource.storageType.name.toUpperCase()),
                  subtitle: Text(subtitle),
                  trailing: fileExists
                      ? Icon(Icons.arrow_forward_ios, size: 16)
                      : Icon(Icons.download, size: 20),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 4,
                  ),
                  onTap: () {
                    Navigator.pop(sheetContext); // Close sheet
                    if (fileExists) {
                      _openReader(context, resource);
                    } else if (resource.url != null) {
                      context.bookResourceCubit.downloadResource(resource);
                    }
                  },
                );
              }),
              const SizedBox(height: 16),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: context.colorScheme.surfaceContainerHigh,
                  child: Icon(Icons.add, color: context.colorScheme.onSurface),
                ),
                title: Text("Import another version"),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 4,
                ),
                onTap: () {
                  Navigator.pop(sheetContext);
                  context.bookResourceCubit.importFiles();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _openReader(BuildContext context, BookResource resource) async {
    final result = await Navigator.of(context).push<Map<String, dynamic>>(
      MaterialPageRoute(
        builder: (context) => EpubReaderScreen(filePath: resource.filePath!),
      ),
    );

    if (context.mounted) {
      if (result != null && result['is_just_finished'] == true) {
        await context.currentBookCubit.refreshBook();
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (context) => const CelebrationDialog(),
          );
        }
      } else {
        context.currentBookCubit.refreshBook();
        context.bookProgressCubit.loadProgress(resource.filePath!);
      }
    }
  }

  // Generalized Button Widget
  Widget _buildActionButton(
    BuildContext context, {
    required String text,
    IconData? icon,
    VoidCallback? onTap,
    bool isLoading = false,
    double? downloadProgress,
    double? readingProgress,
  }) {
    const double buttonHeight = 56.0;

    return Container(
      height: buttonHeight,
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.colorScheme.surfaceContainerHigh,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isLoading ? null : onTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Progress Background
                if (downloadProgress != null ||
                    (readingProgress != null && readingProgress > 0))
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FractionallySizedBox(
                        widthFactor: downloadProgress ?? readingProgress,
                        child: Container(
                          color: downloadProgress != null
                              ? context.colorScheme.primary.withValues(
                                  alpha: 0.15,
                                )
                              : context.colorScheme.tertiaryContainer
                                    .withValues(alpha: 0.4),
                        ),
                      ),
                    ),
                  ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isLoading && downloadProgress == null) ...[
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: context.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                      if (icon != null && !isLoading) ...[
                        Icon(
                          icon,
                          color: context.colorScheme.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                      ],
                      Text(
                        text,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isLoading
                              ? context.colorScheme.primary
                              : context.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
