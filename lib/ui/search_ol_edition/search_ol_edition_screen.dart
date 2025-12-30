import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/book_status.dart';
import 'package:leafy/data/models/ol_edition_result.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/entities/reading.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/default_book_format_cubit.dart';
import 'package:leafy/logic/cubit/default_book_tag_cubit.dart';
import 'package:leafy/logic/cubit/edit_book_cubit.dart';
import 'package:leafy/ui/book_editor/book_editor_screen.dart';
import 'package:leafy/ui/search_ol_edition/widgets/ol_editions_grid.dart';

// NOTE: Khi thoát ra ngoài không cancel request tới API
class SearchOLEditionsScreen extends StatefulWidget {
  const SearchOLEditionsScreen({
    super.key,
    required this.editions,
    required this.title,
    this.subtitle,
    required this.author,
    required this.pagesMedian,
    required this.isbn,
    required this.olid,
    required this.firstPublishYear,
    required this.status,
  });

  final List<String> editions;
  final String title;
  final String? subtitle;
  final String author;
  final int? pagesMedian;
  final List<String>? isbn;
  final String? olid;
  final int? firstPublishYear;
  final BookStatus status;

  @override
  State<SearchOLEditionsScreen> createState() => _SearchOLEditionsScreenState();
}

class _SearchOLEditionsScreenState extends State<SearchOLEditionsScreen> {
  Uint8List? editionCoverPreview;
  bool _onlyEditionsWithCovers = false;

  void _saveEdition({
    required OLEditionResult result,
    required int? cover,
    String? work,
  }) {
    final defaultBookFormat = context.read<DefaultBookFormatCubit>().state;
    final defaultTags = context.read<DefaultBookTagCubit>().state;

    final addDate = DateTime.now();

    final book = Book(
      title: result.title!,
      subtitle: result.subtitle,
      author: widget.author,
      pages: result.numberOfPages,
      status: widget.status,
      favorite: false,
      isbn: (result.isbn13 != null && result.isbn13!.isNotEmpty)
          ? result.isbn13![0]
          : (result.isbn10 != null && result.isbn10!.isNotEmpty)
          ? result.isbn10![0]
          : null,
      olid: (result.key != null) ? result.key!.replaceAll('/books/', '') : null,
      publicationYear: widget.firstPublishYear,
      bookFormat: result.physicalFormat ?? defaultBookFormat,
      readings: List<Reading>.empty(growable: true),
      tags: defaultTags.isNotEmpty == true ? defaultTags.join('|||||') : null,
      dateAdded: addDate,
      dateModified: addDate,
    );

    context.read<EditBookCubit>().setBook(book);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookEditorScreen(
          fromOpenLibrary: true,
          fromOpenLibraryEdition: true,
          work: work,
          coverOpenLibraryID: cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.choose_edition.tr(),
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Switch.adaptive(
                        value: _onlyEditionsWithCovers,
                        onChanged: (value) {
                          setState(() {
                            _onlyEditionsWithCovers = value;
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          LocaleKeys.only_editions_with_covers.tr(),
                          style: const TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                // UniqueKey() is used to force the widget to rebuild
                OLEditionsGrid(
                  key: UniqueKey(),
                  editions: widget.editions,
                  saveEdition: _saveEdition,
                  onlyEditionsWithCovers: _onlyEditionsWithCovers,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
