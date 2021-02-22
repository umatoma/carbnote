// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'food_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FoodTearOff {
  const _$FoodTearOff();

// ignore: unused_element
  _Food call(
      {@nullable int id,
      @required int no,
      @required String name,
      @required int carbGram,
      int intakeGram = 0}) {
    return _Food(
      id: id,
      no: no,
      name: name,
      carbGram: carbGram,
      intakeGram: intakeGram,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Food = _$FoodTearOff();

/// @nodoc
mixin _$Food {
  @nullable
  int get id;
  int get no;
  String get name;
  int get carbGram;
  int get intakeGram;

  @JsonKey(ignore: true)
  $FoodCopyWith<Food> get copyWith;
}

/// @nodoc
abstract class $FoodCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) then) =
      _$FoodCopyWithImpl<$Res>;
  $Res call(
      {@nullable int id, int no, String name, int carbGram, int intakeGram});
}

/// @nodoc
class _$FoodCopyWithImpl<$Res> implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._value, this._then);

  final Food _value;
  // ignore: unused_field
  final $Res Function(Food) _then;

  @override
  $Res call({
    Object id = freezed,
    Object no = freezed,
    Object name = freezed,
    Object carbGram = freezed,
    Object intakeGram = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      no: no == freezed ? _value.no : no as int,
      name: name == freezed ? _value.name : name as String,
      carbGram: carbGram == freezed ? _value.carbGram : carbGram as int,
      intakeGram: intakeGram == freezed ? _value.intakeGram : intakeGram as int,
    ));
  }
}

/// @nodoc
abstract class _$FoodCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$FoodCopyWith(_Food value, $Res Function(_Food) then) =
      __$FoodCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable int id, int no, String name, int carbGram, int intakeGram});
}

/// @nodoc
class __$FoodCopyWithImpl<$Res> extends _$FoodCopyWithImpl<$Res>
    implements _$FoodCopyWith<$Res> {
  __$FoodCopyWithImpl(_Food _value, $Res Function(_Food) _then)
      : super(_value, (v) => _then(v as _Food));

  @override
  _Food get _value => super._value as _Food;

  @override
  $Res call({
    Object id = freezed,
    Object no = freezed,
    Object name = freezed,
    Object carbGram = freezed,
    Object intakeGram = freezed,
  }) {
    return _then(_Food(
      id: id == freezed ? _value.id : id as int,
      no: no == freezed ? _value.no : no as int,
      name: name == freezed ? _value.name : name as String,
      carbGram: carbGram == freezed ? _value.carbGram : carbGram as int,
      intakeGram: intakeGram == freezed ? _value.intakeGram : intakeGram as int,
    ));
  }
}

/// @nodoc
class _$_Food implements _Food {
  _$_Food(
      {@nullable this.id,
      @required this.no,
      @required this.name,
      @required this.carbGram,
      this.intakeGram = 0})
      : assert(no != null),
        assert(name != null),
        assert(carbGram != null),
        assert(intakeGram != null);

  @override
  @nullable
  final int id;
  @override
  final int no;
  @override
  final String name;
  @override
  final int carbGram;
  @JsonKey(defaultValue: 0)
  @override
  final int intakeGram;

  bool _didcarbGramPer1Gram = false;
  double _carbGramPer1Gram;

  @override
  double get carbGramPer1Gram {
    if (_didcarbGramPer1Gram == false) {
      _didcarbGramPer1Gram = true;
      _carbGramPer1Gram = carbGram.toDouble() / 100.0;
    }
    return _carbGramPer1Gram;
  }

  @override
  String toString() {
    return 'Food(id: $id, no: $no, name: $name, carbGram: $carbGram, intakeGram: $intakeGram, carbGramPer1Gram: $carbGramPer1Gram)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Food &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.no, no) ||
                const DeepCollectionEquality().equals(other.no, no)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.carbGram, carbGram) ||
                const DeepCollectionEquality()
                    .equals(other.carbGram, carbGram)) &&
            (identical(other.intakeGram, intakeGram) ||
                const DeepCollectionEquality()
                    .equals(other.intakeGram, intakeGram)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(no) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(carbGram) ^
      const DeepCollectionEquality().hash(intakeGram);

  @JsonKey(ignore: true)
  @override
  _$FoodCopyWith<_Food> get copyWith =>
      __$FoodCopyWithImpl<_Food>(this, _$identity);
}

abstract class _Food implements Food {
  factory _Food(
      {@nullable int id,
      @required int no,
      @required String name,
      @required int carbGram,
      int intakeGram}) = _$_Food;

  @override
  @nullable
  int get id;
  @override
  int get no;
  @override
  String get name;
  @override
  int get carbGram;
  @override
  int get intakeGram;
  @override
  @JsonKey(ignore: true)
  _$FoodCopyWith<_Food> get copyWith;
}
