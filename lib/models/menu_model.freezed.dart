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
      {@nullable int id,
      @required String category,
      @required String name,
      @required String unit,
      @required double carbGramPerUnit}) {
    return _Menu(
      id: id,
      category: category,
      name: name,
      unit: unit,
      carbGramPerUnit: carbGramPerUnit,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Menu = _$MenuTearOff();

/// @nodoc
mixin _$Menu {
  @nullable
  int get id;
  String get category;
  String get name;
  String get unit;
  double get carbGramPerUnit;

  @JsonKey(ignore: true)
  $MenuCopyWith<Menu> get copyWith;
}

/// @nodoc
abstract class $MenuCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) then) =
      _$MenuCopyWithImpl<$Res>;
  $Res call(
      {@nullable int id,
      String category,
      String name,
      String unit,
      double carbGramPerUnit});
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
    Object category = freezed,
    Object name = freezed,
    Object unit = freezed,
    Object carbGramPerUnit = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      category: category == freezed ? _value.category : category as String,
      name: name == freezed ? _value.name : name as String,
      unit: unit == freezed ? _value.unit : unit as String,
      carbGramPerUnit: carbGramPerUnit == freezed
          ? _value.carbGramPerUnit
          : carbGramPerUnit as double,
    ));
  }
}

/// @nodoc
abstract class _$MenuCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$MenuCopyWith(_Menu value, $Res Function(_Menu) then) =
      __$MenuCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable int id,
      String category,
      String name,
      String unit,
      double carbGramPerUnit});
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
    Object category = freezed,
    Object name = freezed,
    Object unit = freezed,
    Object carbGramPerUnit = freezed,
  }) {
    return _then(_Menu(
      id: id == freezed ? _value.id : id as int,
      category: category == freezed ? _value.category : category as String,
      name: name == freezed ? _value.name : name as String,
      unit: unit == freezed ? _value.unit : unit as String,
      carbGramPerUnit: carbGramPerUnit == freezed
          ? _value.carbGramPerUnit
          : carbGramPerUnit as double,
    ));
  }
}

/// @nodoc
class _$_Menu implements _Menu {
  _$_Menu(
      {@nullable this.id,
      @required this.category,
      @required this.name,
      @required this.unit,
      @required this.carbGramPerUnit})
      : assert(category != null),
        assert(name != null),
        assert(unit != null),
        assert(carbGramPerUnit != null);

  @override
  @nullable
  final int id;
  @override
  final String category;
  @override
  final String name;
  @override
  final String unit;
  @override
  final double carbGramPerUnit;

  @override
  String toString() {
    return 'Menu(id: $id, category: $category, name: $name, unit: $unit, carbGramPerUnit: $carbGramPerUnit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Menu &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.carbGramPerUnit, carbGramPerUnit) ||
                const DeepCollectionEquality()
                    .equals(other.carbGramPerUnit, carbGramPerUnit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(carbGramPerUnit);

  @JsonKey(ignore: true)
  @override
  _$MenuCopyWith<_Menu> get copyWith =>
      __$MenuCopyWithImpl<_Menu>(this, _$identity);
}

abstract class _Menu implements Menu {
  factory _Menu(
      {@nullable int id,
      @required String category,
      @required String name,
      @required String unit,
      @required double carbGramPerUnit}) = _$_Menu;

  @override
  @nullable
  int get id;
  @override
  String get category;
  @override
  String get name;
  @override
  String get unit;
  @override
  double get carbGramPerUnit;
  @override
  @JsonKey(ignore: true)
  _$MenuCopyWith<_Menu> get copyWith;
}
