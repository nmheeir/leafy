import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/data/models/book/reading_time/reading_time.dart';
import 'package:leafy/core/constants/enums/index.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/ui/extensions/book_status_extension.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/bloc/rating_type/rating_type_bloc.dart';
import 'package:leafy/ui/book/widgets/like_button.dart';

class BookStatusDetail extends StatefulWidget {
  const BookStatusDetail({super.key, required this.book});

  final Book book;

  @override
  State<BookStatusDetail> createState() => _BookStatusDetailState();
}

class _BookStatusDetailState extends State<BookStatusDetail> {
  final dateFormat = DateFormat.yMMMMd();

  void _onLikeTap() {
    context.bookActorCubit.toggleFavorite(widget.book);
  }

  @override
  Widget build(BuildContext context) {
    final statusIcon = widget.book.status.icon;
    final statusText = widget.book.status.text;
    final showRatingAndLike = widget.book.status == BookStatus.finished;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Row 1: Status Badge & Favorite Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatusBadge(context, statusIcon, statusText),
              _buildFavoriteButton(context),
            ],
          ),

          // Row 3: History & Stats - using startDate/finishDate directly
          if (widget.book.startDate != null ||
              widget.book.finishDate != null) ...[
            const SizedBox(height: 24),
            _buildReadingHistory(context),
          ],

          // Row 4: Rating
          if (showRatingAndLike) ...[
            const SizedBox(height: 24),
            _buildRatingSection(context),
          ],
        ],
      ),
    );
  }

  // Aesthetic: Status dạng "Badge" hoặc "Chip" thay vì Box to
  Widget _buildStatusBadge(
    BuildContext context,
    IconData? statusIcon,
    String statusText,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(
          24,
        ), // Bo tròn nhiều hơn (Pill shape)
        border: Border.all(
          color: context.colorScheme.primary.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(statusIcon, size: 18, color: context.colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            statusText,
            style: context.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  // Gom nhóm lịch sử đọc vào một khối gọn gàng hơn
  Widget _buildReadingHistory(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tiêu đề nhỏ nếu cần, hoặc giữ clean chỉ hiện list
        _generateHowManyTimesRead(context),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: context.colorScheme.outlineVariant.withValues(alpha: 0.3),
            ),
          ),
          child: Column(children: _buildStartAndFinishDates(context)),
        ),
      ],
    );
  }

  Widget _buildRatingSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.your_rating.tr(),
          style: context.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 12),
        // Vì nút Like đã đưa lên trên cùng, ở đây chỉ hiển thị Rating bar
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: context.colorScheme.outlineVariant),
          ),
          child: Center(child: _buildRating(context)),
        ),
      ],
    );
  }

  // --- Các hàm con giữ nguyên logic, chỉ chỉnh style nhẹ ---

  Widget _buildRating(BuildContext context) {
    return BlocBuilder<RatingTypeBloc, RatingTypeState>(
      builder: (context, state) {
        if (state is RatingTypeBar) {
          return RatingBar.builder(
            initialRating: (widget.book.rating != null)
                ? widget.book.rating! / 10
                : 0,
            allowHalfRating: true,
            unratedColor: context.colorScheme.outlineVariant.withValues(
              alpha: 0.5,
            ),
            glow: false,
            itemSize: 32, // To hơn một chút
            ignoreGestures: true,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4),
            itemBuilder: (context, _) => FaIcon(
              FontAwesomeIcons.solidStar,
              color: const Color(0xFFFFC107), // Màu vàng chuẩn cho sao
            ),
            onRatingUpdate: (_) {},
          );
        } else {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                (widget.book.rating == null)
                    ? '0'
                    : '${(widget.book.rating! / 10)}',
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: context.colorScheme.onSurface,
                ),
              ),
              const SizedBox(width: 8),
              FaIcon(
                FontAwesomeIcons.solidStar,
                color: const Color(0xFFFFC107),
                size: 24,
              ),
            ],
          );
        }
      },
    );
  }

  List<Widget> _buildStartAndFinishDates(BuildContext context) {
    // Use startDate and finishDate directly from book entity
    if (widget.book.startDate == null && widget.book.finishDate == null) {
      return [];
    }

    final text = _getReadingDateTextFromBook(context);

    return [
      Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.calendar_today_rounded,
              size: 14,
              color: context.colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    ];
  }

  String _getReadingDateTextFromBook(BuildContext context) {
    final startDate = widget.book.startDate;
    final finishDate = widget.book.finishDate;

    // Generate reading time text
    final timeStr = _generateReadingTime(
      startDate: startDate,
      finishDate: finishDate,
      context: context,
      readingTime: null,
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
    // Highlight số ngày đậm hơn một chút
    return ' • ${LocaleKeys.day.plural(diff).tr()}';
  }

  Widget _generateHowManyTimesRead(BuildContext context) {
    // Reading history feature using ReadingSession table - simplified here
    // Just show if book has been finished
    if (widget.book.finishDate == null) return const SizedBox();

    return const SizedBox(); // TODO: Query ReadingSession for multiple read-throughs
  }

  Widget _buildFavoriteButton(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: LikeButton(isLiked: widget.book.favorite, onTap: _onLikeTap),
    );
  }
}
