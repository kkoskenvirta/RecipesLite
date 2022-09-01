// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  AuthStateStatus get status => throw _privateConstructorUsedError;
  RegisterStatus get registerStatus => throw _privateConstructorUsedError;
  AuthError? get error => throw _privateConstructorUsedError;
  AuthError? get registerError => throw _privateConstructorUsedError;
  bool get inProgress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {AuthStateStatus status,
      RegisterStatus registerStatus,
      AuthError? error,
      AuthError? registerError,
      bool inProgress});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? registerStatus = freezed,
    Object? error = freezed,
    Object? registerError = freezed,
    Object? inProgress = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStateStatus,
      registerStatus: registerStatus == freezed
          ? _value.registerStatus
          : registerStatus // ignore: cast_nullable_to_non_nullable
              as RegisterStatus,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AuthError?,
      registerError: registerError == freezed
          ? _value.registerError
          : registerError // ignore: cast_nullable_to_non_nullable
              as AuthError?,
      inProgress: inProgress == freezed
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthStateCopyWith(
          _$_AuthState value, $Res Function(_$_AuthState) then) =
      __$$_AuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AuthStateStatus status,
      RegisterStatus registerStatus,
      AuthError? error,
      AuthError? registerError,
      bool inProgress});
}

/// @nodoc
class __$$_AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AuthStateCopyWith<$Res> {
  __$$_AuthStateCopyWithImpl(
      _$_AuthState _value, $Res Function(_$_AuthState) _then)
      : super(_value, (v) => _then(v as _$_AuthState));

  @override
  _$_AuthState get _value => super._value as _$_AuthState;

  @override
  $Res call({
    Object? status = freezed,
    Object? registerStatus = freezed,
    Object? error = freezed,
    Object? registerError = freezed,
    Object? inProgress = freezed,
  }) {
    return _then(_$_AuthState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStateStatus,
      registerStatus: registerStatus == freezed
          ? _value.registerStatus
          : registerStatus // ignore: cast_nullable_to_non_nullable
              as RegisterStatus,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AuthError?,
      registerError: registerError == freezed
          ? _value.registerError
          : registerError // ignore: cast_nullable_to_non_nullable
              as AuthError?,
      inProgress: inProgress == freezed
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState(
      {required this.status,
      required this.registerStatus,
      required this.error,
      required this.registerError,
      required this.inProgress});

  @override
  final AuthStateStatus status;
  @override
  final RegisterStatus registerStatus;
  @override
  final AuthError? error;
  @override
  final AuthError? registerError;
  @override
  final bool inProgress;

  @override
  String toString() {
    return 'AuthState(status: $status, registerStatus: $registerStatus, error: $error, registerError: $registerError, inProgress: $inProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.registerStatus, registerStatus) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.registerError, registerError) &&
            const DeepCollectionEquality()
                .equals(other.inProgress, inProgress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(registerStatus),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(registerError),
      const DeepCollectionEquality().hash(inProgress));

  @JsonKey(ignore: true)
  @override
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      __$$_AuthStateCopyWithImpl<_$_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {required final AuthStateStatus status,
      required final RegisterStatus registerStatus,
      required final AuthError? error,
      required final AuthError? registerError,
      required final bool inProgress}) = _$_AuthState;

  @override
  AuthStateStatus get status;
  @override
  RegisterStatus get registerStatus;
  @override
  AuthError? get error;
  @override
  AuthError? get registerError;
  @override
  bool get inProgress;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
