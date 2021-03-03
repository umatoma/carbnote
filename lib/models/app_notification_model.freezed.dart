// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'app_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AppNotificationTearOff {
  const _$AppNotificationTearOff();

// ignore: unused_element
  _AppNotification call(
      {@required AppNotificationType type, @required String message}) {
    return _AppNotification(
      type: type,
      message: message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AppNotification = _$AppNotificationTearOff();

/// @nodoc
mixin _$AppNotification {
  AppNotificationType get type;
  String get message;

  @JsonKey(ignore: true)
  $AppNotificationCopyWith<AppNotification> get copyWith;
}

/// @nodoc
abstract class $AppNotificationCopyWith<$Res> {
  factory $AppNotificationCopyWith(
          AppNotification value, $Res Function(AppNotification) then) =
      _$AppNotificationCopyWithImpl<$Res>;
  $Res call({AppNotificationType type, String message});
}

/// @nodoc
class _$AppNotificationCopyWithImpl<$Res>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._value, this._then);

  final AppNotification _value;
  // ignore: unused_field
  final $Res Function(AppNotification) _then;

  @override
  $Res call({
    Object type = freezed,
    Object message = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed ? _value.type : type as AppNotificationType,
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
abstract class _$AppNotificationCopyWith<$Res>
    implements $AppNotificationCopyWith<$Res> {
  factory _$AppNotificationCopyWith(
          _AppNotification value, $Res Function(_AppNotification) then) =
      __$AppNotificationCopyWithImpl<$Res>;
  @override
  $Res call({AppNotificationType type, String message});
}

/// @nodoc
class __$AppNotificationCopyWithImpl<$Res>
    extends _$AppNotificationCopyWithImpl<$Res>
    implements _$AppNotificationCopyWith<$Res> {
  __$AppNotificationCopyWithImpl(
      _AppNotification _value, $Res Function(_AppNotification) _then)
      : super(_value, (v) => _then(v as _AppNotification));

  @override
  _AppNotification get _value => super._value as _AppNotification;

  @override
  $Res call({
    Object type = freezed,
    Object message = freezed,
  }) {
    return _then(_AppNotification(
      type: type == freezed ? _value.type : type as AppNotificationType,
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$_AppNotification implements _AppNotification {
  const _$_AppNotification({@required this.type, @required this.message})
      : assert(type != null),
        assert(message != null);

  @override
  final AppNotificationType type;
  @override
  final String message;

  @override
  String toString() {
    return 'AppNotification(type: $type, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppNotification &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$AppNotificationCopyWith<_AppNotification> get copyWith =>
      __$AppNotificationCopyWithImpl<_AppNotification>(this, _$identity);
}

abstract class _AppNotification implements AppNotification {
  const factory _AppNotification(
      {@required AppNotificationType type,
      @required String message}) = _$_AppNotification;

  @override
  AppNotificationType get type;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$AppNotificationCopyWith<_AppNotification> get copyWith;
}
