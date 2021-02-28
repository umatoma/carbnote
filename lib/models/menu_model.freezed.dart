// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'menu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MenuTearOff {
  const _$MenuTearOff();

// ignore: unused_element
  _Menu call(
      {@nullable String id,
      @nullable String userID,
      @nullable String category,
      @required String name,
      @required String unit,
      @required double carbGramPerUnit,
      @nullable String imageURL,
      @nullable DateTime createdAt,
      @nullable DateTime updatedAt}) {
    return _Menu(
      id: id,
      userID: userID,
      category: category,
      name: name,
      unit: unit,
      carbGramPerUnit: carbGramPerUnit,
      imageURL: imageURL,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Menu = _$MenuTearOff();

/// @nodoc
mixin _$Menu {
  @nullable
  String get id;
  @nullable
  String get userID;
  @nullable
  String get category;
  String get name;
  String get unit;
  double get carbGramPerUnit;
  @nullable
  String get imageURL;
  @nullable
  DateTime get createdAt;
  @nullable
  DateTime get updatedAt;

  @JsonKey(ignore: true)
  $MenuCopyWith<Menu> get copyWith;
}

/// @nodoc
abstract class $MenuCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) then) =
      _$MenuCopyWithImpl<$Res>;
  $Res call(
      {@nullable String id,
      @nullable String userID,
      @nullable String category,
      String name,
      String unit,
      double carbGramPerUnit,
      @nullable String imageURL,
      @nullable DateTime createdAt,
      @nullable DateTime updatedAt});
}

/// @nodoc
class _$MenuCopyWithImpl<$Res> implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._value, this._then);

  final Menu _value;
  // ignore: unused_field
  final $Res Function(Menu) _then;

  @override
  $Res call({
    Object id = freezed,
    Object userID = freezed,
    Object category = freezed,
    Object name = freezed,
    Object unit = freezed,
    Object carbGramPerUnit = freezed,
    Object imageURL = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      userID: userID == freezed ? _value.userID : userID as String,
      category: category == freezed ? _value.category : category as String,
      name: name == freezed ? _value.name : name as String,
      unit: unit == freezed ? _value.unit : unit as String,
      carbGramPerUnit: carbGramPerUnit == freezed
          ? _value.carbGramPerUnit
          : carbGramPerUnit as double,
      imageURL: imageURL == freezed ? _value.imageURL : imageURL as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$MenuCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$MenuCopyWith(_Menu value, $Res Function(_Menu) then) =
      __$MenuCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String id,
      @nullable String userID,
      @nullable String category,
      String name,
      String unit,
      double carbGramPerUnit,
      @nullable String imageURL,
      @nullable DateTime createdAt,
      @nullable DateTime updatedAt});
}

/// @nodoc
class __$MenuCopyWithImpl<$Res> extends _$MenuCopyWithImpl<$Res>
    implements _$MenuCopyWith<$Res> {
  __$MenuCopyWithImpl(_Menu _value, $Res Function(_Menu) _then)
      : super(_value, (v) => _then(v as _Menu));

  @override
  _Menu get _value => super._value as _Menu;

  @override
  $Res call({
    Object id = freezed,
    Object userID = freezed,
    Object category = freezed,
    Object name = freezed,
    Object unit = freezed,
    Object carbGramPerUnit = freezed,
    Object imageURL = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
  }) {
    return _then(_Menu(
      id: id == freezed ? _value.id : id as String,
      userID: userID == freezed ? _value.userID : userID as String,
      category: category == freezed ? _value.category : category as String,
      name: name == freezed ? _value.name : name as String,
      unit: unit == freezed ? _value.unit : unit as String,
      carbGramPerUnit: carbGramPerUnit == freezed
          ? _value.carbGramPerUnit
          : carbGramPerUnit as double,
      imageURL: imageURL == freezed ? _value.imageURL : imageURL as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
    ));
  }
}

/// @nodoc
class _$_Menu implements _Menu {
  _$_Menu(
      {@nullable this.id,
      @nullable this.userID,
      @nullable this.category,
      @required this.name,
      @required this.unit,
      @required this.carbGramPerUnit,
      @nullable this.imageURL,
      @nullable this.createdAt,
      @nullable this.updatedAt})
      : assert(name != null),
        assert(unit != null),
        assert(carbGramPerUnit != null);

  @override
  @nullable
  final String id;
  @override
  @nullable
  final String userID;
  @override
  @nullable
  final String category;
  @override
  final String name;
  @override
  final String unit;
  @override
  final double carbGramPerUnit;
  @override
  @nullable
  final String imageURL;
  @override
  @nullable
  final DateTime createdAt;
  @override
  @nullable
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Menu(id: $id, userID: $userID, category: $category, name: $name, unit: $unit, carbGramPerUnit: $carbGramPerUnit, imageURL: $imageURL, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Menu &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.carbGramPerUnit, carbGramPerUnit) ||
                const DeepCollectionEquality()
                    .equals(other.carbGramPerUnit, carbGramPerUnit)) &&
            (identical(other.imageURL, imageURL) ||
                const DeepCollectionEquality()
                    .equals(other.imageURL, imageURL)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userID) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(carbGramPerUnit) ^
      const DeepCollectionEquality().hash(imageURL) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @JsonKey(ignore: true)
  @override
  _$MenuCopyWith<_Menu> get copyWith =>
      __$MenuCopyWithImpl<_Menu>(this, _$identity);
}

abstract class _Menu implements Menu {
  factory _Menu(
      {@nullable String id,
      @nullable String userID,
      @nullable String category,
      @required String name,
      @required String unit,
      @required double carbGramPerUnit,
      @nullable String imageURL,
      @nullable DateTime createdAt,
      @nullable DateTime updatedAt}) = _$_Menu;

  @override
  @nullable
  String get id;
  @override
  @nullable
  String get userID;
  @override
  @nullable
  String get category;
  @override
  String get name;
  @override
  String get unit;
  @override
  double get carbGramPerUnit;
  @override
  @nullable
  String get imageURL;
  @override
  @nullable
  DateTime get createdAt;
  @override
  @nullable
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$MenuCopyWith<_Menu> get copyWith;
}
