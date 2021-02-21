import 'package:carbnote/models/date_time.dart';
import 'package:carbnote/models/record_model.dart';
import 'package:carbnote/view/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dateTimeRangeProvider = ScopedProvider<DateTimeRange>((ref) {
  throw UnimplementedError('対象の期間が設定されていません');
});

final dateTimeUnitProvider = ScopedProvider<DateTimeUnit>((ref) {
  throw UnimplementedError('対象の時間単位が設定されていません');
});

final recordsProvider = StreamProvider.autoDispose
    .family<List<Record>, DateTimeRange>((ref, range) {
  final recordRepo = ref.read(recordRepoProvider);
  final user = ref.watch(currentUserProvider);
  final stream = user == null
      ? Stream.value(<Record>[])
      : recordRepo.getListByRcordedAtStream(
          user.id,
          range.start,
          range.end,
        );
  return stream;
});

final recordsSummaryProvider = Provider.autoDispose
    .family<AsyncValue<RecordsSummary>, DateTimeRange>((ref, range) {
  final user = ref.watch(currentUserProvider);
  return ref.watch(recordsProvider(range)).whenData((records) => RecordsSummary(
        goalCarbGram: user.goalCarbGram,
        records: records,
      ));
});
