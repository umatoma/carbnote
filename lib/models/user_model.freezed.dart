// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

// ignore: unused_element
  _User call(
      {@nullable String id,
      @nullable String nickname,
      @nullable String imageURL,
      @required int goalCarbGram,
      @required bool isAnonymous,
      @required DateTime updatedAt,
      @required DateTime createdAt}) {
    return _User(
      id: id,
      nickname: nickname,
      imageURL: imageURL,
      goalCarbGram: goalCarbGram,
      isAnonymous: isAnonymous,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  @nullable
  String get id;
  @nullable
  String get nickname;
  @nullable
  String get imageURL;
  int get goalCarbGram;
  bool get isAnonymous;
  DateTime get updatedAt;
  DateTime get createdAt;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {@nullable String id,
      @nullable String nickname,
      @nullable String imageURL,
      int goalCarbGram,
      bool isAnonymous,
      DateTime updatedAt,
      DateTime createdAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object id = freezed,
    Object nickname = freezed,
    Object imageURL = freezed,
    Object goalCarbGram = freezed,
    Object isAnonymous = freezed,
    Object updatedAt = freezed,
    Object createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      nickname: nickname == freezed ? _value.nickname : nickname as String,
      imageURL: imageURL == freezed ? _value.imageURL : imageURL as String,
      goalCarbGram:
          goalCarbGram == freezed ? _value.goalCarbGram : goalCarbGram as int,
      isAnonymous:
          isAnonymous == freezed ? _value.isAnonymous : isAnonymous as bool,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String id,
      @nullable String nickname,
      @nullable String imageURL,
      int goalCarbGram,
      bool isAnonymous,
      DateTime updatedAt,
      DateTime createdAt});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object id = freezed,
    Object nickname = freezed,
    Object imageURL = freezed,
    Object goalCarbGram = freezed,
    Object isAnonymous = freezed,
    Object updatedAt = freezed,
    Object createdAt = freezed,
  }) {
    return _then(_User(
      id: id == freezed ? _value.id : id as String,
      nickname: nickname == freezed ? _value.nickname : nickname as String,
      imageURL: imageURL == freezed ? _value.imageURL : imageURL as String,
      goalCarbGram:
          goalCarbGram == freezed ? _value.goalCarbGram : goalCarbGram as int,
      isAnonymous:
          isAnonymous == freezed ? _value.isAnonymous : isAnonymous as bool,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
    ));
  }
}

/// @nodoc
class _$_User implements _User {
  const _$_User(
      {@nullable this.id,
      @nullable this.nickname,
      @nullable this.imageURL,
      @required this.goalCarbGram,
      @required this.isAnonymous,
      @required this.updatedAt,
      @required this.createdAt})
      : assert(goalCarbGram != null),
        assert(isAnonymous != null),
        assert(updatedAt != null),
        assert(createdAt != null);

  @override
  @nullable
  final String id;
  @override
  @nullable
  final String nickname;
  @override
  @nullable
  final String imageURL;
  @override
  final int goalCarbGram;
  @override
  final bool isAnonymous;
  @override
  final DateTime updatedAt;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'User(id: $id, nickname: $nickname, imageURL: $imageURL, goalCarbGram: $goalCarbGram, isAnonymous: $isAnonymous, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.nickname, nickname) ||
                const DeepCollectionEquality()
                    .equals(other.nickname, nickname)) &&
            (identical(other.imageURL, imageURL) ||
                const DeepCollectionEquality()
                    .equals(other.imageURL, imageURL)) &&
            (identical(other.goalCarbGram, goalCarbGram) ||
                const DeepCollectionEquality()
                    .equals(other.goalCarbGram, goalCarbGram)) &&
            (identical(other.isAnonymous, isAnonymous) ||
                const DeepCollectionEquality()
                    .equals(other.isAnonymous, isAnonymous)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(nickname) ^
      const DeepCollectionEquality().hash(imageURL) ^
      const DeepCollectionEquality().hash(goalCarbGram) ^
      const DeepCollectionEquality().hash(isAnonymous) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(createdAt);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);
}

abstract class _User implements User {
  const factory _User(
      {@nullable String id,
      @nullable String nickname,
      @nullable String imageURL,
      @required int goalCarbGram,
      @required bool isAnonymous,
      @required DateTime updatedAt,
      @required DateTime createdAt}) = _$_User;

  @override
  @nullable
  String get id;
  @override
  @nullable
  String get nickname;
  @override
  @nullable
  String get imageURL;
  @override
  int get goalCarbGram;
  @override
  bool get isAnonymous;
  @override
  DateTime get updatedAt;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith;
}
