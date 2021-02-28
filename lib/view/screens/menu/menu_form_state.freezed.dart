// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'menu_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MenuFormStateTearOff {
  const _$MenuFormStateTearOff();

// ignore: unused_element
  _MenuFormState call(
      {@required bool isProcessing,
      @nullable Object error,
      @required User user,
      @nullable File imageFile,
      @required Menu menu}) {
    return _MenuFormState(
      isProcessing: isProcessing,
      error: error,
      user: user,
      imageFile: imageFile,
      menu: menu,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $MenuFormState = _$MenuFormStateTearOff();

/// @nodoc
mixin _$MenuFormState {
  bool get isProcessing;
  @nullable
  Object get error;
  User get user;
  @nullable
  File get imageFile;
  Menu get menu;

  @JsonKey(ignore: true)
  $MenuFormStateCopyWith<MenuFormState> get copyWith;
}

/// @nodoc
abstract class $MenuFormStateCopyWith<$Res> {
  factory $MenuFormStateCopyWith(
          MenuFormState value, $Res Function(MenuFormState) then) =
      _$MenuFormStateCopyWithImpl<$Res>;
  $Res call(
      {bool isProcessing,
      @nullable Object error,
      User user,
      @nullable File imageFile,
      Menu menu});

  $UserCopyWith<$Res> get user;
  $MenuCopyWith<$Res> get menu;
}

/// @nodoc
class _$MenuFormStateCopyWithImpl<$Res>
    implements $MenuFormStateCopyWith<$Res> {
  _$MenuFormStateCopyWithImpl(this._value, this._then);

  final MenuFormState _value;
  // ignore: unused_field
  final $Res Function(MenuFormState) _then;

  @override
  $Res call({
    Object isProcessing = freezed,
    Object error = freezed,
    Object user = freezed,
    Object imageFile = freezed,
    Object menu = freezed,
  }) {
    return _then(_value.copyWith(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      user: user == freezed ? _value.user : user as User,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
      menu: menu == freezed ? _value.menu : menu as Menu,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    if (_value.user == null) {
      return null;
    }
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $MenuCopyWith<$Res> get menu {
    if (_value.menu == null) {
      return null;
    }
    return $MenuCopyWith<$Res>(_value.menu, (value) {
      return _then(_value.copyWith(menu: value));
    });
  }
}

/// @nodoc
abstract class _$MenuFormStateCopyWith<$Res>
    implements $MenuFormStateCopyWith<$Res> {
  factory _$MenuFormStateCopyWith(
          _MenuFormState value, $Res Function(_MenuFormState) then) =
      __$MenuFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isProcessing,
      @nullable Object error,
      User user,
      @nullable File imageFile,
      Menu menu});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $MenuCopyWith<$Res> get menu;
}

/// @nodoc
class __$MenuFormStateCopyWithImpl<$Res>
    extends _$MenuFormStateCopyWithImpl<$Res>
    implements _$MenuFormStateCopyWith<$Res> {
  __$MenuFormStateCopyWithImpl(
      _MenuFormState _value, $Res Function(_MenuFormState) _then)
      : super(_value, (v) => _then(v as _MenuFormState));

  @override
  _MenuFormState get _value => super._value as _MenuFormState;

  @override
  $Res call({
    Object isProcessing = freezed,
    Object error = freezed,
    Object user = freezed,
    Object imageFile = freezed,
    Object menu = freezed,
  }) {
    return _then(_MenuFormState(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      user: user == freezed ? _value.user : user as User,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
      menu: menu == freezed ? _value.menu : menu as Menu,
    ));
  }
}

/// @nodoc
class _$_MenuFormState implements _MenuFormState {
  _$_MenuFormState(
      {@required this.isProcessing,
      @nullable this.error,
      @required this.user,
      @nullable this.imageFile,
      @required this.menu})
      : assert(isProcessing != null),
        assert(user != null),
        assert(menu != null);

  @override
  final bool isProcessing;
  @override
  @nullable
  final Object error;
  @override
  final User user;
  @override
  @nullable
  final File imageFile;
  @override
  final Menu menu;

  bool _didcanSubmitForm = false;
  bool _canSubmitForm;

  @override
  bool get canSubmitForm {
    if (_didcanSubmitForm == false) {
      _didcanSubmitForm = true;
      _canSubmitForm = menu.name.isNotEmpty && menu.unit.isNotEmpty;
    }
    return _canSubmitForm;
  }

  @override
  String toString() {
    return 'MenuFormState(isProcessing: $isProcessing, error: $error, user: $user, imageFile: $imageFile, menu: $menu, canSubmitForm: $canSubmitForm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MenuFormState &&
            (identical(other.isProcessing, isProcessing) ||
                const DeepCollectionEquality()
                    .equals(other.isProcessing, isProcessing)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)) &&
            (identical(other.menu, menu) ||
                const DeepCollectionEquality().equals(other.menu, menu)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isProcessing) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(imageFile) ^
      const DeepCollectionEquality().hash(menu);

  @JsonKey(ignore: true)
  @override
  _$MenuFormStateCopyWith<_MenuFormState> get copyWith =>
      __$MenuFormStateCopyWithImpl<_MenuFormState>(this, _$identity);
}

abstract class _MenuFormState implements MenuFormState {
  factory _MenuFormState(
      {@required bool isProcessing,
      @nullable Object error,
      @required User user,
      @nullable File imageFile,
      @required Menu menu}) = _$_MenuFormState;

  @override
  bool get isProcessing;
  @override
  @nullable
  Object get error;
  @override
  User get user;
  @override
  @nullable
  File get imageFile;
  @override
  Menu get menu;
  @override
  @JsonKey(ignore: true)
  _$MenuFormStateCopyWith<_MenuFormState> get copyWith;
}
