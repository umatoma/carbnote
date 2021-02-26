import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_model.freezed.dart';

@freezed
abstract class Menu with _$Menu {
  factory Menu({
    @nullable int id,
    @required String category,
    @required String name,
    @required String unit,
    @required double carbGramPerUnit,
  }) = _Menu;
}
