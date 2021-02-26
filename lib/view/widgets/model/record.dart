import 'dart:math';

import 'package:carbnote/models/date_time.dart';
import 'package:carbnote/models/record_model.dart';
import 'package:carbnote/view/strings.dart';
import 'package:carbnote/view/widgets/image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CnRecordListItem extends StatelessWidget {
  const CnRecordListItem({
    Key key,
    @required this.onTap,
    @required this.record,
  }) : super(key: key);

  final void Function() onTap;
  final Record record;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Hero(
              tag: 'RecordImage_${record.id}',
              child: CnCircleImage(record.imageURL),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    record.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    record.note,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 48,
              child: Column(
                children: [
                  Text(
                    '${record.carbGram}g',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    '糖質',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CnOneDayRecordsSummary extends StatelessWidget {
  const CnOneDayRecordsSummary({
    @required this.summary,
    this.duration = const Duration(milliseconds: 1000),
  }) : super();

  final RecordsSummary summary;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 32,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '糖質摂取量',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildTotal(
              context: context,
              totalCarbGram: summary?.totalCarbGram ?? 0,
              goalCarbGram: summary?.goalCarbGram ?? 0,
              isOverGoalCarbGram: summary?.isOverGoalCarbGram ?? false,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 96,
                child: Column(
                  children: [
                    Expanded(
                      child: _buildRow(
                        context: context,
                        title: '今日',
                        gram: summary?.totalCarbGram ?? 0,
                        maxGram: summary?.maxByTotalAndGoalCarbGram ?? 0,
                      ),
                    ),
                    for (final type in [
                      RecordTimeType.breakfast,
                      RecordTimeType.lunch,
                      RecordTimeType.dinner,
                      RecordTimeType.snack,
                    ]) ...[
                      const SizedBox(height: 4),
                      Expanded(
                        child: _buildRow(
                          context: context,
                          title: CnStr.recordTimeType(type),
                          gram: summary?.getTotalCarbGramByTimeType(type) ?? 0,
                          maxGram: summary?.maxByTotalAndGoalCarbGram ?? 0,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTotal({
    @required BuildContext context,
    @required int totalCarbGram,
    @required int goalCarbGram,
    @required bool isOverGoalCarbGram,
  }) {
    return AnimatedTheme(
      data: Theme.of(context).copyWith(
        primaryColor: isOverGoalCarbGram == true
            ? Colors.red
            : Theme.of(context).primaryColor,
      ),
      duration: duration,
      curve: Curves.bounceOut,
      child: Builder(builder: (context) {
        final color = Theme.of(context).primaryColor;
        return Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(48),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${totalCarbGram}g',
                  style:
                      Theme.of(context).textTheme.headline6.apply(color: color),
                ),
                Text(
                  '目標 ${goalCarbGram}g',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildRow({
    @required BuildContext context,
    @required String title,
    @required int gram,
    @required int maxGram,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildBar(maxGram == 0 ? 0 : gram / maxGram),
        ),
      ],
    );
  }

  Widget _buildBar(double percentage) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            AnimatedContainer(
              duration: duration,
              curve: Curves.bounceOut,
              width: constraints.maxWidth * percentage,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CnRecordsSummaryLineChart extends StatelessWidget {
  const CnRecordsSummaryLineChart({
    @required this.summary,
    @required this.range,
    @required this.unit,
  }) : super();

  final RecordsSummary summary;
  final DateTimeRange range;
  final DateTimeUnit unit;

  @override
  Widget build(BuildContext context) {
    final dateTimes = List.generate(
      range.duration.inDays + 1,
      (i) => range.start.add(Duration(days: i)),
    );

    final Map<DateTime, RecordsSummary> summaries = unit == DateTimeUnit.month
        ? summary.summariesGroupByRecordedMonth
        : summary.summariesGroupByRecordedDay;
    final String Function(double) getBottomTitles = unit == DateTimeUnit.month
        ? (value) {
            final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
            return date.day == 1 ? DateFormat('MM月').format(date) : '';
          }
        : (value) {
            final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
            return date.weekday == DateTime.monday
                ? DateFormat('MM/dd').format(date)
                : '';
          };
    final maxY = unit == DateTimeUnit.month
        ? max(
            4000.0,
            summaries.values.map((e) => e.totalCarbGram).fold(0, max),
          ).toDouble()
        : max(
            150.0,
            summaries.values.map((e) => e.totalCarbGram).fold(0, max),
          ).toDouble();
    final horizontalInterval = unit == DateTimeUnit.month
        ? (summary.goalCarbGram * 30).toDouble()
        : summary.goalCarbGram.toDouble();

    return SizedBox(
      width: double.infinity,
      height: 300,
      child: BarChart(
        BarChartData(
          minY: 0,
          maxY: maxY,
          borderData: FlBorderData(
            show: false,
          ),
          gridData: FlGridData(
            horizontalInterval: horizontalInterval,
            drawHorizontalLine: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                strokeWidth: 1,
                color: value == horizontalInterval
                    ? Theme.of(context).primaryColorLight
                    : Colors.transparent,
              );
            },
          ),
          titlesData: FlTitlesData(
            leftTitles: SideTitles(
              showTitles: true,
              interval: maxY > 200 ? 200 : 10,
            ),
            bottomTitles: SideTitles(
              showTitles: true,
              rotateAngle: 45,
              getTitles: getBottomTitles,
            ),
          ),
          barGroups: [
            for (final date in dateTimes)
              BarChartGroupData(
                x: date.millisecondsSinceEpoch,
                barRods: [
                  BarChartRodData(
                    width: 4,
                    y: summaries.containsKey(date)
                        ? summaries[date].totalCarbGram.toDouble()
                        : 0,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
