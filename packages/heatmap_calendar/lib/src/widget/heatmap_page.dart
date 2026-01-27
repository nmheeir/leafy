import 'dart:math';

import 'package:flutter/material.dart';
import 'package:heatmap_calendar/src/widget/heatmap_month_text.dart';
import 'package:heatmap_calendar/src/widget/heatmap_column.dart';
import 'package:heatmap_calendar/src/data/heatmap_color_mode.dart';
import 'package:heatmap_calendar/src/util/datasets_util.dart';
import 'package:heatmap_calendar/src/util/date_util.dart';
import 'package:heatmap_calendar/src/widget/heatmap_week_text.dart';

class HeatMapPage extends StatelessWidget {
  /// List value of every sunday's month information.
  ///
  /// From 1: January to 12: December.
  final List<int> _firstDayInfos = [];

  /// The number of days between [startDate] and [endDate].
  final int _dateDifferent;

  /// The Date value of start day of heatmap.
  ///
  /// HeatMap shows the start day of [startDate]'s week.
  ///
  /// Default value is 1 year before the [endDate].
  /// And if [endDate] is null, then set 1 year before the [DateTime.now]
  final DateTime startDate;

  /// The Date value of end day of heatmap.
  ///
  /// Default value is [DateTime.now]
  final DateTime endDate;

  /// The double value of every block's width and height.
  final double? size;

  /// The double value of every block's fontSize.
  final double? fontSize;

  /// The datasets which fill blocks based on its value.
  final Map<DateTime, int>? datasets;

  /// The margin value for every block.
  final EdgeInsets? margin;

  /// The default background color value of every blocks.
  final Color? defaultColor;

  /// The text color value of every blocks.
  final Color? textColor;

  /// ColorMode changes the color mode of blocks.
  ///
  /// [ColorMode.opacity] requires just one colorsets value and changes color
  /// dynamically based on hightest value of [datasets].
  /// [ColorMode.color] changes colors based on [colorsets] thresholds key value.
  final ColorMode colorMode;

  /// The colorsets which give the color value for its thresholds key value.
  ///
  /// Be aware that first Color is the maximum value if [ColorMode] is [ColorMode.opacity].
  final Map<int, Color>? colorsets;

  /// The double value of every block's borderRadius.
  final double? borderRadius;

  /// The integer value of the maximum value for the [datasets].
  ///
  /// Get highest key value of filtered datasets using [DatasetsUtil.getMaxValue].
  final int? maxValue;

  /// Function that will be called when a block is clicked.
  ///
  /// Paratmeter gives clicked [DateTime] value.
  final Function(DateTime)? onClick;

  final bool? showText;

  /// Whether to draw week labels.
  final bool? drawWeekLabel;

  /// Tooltip builder for every block.
  final String Function(DateTime, int?)? tooltipBuilder;

  /// The width of month separator.
  final double? monthSeparatorWidth;

  HeatMapPage({
    super.key,
    required this.colorMode,
    required this.startDate,
    required this.endDate,
    this.size,
    this.fontSize,
    this.datasets,
    this.defaultColor,
    this.textColor,
    this.colorsets,
    this.borderRadius,
    this.onClick,
    this.margin,
    this.showText,
    this.tooltipBuilder,
    this.monthSeparatorWidth,
    this.drawWeekLabel,
  }) : _dateDifferent = endDate.difference(startDate).inDays,
       maxValue = DatasetsUtil.getMaxValue(datasets);

  /// Get [HeatMapColumn] from [startDate] to [endDate].
  List<Widget> _heatmapColumnList() {
    // Create empty list.
    List<Widget> columns = [];

    // Set cursor(position) to first day of weeks
    // until cursor reaches the final week.
    for (
      int datePos = 0 - (startDate.weekday % 7);
      datePos <= _dateDifferent;
      datePos += 7
    ) {
      // Get first day of week by adding cursor's value to startDate.
      DateTime firstDay = DateUtil.changeDay(startDate, datePos);

      // check if first day and last day are in different months
      DateTime lastDay = datePos <= _dateDifferent - 7
          ? DateUtil.changeDay(startDate, datePos + 6)
          : endDate;

      if (firstDay.month != lastDay.month && monthSeparatorWidth != null) {
        // ... previous logic ...
        // Split into two columns
        columns.add(
          HeatMapColumn(
            startDate: firstDay,
            endDate: lastDay,
            colorMode: colorMode,
            numDays: min(endDate.difference(firstDay).inDays + 1, 7),
            size: size,
            fontSize: fontSize,
            defaultColor: defaultColor,
            colorsets: colorsets,
            textColor: textColor,
            borderRadius: borderRadius,
            margin: margin,
            maxValue: maxValue,
            onClick: onClick,
            datasets: datasets,
            showText: showText,
            tooltipBuilder: tooltipBuilder,
            filterMonth: firstDay.month,
          ),
        );
        _firstDayInfos.add(firstDay.month);

        columns.add(SizedBox(width: monthSeparatorWidth));

        columns.add(
          HeatMapColumn(
            startDate: firstDay,
            endDate: lastDay,
            colorMode: colorMode,
            numDays: min(endDate.difference(firstDay).inDays + 1, 7),
            size: size,
            fontSize: fontSize,
            defaultColor: defaultColor,
            colorsets: colorsets,
            textColor: textColor,
            borderRadius: borderRadius,
            margin: margin,
            maxValue: maxValue,
            onClick: onClick,
            datasets: datasets,
            showText: showText,
            tooltipBuilder: tooltipBuilder,
            filterMonth: lastDay.month,
          ),
        );
        _firstDayInfos.add(lastDay.month);
      } else {
        // Normal single column
        columns.add(
          HeatMapColumn(
            startDate: firstDay,
            endDate: lastDay,
            colorMode: colorMode,
            numDays: min(endDate.difference(firstDay).inDays + 1, 7),
            size: size,
            fontSize: fontSize,
            defaultColor: defaultColor,
            colorsets: colorsets,
            textColor: textColor,
            borderRadius: borderRadius,
            margin: margin,
            maxValue: maxValue,
            onClick: onClick,
            datasets: datasets,
            showText: showText,
            tooltipBuilder: tooltipBuilder,
          ),
        );
        _firstDayInfos.add(firstDay.month);

        if (datePos < _dateDifferent - 7) {
          // Check next week exists
          DateTime nextWeekFirstDay = DateUtil.changeDay(
            startDate,
            datePos + 7,
          );
          if (lastDay.month != nextWeekFirstDay.month &&
              monthSeparatorWidth != null) {
            columns.add(SizedBox(width: monthSeparatorWidth));
          }
        }
      }
    }

    return columns;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Show week labels to left side of heatmap.
            if (drawWeekLabel == true)
              Container(
                // Add margin to align with heatmap block
                padding: EdgeInsets.only(top: fontSize ?? 12),
                child: HeatMapWeekText(
                  margin: margin,
                  fontSize: fontSize,
                  size: size,
                  fontColor: textColor,
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Show month labels to top of heatmap.
                HeatMapMonthText(
                  firstDayInfos: _firstDayInfos,
                  margin: margin,
                  fontSize: fontSize,
                  fontColor: textColor,
                  size: size,
                  monthSeparatorWidth: monthSeparatorWidth,
                ),

                // Heatmap itself.
                Row(children: <Widget>[..._heatmapColumnList()]),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
