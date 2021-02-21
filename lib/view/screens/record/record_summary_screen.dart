import 'package:carbnote/models/record_model.dart';
import 'package:carbnote/view/screens/home/home_screen.dart';
import 'package:carbnote/view/screens/record/record_summary_state.dart';
import 'package:carbnote/view/widgets/model/record.dart';
import 'package:carbnote/view/widgets/nav_bar.dart';
import 'package:carbnote/view/widgets/scaffold.dart';
import 'package:carbnote/models/date_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class RecordSummaryScreen extends HookWidget {
  const RecordSummaryScreen() : super();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Navigator.of(context).pushReplacement(
          PageTransition<void>(
            child: const HomeScreen(),
            type: PageTransitionType.fade,
          ),
        );
        return false;
      },
      child: CnScaffold(
        appBar: CnNavBar(
          leading: CnNavButton.back(
            onPressed: () => Navigator.of(context).pushReplacement(
              PageTransition<void>(
                child: const HomeScreen(),
                type: PageTransitionType.fade,
              ),
            ),
          ),
          middle: const Text('今までの記録'),
        ),
        body: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              TabBar(
                labelColor: Theme.of(context).primaryColor,
                tabs: const [
                  Tab(icon: Text('30日')),
                  Tab(icon: Text('3ヶ月')),
                  Tab(icon: Text('半年')),
                  Tab(icon: Text('1年')),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ProviderScope(
                      overrides: [
                        dateTimeRangeProvider.overrideWithValue(DateTimeRange(
                          start: DateTime.now()
                              .subtract(const Duration(days: 30))
                              .startOfDay(),
                          end: DateTime.now().endOfDay(),
                        )),
                        dateTimeUnitProvider
                            .overrideWithValue(DateTimeUnit.day),
                      ],
                      child: const RecordSummaryTabBody(),
                    ),
                    ProviderScope(
                      overrides: [
                        dateTimeRangeProvider.overrideWithValue(DateTimeRange(
                          start: DateTime.now()
                              .subtract(const Duration(days: 90))
                              .startOfDay(),
                          end: DateTime.now().endOfDay(),
                        )),
                        dateTimeUnitProvider
                            .overrideWithValue(DateTimeUnit.day),
                      ],
                      child: const RecordSummaryTabBody(),
                    ),
                    ProviderScope(
                      overrides: [
                        dateTimeRangeProvider.overrideWithValue(DateTimeRange(
                          start: DateTime.now()
                              .subtract(const Duration(days: 180))
                              .startOfDay(),
                          end: DateTime.now().endOfDay(),
                        )),
                        dateTimeUnitProvider
                            .overrideWithValue(DateTimeUnit.month),
                      ],
                      child: const RecordSummaryTabBody(),
                    ),
                    ProviderScope(
                      overrides: [
                        dateTimeRangeProvider.overrideWithValue(DateTimeRange(
                          start: DateTime.now()
                              .subtract(const Duration(days: 365))
                              .startOfDay(),
                          end: DateTime.now().endOfDay(),
                        )),
                        dateTimeUnitProvider
                            .overrideWithValue(DateTimeUnit.month),
                      ],
                      child: const RecordSummaryTabBody(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const CnFavButton(),
        bottomNavigationBar: const CnBottomNav(index: 2),
      ),
    );
  }
}

class RecordSummaryTabBody extends HookWidget {
  const RecordSummaryTabBody() : super();

  @override
  Widget build(BuildContext context) {
    final range = useProvider(dateTimeRangeProvider);
    final unit = useProvider(dateTimeUnitProvider);
    final asyncSummary = useProvider(recordsSummaryProvider(range));

    return asyncSummary.maybeWhen(
      error: (e, stackTrace) {
        print(e);
        print(stackTrace);
        return Center(
          child: Text(
            e.toString(),
            style:
                Theme.of(context).textTheme.bodyText2.apply(color: Colors.red),
          ),
        );
      },
      orElse: () {
        final summary = asyncSummary.data?.value ??
            RecordsSummary(goalCarbGram: 100, records: []);
        final summaries = unit == DateTimeUnit.month
            ? summary.summariesGroupByRecordedMonth
            : summary.summariesGroupByRecordedDay;
        return ListView(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                '糖質摂取量',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: CnRecordsSummaryLineChart(
                summary: summary,
                range: range,
                unit: unit,
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '${summary.goalCarbGram}g',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .apply(color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          '1日の目標',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '${summary.averageCarbGram}g',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .apply(color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          '1日の平均',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '${summary.achievedGoalCarbGramDays}日',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .apply(color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          '目標達成',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            for (final entry in summaries.entries) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  height: 48,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat(
                              unit == DateTimeUnit.month
                                  ? 'yyyy年MM月'
                                  : 'yyyy年MM月dd日',
                            ).format(entry.key),
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            '${entry.value.records.length}件',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 48,
                        child: Column(
                          children: [
                            Text(
                              '${entry.value.totalCarbGram}g',
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
              ),
              const SizedBox(height: 8),
            ],
            const SizedBox(height: 32),
          ],
        );
      },
    );
  }
}
