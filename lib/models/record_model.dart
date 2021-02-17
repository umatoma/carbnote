import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_model.freezed.dart';

enum RecordTimeType {
  breakfast,
  lunch,
  dinner,
  snack,
}

@freezed
abstract class Record with _$Record {
  const factory Record({
    @nullable String id,
    @required String userID,
    @required RecordTimeType timeType,
    @required String name,
    @required String imageURL,
    @required int intakeGram,
    @required int carbGram,
    @required DateTime recordedAt,
    @required DateTime updatedAt,
    @required DateTime createdAt,
  }) = _Record;
}

@freezed
abstract class RecordsSummary implements _$RecordsSummary {
  factory RecordsSummary({
    @required int goalCarbGram,
    @required List<Record> records,
  }) = _RecordsSummary;

  RecordsSummary._();

  @late
  int get totalCarbGram =>
      records.map((record) => record.carbGram).fold(0, (a, b) => a + b);

  @late
  int get remainGram => goalCarbGram - totalCarbGram;

  @late
  int get maxByTotalAndGoalCarbGram => max(totalCarbGram, goalCarbGram);

  @late
  bool get isOverGoalCarbGram => totalCarbGram > goalCarbGram;

  int getTotalCarbGramByTimeType(RecordTimeType timeType) {
    return records
        .where((record) => record.timeType == timeType)
        .map((record) => record.carbGram)
        .fold(0, (a, b) => a + b);
  }
}
