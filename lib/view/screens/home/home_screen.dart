import 'package:carbnote/models/record_model.dart';
import 'package:carbnote/view/providers.dart';
import 'package:carbnote/view/screens/home/home_state.dart';
import 'package:carbnote/view/screens/record/record_form_screen.dart';
import 'package:carbnote/view/screens/record/record_form_state.dart';
import 'package:carbnote/view/screens/setting/setting_screen.dart';
import 'package:carbnote/view/strings.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/image.dart';
import 'package:carbnote/view/widgets/model/record.dart';
import 'package:carbnote/view/widgets/nav_bar.dart';
import 'package:carbnote/view/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
          child: CnCircleImage(
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
    final recordedAt = useProvider(recordedAtProvider);

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
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: recordedAt,
                firstDate: DateTime.now().subtract(
                  const Duration(days: 365),
                ),
                lastDate: DateTime.now().add(
                  const Duration(days: 1),
                ),
              );
              if (date != null) {
                context.read(homeStateProvider).setRecordedAt(date);
              }
            },
            padding: const EdgeInsets.all(4),
            icon: const Icon(CupertinoIcons.calendar),
          ),
        ],
      ),
    );
  }
}

class HomeRecordsSummary extends HookWidget {
  const HomeRecordsSummary() : super();

  @override
  Widget build(BuildContext context) {
    final summary = useProvider(recordsSummaryProvider).data?.value;

    return CnRecordsSummary(
      summary: summary,
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
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              CnStr.recordTimeType(timeType),
              style: Theme.of(context).textTheme.subtitle2,
            ),
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
                    onTap: () => Navigator.of(context).push(
                      CupertinoPageRoute<void>(
                        builder: (_) => ProviderScope(
                          overrides: [
                            currentRecordProvider.overrideWithValue(record),
                          ],
                          child: const RecordFormScreen(),
                        ),
                        fullscreenDialog: true,
                      ),
                    ),
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
