import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/book_actor/book_actor_cubit.dart';
import 'package:leafy/logic/cubit/current_book_cubit.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/ui/book/widgets/book_detail.dart';
import 'package:leafy/ui/book/widgets/book_detail_long.dart';
import 'package:leafy/ui/book/widgets/book_detailed_date_added_update.dart';
import 'package:leafy/ui/book/widgets/book_screen_app_bar.dart';
import 'package:leafy/ui/book/widgets/book_status_detail.dart';
import 'package:leafy/ui/book/widgets/book_title_detail.dart';
import 'package:leafy/ui/book/widgets/cover_view.dart';
import 'package:leafy/ui/book/widgets/quick_rating_dialog.dart';
import 'package:leafy/ui/extensions/book_format_extension.dart';
import 'package:leafy/ui/extensions/book_status_extension.dart';
import 'package:leafy/ui/test/test_screen.dart';

//TODO: change layout similar to android
class BookScreen extends StatelessWidget {
  const BookScreen({super.key, required this.heroTag});

  final String heroTag;

  void _onLikeTap(BuildContext context, Book book) {
    context.bookActorCubit.toggleFavorite(book);
  }

  Future<void> _changeStatusAction(
    BuildContext context,
    BookStatus status,
    Book book,
  ) async {
    int? rating;

    if (status == BookStatus.unfinished) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => TestEpubReaderScreen()));
      return;
    }

    if (status == BookStatus.inProgress) {
      rating = await showDialog<int?>(
        context: context,
        builder: (_) => const QuickRatingDialog(),
      );
    }

    if (!context.mounted) return;

    context.bookActorCubit.changeReadingStatus(book, rating: rating);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return BlocListener<BookActorCubit, BookActorState>(
      listener: (context, actorState) {
        actorState.maybeWhen(
          success: (message, book) {
            if (book != null) {
              context.currentBookCubit.setBook(book);
            }

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.red),
            );
          },
          orElse: () {},
        );
      },
      child: SelectableRegion(
        selectionControls: materialTextSelectionControls,
        focusNode: FocusNode(),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const BookScreenAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _buildCoverSpace(mediaQuery),
                BlocBuilder<CurrentBookCubit, Book>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitleDetail(state),
                        _buildStatusDetail(state, context),
                        _buildBookFormatDetail(state),
                        _buildPublicationYearDetail(state),
                        _buildPagesDetail(state),
                        // _buildISBNDetail(state),
                        // _buildOLIDDetail(state),
                        const SizedBox(height: 50),
                        _buildDescriptionDetail(state),
                        _buildMyReviewDetail(state),
                        _buildNotesDetail(state),
                        _buildEditDates(state),
                        const SizedBox(height: 100),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BookDetailDateAddedUpdated _buildEditDates(Book state) {
    return BookDetailDateAddedUpdated(
      dateAdded: state.dateAdded,
      dateModified: state.dateModified,
    );
  }

  Widget _buildNotesDetail(Book state) {
    return (state.notes != null && state.notes!.isNotEmpty)
        ? BookDetailLong(title: LocaleKeys.notes.tr(), text: state.notes!)
        : const SizedBox();
  }

  Widget _buildMyReviewDetail(Book state) {
    return (state.myReview != null && state.myReview!.isNotEmpty)
        ? BookDetailLong(
            title: LocaleKeys.my_review.tr(),
            text: state.myReview!,
          )
        : const SizedBox();
  }

  Widget _buildDescriptionDetail(Book state) {
    return (state.description != null && state.description!.isNotEmpty)
        ? BookDetailLong(
            title: LocaleKeys.description.tr(),
            text: state.description!,
          )
        : const SizedBox();
  }

  Widget _buildPagesDetail(Book state) {
    return (state.pages != null)
        ? BookDetail(
            title: LocaleKeys.pages_uppercase.tr(),
            text: (state.pages ?? "").toString(),
          )
        : const SizedBox();
  }

  Widget _buildBookFormatDetail(Book state) {
    return BookDetail(
      title: LocaleKeys.book_format.tr(),
      text: state.bookFormat.text,
    );
  }

  Widget _buildPublicationYearDetail(Book state) {
    return (state.publicationYear != null)
        ? BookDetail(
            title: LocaleKeys.enter_publication_year.tr(),
            text: (state.publicationYear ?? "").toString(),
          )
        : const SizedBox();
  }

  Widget _buildCoverSpace(MediaQueryData mediaQuery) {
    return BlocBuilder<CurrentBookCubit, Book>(
      buildWhen: (previous, current) => previous.blurHash != current.blurHash,
      builder: (context, state) {
        return state.hasCover == true
            ? Center(
                child: CoverView(heroTag: heroTag, book: state),
              )
            : SizedBox(
                height: mediaQuery.padding.top + AppBar().preferredSize.height,
              );
      },
    );
  }

  BookTitleDetail _buildTitleDetail(Book state) {
    return BookTitleDetail(
      title: state.title.toString(),
      subtitle: state.subtitle,
      author: state.author.toString(),
      publicationYear: (state.publicationYear ?? "").toString(),
      tags: state.tags?.split('|||||'),
      bookType: state.bookFormat,
    );
  }

  BookStatusDetail _buildStatusDetail(Book state, BuildContext context) {
    return BookStatusDetail(
      book: state,
      statusIcon: state.status.icon,
      statusText: state.status.text,
      onLikeTap: () => _onLikeTap(context, state),
      showChangeStatus:
          (state.status == BookStatus.inProgress ||
          state.status == BookStatus.forLater ||
          state.status == BookStatus.unfinished),
      changeStatusText: state.status.changeStatus,
      changeStatusAction: () {
        _changeStatusAction(context, state.status, state);
      },
      showRatingAndLike: state.status == BookStatus.finished,
    );
  }
}
