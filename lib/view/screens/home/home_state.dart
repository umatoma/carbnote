// ignore_for_file: top_level_function_literal_block
import 'dart:async';

import 'package:carbnote/models/record_model.dart';
import 'package:carbnote/view/providers.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:jiffy/jiffy.dart';

final recordedAtProvider = StateProvider((ref) {
  return DateTime.now();
});

final recordsProvider = StreamProvider.autoDispose((ref) {
  final recordRepo = ref.read(recordRepoProvider);
  final user = ref.watch(currentUserProvider);
  final recordedAt = ref.watch(recordedAtProvider).state;
  final stream = user == null
      ? Stream.value(<Record>[])
      : recordRepo.getListByRcordedAtStream(
          user.id,
          Jiffy(recordedAt).startOf(Units.DAY),
          Jiffy(recordedAt).endOf(Units.DAY),
        );
  return stream;
});

final recordsByTimeTypeProvider = Provider.autoDispose
    .family<AsyncValue<List<Record>>, RecordTimeType>((ref, timeType) {
  return ref.watch(recordsProvider).whenData(
        (records) =>
            records.where((record) => record.timeType == timeType).toList(),
      );
});

final recordsSummaryProvider = Provider.autoDispose((ref) {
  final records = ref.watch(recordsProvider);
  return records.whenData((data) => RecordsSummary(
        goalCarbGram: ref.read(currentUserProvider).goalCarbGram,
        records: data,
      ));
});
