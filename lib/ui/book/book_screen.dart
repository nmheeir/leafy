import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/di/injection.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/entities/book_with_details.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/book_actor/book_actor_cubit.dart';
import 'package:leafy/logic/cubit/book_detail/book_detail_cubit.dart';
import 'package:leafy/logic/cubit/book_resource/book_resource_cubit.dart';

import 'package:leafy/ui/book/widgets/book_detail.dart';
import 'package:leafy/ui/book/widgets/book_detail_long.dart';
import 'package:leafy/ui/book/widgets/book_detailed_date_added_update.dart';
import 'package:leafy/ui/book/widgets/book_reader_launcher_button.dart';
import 'package:leafy/ui/book/widgets/book_screen_app_bar.dart';
import 'package:leafy/ui/book/widgets/book_status_detail.dart';
import 'package:leafy/ui/book/widgets/book_title_detail.dart';
import 'package:leafy/ui/book/widgets/cover_view.dart';
import 'package:leafy/ui/book/widgets/reading_stats_card.dart';
import 'package:leafy/ui/common/image_placeholder.dart';
import 'package:leafy/ui/extensions/book_format_extension.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({
    super.key,
    required this.heroTag,
    required this.bookId,
    this.initialBook,
  });

  final String heroTag;
  final int bookId;
  final Book? initialBook;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final cubit = getIt<BookDetailCubit>();

            if (initialBook != null) {
              cubit.setBook(initialBook!);
            }

            cubit.loadBook(bookId);
            return cubit;
          },
        ),
        BlocProvider(
          create: (context) {
            final cubit = getIt<BookResourceCubit>();
            cubit.loadResources(bookId);
            return cubit;
          },
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          // Handle BookActor actions (edit, delete, etc.)
          BlocListener<BookActorCubit, BookActorState>(
            listener: (context, actorState) {
              actorState.maybeWhen(
                success: (message, book) {
                  if (book != null) {
                    context.read<BookDetailCubit>().updateBook(book);
                  }

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(message)));
                },
                failure: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: SelectableRegion(
          selectionControls: materialTextSelectionControls,
          focusNode: FocusNode(),
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: const BookScreenAppBar(),
            body: BlocBuilder<BookDetailCubit, BookDetailState>(
              builder: (context, state) {
                return state.maybeMap(
                  loading: (_) =>
                      const Center(child: CircularProgressIndicator()),
                  error: (errorState) =>
                      Center(child: Text(errorState.message)),
                  loaded: (loadedState) => _buildContent(
                    context,
                    mediaQuery,
                    loadedState.bookWithDetails,
                  ),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    MediaQueryData mediaQuery,
    BookWithDetails details,
  ) {
    final book = details.book;

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCoverSpace(mediaQuery, book),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTitleDetail(details),
              BookStatusDetail(book: book),
              BookReaderLauncherButton(book: book),
              if (book.id != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ReadingStatsCard(
                    bookId: book.id!,
                    bookTitle: book.title,
                  ),
                ),
              _buildBookFormatDetail(book),
              _buildPublicationYearDetail(book),
              _buildPagesDetail(book),
              const SizedBox(height: 50),
              _buildDescriptionDetail(book),
              _buildMyReviewDetail(book),
              _buildNotesDetail(book),
              _buildEditDates(book),
              const SizedBox(height: 100),
            ],
          ),
        ],
      ),
    );
  }

  BookDetailDateAddedUpdated _buildEditDates(Book book) {
    return BookDetailDateAddedUpdated(
      dateAdded: book.dateAdded,
      dateModified: book.dateModified,
    );
  }

  Widget _buildNotesDetail(Book book) {
    return (book.notes != null && book.notes!.isNotEmpty)
        ? BookDetailLong(title: LocaleKeys.notes.tr(), text: book.notes!)
        : const SizedBox();
  }

  Widget _buildMyReviewDetail(Book book) {
    return (book.myReview != null && book.myReview!.isNotEmpty)
        ? BookDetailLong(title: LocaleKeys.my_review.tr(), text: book.myReview!)
        : const SizedBox();
  }

  Widget _buildDescriptionDetail(Book book) {
    return (book.description != null && book.description!.isNotEmpty)
        ? BookDetailLong(
            title: LocaleKeys.description.tr(),
            text: book.description!,
          )
        : const SizedBox();
  }

  Widget _buildPagesDetail(Book book) {
    return (book.pages != null)
        ? BookDetail(
            title: LocaleKeys.pages_uppercase.tr(),
            text: (book.pages ?? "").toString(),
          )
        : const SizedBox();
  }

  Widget _buildBookFormatDetail(Book book) {
    return BookDetail(
      title: LocaleKeys.book_format.tr(),
      text: book.bookFormat.text,
    );
  }

  Widget _buildPublicationYearDetail(Book book) {
    return (book.publicationYear != null)
        ? BookDetail(
            title: LocaleKeys.enter_publication_year.tr(),
            text: (book.publicationYear ?? "").toString(),
          )
        : const SizedBox();
  }

  Widget _buildCoverSpace(MediaQueryData mediaQuery, Book book) {
    return book.hasCover == true
        ? Center(
            child: CoverView(heroTag: heroTag, book: book),
          )
        : Container(
            padding: EdgeInsets.fromLTRB(
              50,
              mediaQuery.padding.top + 20,
              50,
              50,
            ),
            height:
                (mediaQuery.size.height / 2.5) + mediaQuery.padding.top + 20,
            width: double.infinity,
            child: const ImagePlaceholder(borderRadius: 10),
          );
  }

  Widget _buildTitleDetail(BookWithDetails details) {
    if (details.id == null) return const SizedBox();

    return BookTitleDetail(
      title: details.title,
      subtitle: details.book.subtitle,
      author: details.book.author,
      publicationYear: (details.book.publicationYear ?? "").toString(),
      tags: details.tags,
      bookType: details.book.bookFormat,
    );
  }
}
