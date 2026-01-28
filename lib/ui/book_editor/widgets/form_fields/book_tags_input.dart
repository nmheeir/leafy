import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/domain/tag/entities/tag.dart';
import 'package:leafy/domain/tag/repositories/book_tag_repository.dart';
import 'package:leafy/domain/tag/repositories/tag_repository.dart';
import 'package:leafy/logic/cubit/edit_book_cubit.dart';
import 'package:leafy/ui/common/widgets/tag_input_field.dart';

/// Book Tags Input Widget for Book Editor
///
/// This widget handles tag creation and editing in the book editor.
/// It integrates with the new tag system using TagRepository and BookTagRepository.
class BookTagsInput extends StatefulWidget {
  const BookTagsInput({super.key});

  @override
  State<BookTagsInput> createState() => _BookTagsInputState();
}

class _BookTagsInputState extends State<BookTagsInput> {
  List<Tag> _selectedTags = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadExistingTags();
  }

  Future<void> _loadExistingTags() async {
    final book = context.read<EditBookCubit>().state;

    // If editing existing book with ID, load tags from database
    if (book.id != null) {
      final bookTagRepo = context.read<BookTagRepository>();
      final result = await bookTagRepo.getTagsForBook(book.id!);

      result.fold(
        (failure) {
          // On failure, just use empty list
          setState(() {
            _selectedTags = [];
            _isLoading = false;
          });
        },
        (tags) {
          setState(() {
            _selectedTags = tags;
            _isLoading = false;
          });
        },
      );
    } else {
      // New book - check if there are legacy tags to migrate
      if (book.tags != null && book.tags!.isNotEmpty) {
        await _migrateLegacyTags(book.tags!);
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _migrateLegacyTags(String legacyTags) async {
    final tagNames = legacyTags.split('|||||');
    final tagRepo = context.read<TagRepository>();
    final List<Tag> tags = [];

    for (final name in tagNames) {
      if (name.trim().isEmpty) continue;

      final result = await tagRepo.getOrCreateTag(name.trim());
      result.fold(
        (failure) {
          // Skip on failure
        },
        (tag) {
          tags.add(tag);
        },
      );
    }

    setState(() {
      _selectedTags = tags;
    });
  }

  void _handleTagsChanged(List<Tag> tags) {
    setState(() {
      _selectedTags = tags;
    });

    // Update the book's legacy tags field for backward compatibility
    // This will be used during save to create the associations
    final tagNames = tags.map((t) => t.name).join('|||||');
    context.read<EditBookCubit>().emit(
      context.read<EditBookCubit>().state.copyWith(
        tags: tagNames.isEmpty ? null : tagNames,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TagInputField(
        selectedTags: _selectedTags,
        onTagsChanged: _handleTagsChanged,
        maxTags: 20,
      ),
    );
  }
}
