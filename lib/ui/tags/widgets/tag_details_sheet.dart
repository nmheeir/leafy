import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/di/injection.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/logic/cubit/tag_details/tag_details_cubit.dart';
import 'package:leafy/logic/cubit/tag_details/tag_details_state.dart';
import 'package:leafy/ui/books/widgets/cards/book_card_list_compact.dart';

class TagDetailsSheet extends StatelessWidget {
  final Tag tag;

  const TagDetailsSheet({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<TagDetailsCubit>();
        if (tag.id != null) {
          cubit.loadBooks(tag.id!);
        }
        return cubit;
      },
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: tag.color != null
                            ? Color(tag.color!).withValues(alpha: 0.2)
                            : context.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          tag.icon ?? '🏷️',
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tag.name,
                            style: context.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (tag.category != null)
                            Text(
                              tag.category!,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 32),
              Expanded(
                child: BlocBuilder<TagDetailsCubit, TagDetailsState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      failure: (message) => Center(
                        child: Text(
                          message,
                          style: TextStyle(color: context.colorScheme.error),
                        ),
                      ),
                      success: (books) {
                        if (books.isEmpty) {
                          return Center(
                            child: Text(
                              'No books with this tag',
                              style: context.textTheme.bodyLarge?.copyWith(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          );
                        }

                        return ListView.builder(
                          controller: scrollController,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          itemCount: books.length,
                          itemBuilder: (context, index) {
                            final book = books[index];
                            return BookCardListCompact(
                              book: book,
                              onPressed: () {
                                // Handle navigation if needed
                              },
                              heroTag: 'tag_book_${book.id}',
                              addBottomPadding: index == books.length - 1,
                            );
                          },
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
