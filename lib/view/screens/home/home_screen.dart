import 'package:carbnote/models/record_model.dart';
import 'package:carbnote/view/providers.dart';
import 'package:carbnote/view/screens/home/home_state.dart';
import 'package:carbnote/view/screens/setting/setting_screen.dart';
import 'package:carbnote/view/strings.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/domain.dart';
import 'package:carbnote/view/widgets/image.dart';
import 'package:carbnote/view/widgets/nav_bar.dart';
import 'package:carbnote/view/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen() : super();

  @override
  Widget build(BuildContext context) {
    return CnScaffold(
      appBar: CnNavBar(
        middle: const Text('Carb Note'),
        trailing: CnNavButton.gear(
          onPressed: () => Navigator.of(context).push(
            CupertinoPageRoute<void>(
              builder: (_) => SettingScreen(),
              fullscreenDialog: true,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: HomeUser(),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: HomeRecordedAt(),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: const [
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: HomeRecordsSummary(),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: HomeRecordsByTimeType(
                    timeType: RecordTimeType.breakfast,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: HomeRecordsByTimeType(
                    timeType: RecordTimeType.lunch,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: HomeRecordsByTimeType(
                    timeType: RecordTimeType.dinner,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: HomeRecordsByTimeType(
                    timeType: RecordTimeType.snack,
                  ),
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CnFavButton(),
      bottomNavigationBar: const CnBottomNav(index: 0),
    );
  }
}

class HomeUser extends HookWidget {
  const HomeUser() : super();

  @override
  Widget build(BuildContext context) {
    final user = useProvider(currentUserProvider);

    return Row(
      children: [
        Hero(
          tag: 'ProfileImage',
          child: CnProfileImage(
            user?.imageURL,
            size: 48,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user == null ? '...' : 'Hi ${user.nickname}',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(user == null ? '...' : '今日は残り20gの糖質が取れるよ'),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeRecordedAt extends HookWidget {
  const HomeRecordedAt() : super();

  @override
  Widget build(BuildContext context) {
    final recordedAt = useProvider(recordedAtProvider).state;

    return SizedBox(
      height: 32,
      child: Row(
        children: [
          const SizedBox(width: 32),
          Expanded(
            child: Center(
              child: Text(
                DateFormat('MM月dd日').format(recordedAt),
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          CnIconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(4),
            icon: const Icon(CupertinoIcons.calendar),
          ),
        ],
      ),
    );
  }
}

class HomeRecordsSummary extends HookWidget {
  const HomeRecordsSummary({
    this.duration = const Duration(milliseconds: 1000),
  }) : super();

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final summary = useProvider(recordsSummaryProvider).data?.value;

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
                  '${goalCarbGram}g',
                  style:
                      Theme.of(context).textTheme.caption.apply(color: color),
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
                color: Colors.grey[200],
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

class HomeRecordsByTimeType extends HookWidget {
  const HomeRecordsByTimeType({
    @required this.timeType,
  }) : super();

  final RecordTimeType timeType;

  @override
  Widget build(BuildContext context) {
    final asyncRecords = useProvider(recordsByTimeTypeProvider(timeType));

    return Column(
      children: [
        SizedBox(
          height: 32,
          child: Row(
            children: [
              Text(
                CnStr.recordTimeType(timeType),
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const Spacer(),
              CnIconButton(
                onPressed: () {},
                padding: const EdgeInsets.all(4),
                icon: const Icon(CupertinoIcons.pencil),
              ),
            ],
          ),
        ),
        asyncRecords.when(
          data: (records) {
            return Column(
              children: [
                if (records.isEmpty)
                  const SizedBox(
                    height: 48,
                    child: Text('未登録'),
                  ),
                for (final Record record in records)
                  CnRecordListItem(
                    onTap: () {},
                    key: ValueKey(record),
                    record: record,
                  ),
              ],
            );
          },
          loading: () {
            return const SizedBox(
              height: 48,
              child: Text('...'),
            );
          },
          error: (e, stackTrace) {
            print(e);
            print(stackTrace);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(e.toString()),
            );
          },
        ),
      ],
    );
  }
}
