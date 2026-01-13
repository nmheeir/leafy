import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/data/models/book/reading_time/reading_time.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/bloc/rating_type/rating_type_bloc.dart';
import 'package:leafy/ui/book/widgets/like_button.dart';

class BookStatusDetail extends StatelessWidget {
  BookStatusDetail({
    super.key,
    required this.book,
    required this.statusIcon,
    required this.statusText,
    required this.onLikeTap,
    this.showChangeStatus = false,
    this.changeStatusText,
    this.changeStatusAction,
    this.showRatingAndLike = false,
    this.downloadProgress,
  });

  final Book book;
  final IconData? statusIcon;
  final String statusText;
  final VoidCallback onLikeTap;
  final bool showChangeStatus;
  final String? changeStatusText;
  final VoidCallback? changeStatusAction;
  final bool showRatingAndLike;
  final double? downloadProgress;

  final dateFormat = DateFormat.yMMMMd();

  bool get isDownloading => downloadProgress != null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          Row(
            children: [
              _buildStatusBox(context),
              if (showChangeStatus) ...[
                const SizedBox(width: 12),
                _buildChangeStatusButton(context),
              ],
            ],
          ),
          const SizedBox(height: 16),
          _generateHowManyTimesRead(context),
          ..._buildStartAndFinishDates(context),
          if (showRatingAndLike) ...[
            const SizedBox(height: 16),
            _buildRatingAndLike(context),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusBox(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: context.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              statusIcon,
              size: 20,
              color: context.colorScheme.onPrimaryContainer,
            ),
            const SizedBox(width: 8),
            Text(
              statusText,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: context.colorScheme.onPrimaryContainer,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChangeStatusButton(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: isDownloading ? null : changeStatusAction,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: context.colorScheme.secondaryContainer,
            border: isDownloading
                ? Border.all(color: context.colorScheme.primary, width: 2)
                : null,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (isDownloading)
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    14,
                  ), // slightly less than container
                  child: LinearProgressIndicator(
                    value: downloadProgress,
                    backgroundColor: Colors.transparent,
                    color: context.colorScheme.primary.withValues(alpha: 0.1),
                    minHeight: 50,
                  ),
                ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isDownloading) ...[
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        value: downloadProgress,
                        color: context.colorScheme.onSecondaryContainer,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],

                  Text(
                    isDownloading
                        ? "${(downloadProgress! * 100).toInt()}%"
                        : (changeStatusText ?? ""),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingAndLike(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.your_rating.tr(),
          style: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRating(context),
              LikeButton(isLiked: book.favorite, onTap: onLikeTap),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRating(BuildContext context) {
    return BlocBuilder<RatingTypeBloc, RatingTypeState>(
      builder: (context, state) {
        if (state is RatingTypeBar) {
          return RatingBar.builder(
            initialRating: (book.rating != null) ? book.rating! / 10 : 0,
            allowHalfRating: true,
            unratedColor: context.colorScheme.outlineVariant,
            glow: false,
            itemSize: 28,
            ignoreGestures: true,
            itemPadding: const EdgeInsets.only(right: 4),
            itemBuilder: (context, _) => FaIcon(
              FontAwesomeIcons.solidStar,
              color: context.colorScheme.primary,
            ),
            onRatingUpdate: (_) {},
          );
        } else {
          return Row(
            children: [
              Text(
                (book.rating == null) ? '0' : '${(book.rating! / 10)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              FaIcon(
                FontAwesomeIcons.solidStar,
                color: context.colorScheme.primary,
                size: 20,
              ),
            ],
          );
        }
      },
    );
  }

  // Helper methods for Dates (kept mostly same but cleaned up)

  List<Widget> _buildStartAndFinishDates(BuildContext context) {
    if (book.readings.isEmpty) return [];

    return book.readings.map((reading) {
      final text = _getReadingDateText(reading, context);
      return Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 14,
              color: context.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  String _getReadingDateText(dynamic reading, BuildContext context) {
    final startDate = reading.startDate;
    final finishDate = reading.finishDate;
    final readingTime = reading.readingTimeMs; // Assuming this logic exists

    final timeStr = _generateReadingTime(
      startDate: startDate,
      finishDate: finishDate,
      context: context,
      readingTime:
          null, // passed null for now as per original code simplified logic
    );

    if (startDate != null && finishDate != null) {
      return '${dateFormat.format(startDate)} - ${dateFormat.format(finishDate)} $timeStr';
    } else if (finishDate != null) {
      return '${LocaleKeys.finished_on_date.tr()} ${dateFormat.format(finishDate)} $timeStr';
    } else if (startDate != null) {
      return '${LocaleKeys.started_on_date.tr()} ${dateFormat.format(startDate)}';
    }
    return "";
  }

  String _generateReadingTime({
    DateTime? startDate,
    DateTime? finishDate,
    required BuildContext context,
    ReadingTime? readingTime,
  }) {
    if (readingTime != null) return '($readingTime)';
    if (startDate == null || finishDate == null) return '';
    final diff = finishDate.difference(startDate).inDays + 1;
    return '(${LocaleKeys.day.plural(diff).tr()})';
  }

  Widget _generateHowManyTimesRead(BuildContext context) {
    int timesRead = book.readings.where((r) => r.finishDate != null).length;
    if (timesRead <= 1) return const SizedBox();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.repeat, size: 14, color: context.colorScheme.secondary),
            const SizedBox(width: 4),
            Text(
              LocaleKeys.read_x_times.plural(book.readings.length).tr(),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: context.colorScheme.secondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Divider(
          color: context.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
