import 'dart:io';
import 'package:diacritic/diacritic.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/core/utils/helpers/helpers.dart';
import 'package:leafy/data/models/book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/main.dart';
import 'package:material_symbols_icons/symbols.dart';


enum RatingDisplayType { bar, number }

class BookCardListCompact extends StatelessWidget {
  const BookCardListCompact({
    super.key,
    required this.book,
    required this.onPressed,
    required this.heroTag,
    required this.addBottomPadding,
    this.onLongPressed,
    this.cardColor,
    // --- THAM SỐ MỚI THAY THẾ CHO BLOC STATE ---
    this.showSortAttribute = false,
    this.currentSortType,
    this.showTags = false,
    this.showBookFormatIcon = false,
    this.ratingDisplayType = RatingDisplayType.bar,
  });

  final Book book;
  final String heroTag;
  final bool addBottomPadding;
  final Function() onPressed;
  final Function()? onLongPressed;
  final Color? cardColor;

  // --- CÁC THAM SỐ TRẠNG THÁI MỚI ---
  final bool showSortAttribute;
  final SortType? currentSortType;
  final bool showTags;
  final bool showBookFormatIcon;
  final RatingDisplayType ratingDisplayType;

  Widget _buildSortAttribute() {
    // Không cần BlocBuilder, chỉ cần kiểm tra tham số
    if (!showSortAttribute || currentSortType == null) {
      return const SizedBox();
    }
    // Không cần switch (book.status) vì logic đã được đơn giản hóa
    return _buildSortAttributeContent(currentSortType!);
  }

  Widget _buildSortAttributeContent(SortType sortType) {
    // ...existing code...
    if (sortType == SortType.byPages) {
      return (book.pages != null) ? _buildPagesAttribute() : const SizedBox();
    } else if (sortType == SortType.byStartDate) {
      final latestStartDate = getLatestStartDate(book);

      return (latestStartDate != null)
          ? _buildDateAttribute(
              latestStartDate,
              LocaleKeys.started_on_date.tr(),
              false,
            )
          : const SizedBox();
    } else if (sortType == SortType.byFinishDate) {
      final latestFinishDate = getLatestFinishDate(book);

      return (latestFinishDate != null)
          ? _buildDateAttribute(
              latestFinishDate,
              LocaleKeys.finished_on_date.tr(),
              false,
            )
          : const SizedBox();
    } else if (sortType == SortType.byDateAdded) {
      return _buildDateAttribute(
        book.dateAdded,
        LocaleKeys.added_on.tr(),
        true,
      );
    } else if (sortType == SortType.byDateModified) {
      return _buildDateAttribute(
        book.dateModified,
        LocaleKeys.modified_on.tr(),
        true,
      );
    } else if (sortType == SortType.byPublicationYear) {
      return (book.publicationYear != null)
          ? _buildPublicationYearAttribute()
          : const SizedBox();
    }

    return const SizedBox();
  }

  Text _buildPagesAttribute() =>
      Text('${book.pages} ${LocaleKeys.pages_lowercase.tr()}');

