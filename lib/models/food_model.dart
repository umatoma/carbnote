import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_model.freezed.dart';

@freezed
abstract class Food with _$Food {
  factory Food({
    @nullable int id,
    @required int no,
    @required String name,
    @required int carbGram,
    @Default(0) int intakeGram,
  }) = _Food;

  @late
  double get carbGramPer1Gram => carbGram.toDouble() / 100.0;
}
