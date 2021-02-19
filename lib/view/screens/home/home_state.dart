// ignore_for_file: top_level_function_literal_block
import 'dart:async';

import 'package:carbnote/libs/date_time.dart';
import 'package:carbnote/models/record_model.dart';
import 'package:carbnote/view/providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'home_state.freezed.dart';

final homeStateProvider = StateNotifierProvider((ref) {
  return HomeStateController();
});

final recordedAtProvider = Provider.autoDispose((ref) {
  return ref.watch(homeStateProvider.state).recordedAt;
});

final recordsProvider = StreamProvider.autoDispose((ref) {
  final recordRepo = ref.read(recordRepoProvider);
  final user = ref.watch(currentUserProvider);
  final recordedAt = ref.watch(recordedAtProvider);
  final stream = user == null
      ? Stream.value(<Record>[])
      : recordRepo.getListByRcordedAtStream(
          user.id,
          recordedAt.startOfDay(),
          recordedAt.endOfDay(),
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

@freezed
abstract class HomeState with _$HomeState {
  factory HomeState({
    @required DateTime recordedAt,
  }) = _HomeState;
}

class HomeStateController extends StateNotifier<HomeState> {
  HomeStateController()
      : super(HomeState(
          recordedAt: DateTime.now(),
        ));

  void setRecordedAt(DateTime value) {
    state = state.copyWith(recordedAt: value);
  }
}