  Column _buildPublicationYearAttribute() {
    // ...existing code...
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          LocaleKeys.enter_publication_year.tr(),
          style: const TextStyle(fontSize: 12),
        ),
        Text(
          book.publicationYear.toString(),
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Column _buildDateAttribute(
    DateTime date,
    String label,
    bool includeTime,
  ) {
    // ...existing code...
    const timeTextStyle = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
        includeTime
            ? Text(
                '${dateFormat.format(date)} ${date.hour}:${date.minute.toString().padLeft(2, '0')}',
                style: timeTextStyle,
              )
            : Text(
                dateFormat.format(date),
                style: timeTextStyle,
              ),
      ],
    );
  }

  Widget _buildTags(BuildContext context) {
    // Bỏ BlocBuilder và switch case không cần thiết
    return _buildTagsContent(showTags, context);
  }

  Widget _buildTagsContent(bool displayTags, BuildContext context) {
    // ...existing code...
    if (displayTags) {
      return (book.tags == null)
          ? const SizedBox()
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Wrap(
                    children: _generateTagChips(context: context),
                  ),
                ),
              ],
            );
    }

    return const SizedBox();
  }

  Widget _buildTagChip({
    required String tag,
    required BuildContext context,
  }) {
    // ...existing code...
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: FilterChip(
        padding: const EdgeInsets.all(5),
        label: Text(
          tag,
          style: const TextStyle(fontSize: 12),
        ),
        onSelected: (_) {},
      ),
    );
  }

  List<Widget> _generateTagChips({required BuildContext context}) {
    // ...existing code...
    final chips = List<Widget>.empty(growable: true);

    if (book.tags == null) {
      return [];
    }

    final tags = book.tags!.split('|||||');

    tags.sort((a, b) => removeDiacritics(a.toLowerCase())
        .compareTo(removeDiacritics(b.toLowerCase())));

    for (var tag in tags) {
      chips.add(_buildTagChip(
        tag: tag,
        context: context,
      ));
    }

    return chips;
  }

  @override
  Widget build(BuildContext context) {
    // ...existing code...
    final coverFile = book.getCoverFile();

    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, addBottomPadding ? 90 : 5),
      child: Card.filled(
        color: cardColor,
        child: InkWell(
          onTap: onPressed,
          onLongPress: onLongPressed,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCover(coverFile),
                SizedBox(width: (coverFile != null) ? 15 : 0),
                _buildDetails(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildDetails(BuildContext context) {
    // ...existing code...
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  book.title,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              book.favorite
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        Symbols.favorite,
                        size: 15,
                        color: context.colorScheme.primaryContainer,
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(width: 10),
              _buildBookFormatIcon(context),
            ],
          ),
          Text(
            book.author,
            softWrap: true,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontSize: 14,
              color: context.colorScheme.onSurface.withValues(alpha:  0.8),
            ),
          ),
          book.publicationYear != null
              ? Text(
                  book.publicationYear.toString(),
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 12,
                    color: context
                        .colorScheme
                        .onSurface
                        .withValues(alpha:  0.6),
                    letterSpacing: 0.05,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              book.status == BookStatus.finished
                  ? _buildRating(context)
                  : const SizedBox(),
              _buildSortAttribute(),
            ],
          ),
          _buildTags(context),
        ],
      ),
    );
  }

  Widget _buildBookFormatIcon(BuildContext context) {
    // Bỏ BlocBuilder
    if (!showBookFormatIcon) return const SizedBox();

    return Icon(
      book.bookFormat == BookFormat.audiobook
          ? Symbols.headphones
          : book.bookFormat == BookFormat.ebook
              ? Symbols.tablet_mac_rounded
              : Symbols.import_contacts_rounded,
      size: 15,
      color: context.colorScheme.primaryContainer,
    );
  }

  SizedBox _buildCover(File? coverFile) {
    // ...existing code...
    const coverWidth = 85.0;
    const coverHeight = coverWidth * 1.5;

    return SizedBox(
      width: (coverFile != null) ? coverWidth : 0,
      height: coverHeight,
      child: (coverFile != null)
          ? ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Hero(
                tag: heroTag,
                child: Image.file(
                  coverFile,
                  width: coverWidth,
                  height: coverHeight,
                  fit: BoxFit.cover,
                  frameBuilder: (
                    BuildContext context,
                    Widget child,
                    int? frame,
                    bool wasSynchronouslyLoaded,
                  ) {
                    if (wasSynchronouslyLoaded) {
                      return child;
                    }
                    return AnimatedOpacity(
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                      child: child,
                    );
                  },
                ),
              ),
            )
          : const SizedBox(),
    );
  }

  Widget _buildRating(BuildContext context) {
    // Bỏ BlocBuilder và dùng tham số ratingDisplayType
    if (ratingDisplayType == RatingDisplayType.bar) {
      return RatingBar.builder(
        initialRating: (book.rating == null) ? 0 : (book.rating! / 10),
        allowHalfRating: true,
        unratedColor: context.colorScheme.surfaceContainerLow,
        glow: false,
        glowRadius: 1,
        itemSize: 18,
        ignoreGestures: true,
        itemPadding: const EdgeInsets.only(right: 3),
        itemBuilder: (context, _) => Icon(
          Symbols.star_rounded,
          color: context.colorScheme.primaryContainer,
        ),
        onRatingUpdate: (_) {},
      );
    } else {
      return Row(
        children: [
          Text(
            (book.rating == null) ? '0' : '${(book.rating! / 10)}',
          ),
          const SizedBox(width: 5),
          Icon(
            Symbols.star_rounded,
            color: context.colorScheme.primaryContainer,
            size: 14,
          ),
        ],
      );
    }
  }
}