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
///
/// Tags are managed independently from the Book entity since book.tags field
/// has been removed. Tags are saved directly via use cases when the book is saved.
class BookTagsInput extends StatefulWidget {
  /// Callback when tags are changed - parent can use this to track changes
  final void Function(List<Tag> tags)? onTagsChanged;

  const BookTagsInput({super.key, this.onTagsChanged});

  @override
  State<BookTagsInput> createState() => BookTagsInputState();
}

class BookTagsInputState extends State<BookTagsInput> {
  List<Tag> _selectedTags = [];
  bool _isLoading = true;

  /// Get current selected tags (can be accessed by parent via GlobalKey)
  List<Tag> get selectedTags => _selectedTags;

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
          widget.onTagsChanged?.call(tags);
        },
      );
    } else {
      // New book - start with empty tags
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _handleTagsChanged(List<Tag> tags) {
    setState(() {
      _selectedTags = tags;
    });
    widget.onTagsChanged?.call(tags);
  }

  /// Save tags to database for the given book ID
  /// This should be called by the parent after the book is saved
  Future<void> saveTagsToBook(int bookId) async {
    final bookTagRepo = context.read<BookTagRepository>();
    final tagRepo = context.read<TagRepository>();

    // First, remove all existing tags
    await bookTagRepo.removeAllTagsFromBook(bookId);

    // Then add each selected tag
    for (final tag in _selectedTags) {
      if (tag.id != null) {
        await bookTagRepo.addTagToBookById(bookId, tag.id!);
      } else {
        // If tag doesn't have ID, need to get or create it first
        final result = await tagRepo.getOrCreateTag(tag.name);
        result.fold(
          (failure) {
            // Skip on failure
          },
          (createdTag) async {
            if (createdTag.id != null) {
              await bookTagRepo.addTagToBookById(bookId, createdTag.id!);
            }
          },
        );
      }
    }
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
