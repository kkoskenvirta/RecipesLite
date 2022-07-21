// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthDataDTO _$AuthDataDTOFromJson(Map<String, dynamic> json) {
  return _AuthDataDTO.fromJson(json);
}

/// @nodoc
mixin _$AuthDataDTO {
  @JsonKey(name: 'expires')
  int get expires => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthDataDTOCopyWith<AuthDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthDataDTOCopyWith<$Res> {
  factory $AuthDataDTOCopyWith(
          AuthDataDTO value, $Res Function(AuthDataDTO) then) =
      _$AuthDataDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'expires') int expires,
      @JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class _$AuthDataDTOCopyWithImpl<$Res> implements $AuthDataDTOCopyWith<$Res> {
  _$AuthDataDTOCopyWithImpl(this._value, this._then);

  final AuthDataDTO _value;
  // ignore: unused_field
  final $Res Function(AuthDataDTO) _then;

  @override
  $Res call({
    Object? expires = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      expires: expires == freezed
          ? _value.expires
          : expires // ignore: cast_nullable_to_non_nullable
              as int,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthDataDTOCopyWith<$Res>
    implements $AuthDataDTOCopyWith<$Res> {
  factory _$$_AuthDataDTOCopyWith(
          _$_AuthDataDTO value, $Res Function(_$_AuthDataDTO) then) =
      __$$_AuthDataDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'expires') int expires,
      @JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class __$$_AuthDataDTOCopyWithImpl<$Res> extends _$AuthDataDTOCopyWithImpl<$Res>
    implements _$$_AuthDataDTOCopyWith<$Res> {
  __$$_AuthDataDTOCopyWithImpl(
      _$_AuthDataDTO _value, $Res Function(_$_AuthDataDTO) _then)
      : super(_value, (v) => _then(v as _$_AuthDataDTO));

  @override
  _$_AuthDataDTO get _value => super._value as _$_AuthDataDTO;

  @override
  $Res call({
    Object? expires = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$_AuthDataDTO(
      expires: expires == freezed
          ? _value.expires
          : expires // ignore: cast_nullable_to_non_nullable
              as int,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthDataDTO extends _AuthDataDTO {
  const _$_AuthDataDTO(
      {@JsonKey(name: 'expires') required this.expires,
      @JsonKey(name: 'access_token') required this.accessToken,
      @JsonKey(name: 'refresh_token') required this.refreshToken})
      : super._();

  factory _$_AuthDataDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AuthDataDTOFromJson(json);

  @override
  @JsonKey(name: 'expires')
  final int expires;
  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @override
  String toString() {
    return 'AuthDataDTO(expires: $expires, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthDataDTO &&
            const DeepCollectionEquality().equals(other.expires, expires) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(expires),
      const DeepCollectionEquality().hash(accessToken),
      const DeepCollectionEquality().hash(refreshToken));

  @JsonKey(ignore: true)
  @override
  _$$_AuthDataDTOCopyWith<_$_AuthDataDTO> get copyWith =>
      __$$_AuthDataDTOCopyWithImpl<_$_AuthDataDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthDataDTOToJson(
      this,
    );
  }
}

abstract class _AuthDataDTO extends AuthDataDTO {
  const factory _AuthDataDTO(
          {@JsonKey(name: 'expires') required final int expires,
          @JsonKey(name: 'access_token') required final String accessToken,
          @JsonKey(name: 'refresh_token') required final String refreshToken}) =
      _$_AuthDataDTO;
  const _AuthDataDTO._() : super._();

  factory _AuthDataDTO.fromJson(Map<String, dynamic> json) =
      _$_AuthDataDTO.fromJson;

  @override
  @JsonKey(name: 'expires')
  int get expires;
  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_AuthDataDTOCopyWith<_$_AuthDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
