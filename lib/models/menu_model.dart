import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_model.freezed.dart';

@freezed
abstract class Menu with _$Menu {
  factory Menu({
    @nullable String id,
    @nullable String userID,
    @nullable String category,
    @required String name,
    @required String unit,
    @required double carbGramPerUnit,
    @nullable String imageURL,
    @nullable DateTime createdAt,
    @nullable DateTime updatedAt,
  }) = _Menu;
}
