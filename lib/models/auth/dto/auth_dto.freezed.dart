// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthDTO _$AuthDTOFromJson(Map<String, dynamic> json) {
  return _AuthDTO.fromJson(json);
}

/// @nodoc
mixin _$AuthDTO {
  AuthDataDTO get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthDTOCopyWith<AuthDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthDTOCopyWith<$Res> {
  factory $AuthDTOCopyWith(AuthDTO value, $Res Function(AuthDTO) then) =
      _$AuthDTOCopyWithImpl<$Res>;
  $Res call({AuthDataDTO data});

  $AuthDataDTOCopyWith<$Res> get data;
}

/// @nodoc
class _$AuthDTOCopyWithImpl<$Res> implements $AuthDTOCopyWith<$Res> {
  _$AuthDTOCopyWithImpl(this._value, this._then);

  final AuthDTO _value;
  // ignore: unused_field
  final $Res Function(AuthDTO) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AuthDataDTO,
    ));
  }

  @override
  $AuthDataDTOCopyWith<$Res> get data {
    return $AuthDataDTOCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$$_AuthDTOCopyWith<$Res> implements $AuthDTOCopyWith<$Res> {
  factory _$$_AuthDTOCopyWith(
          _$_AuthDTO value, $Res Function(_$_AuthDTO) then) =
      __$$_AuthDTOCopyWithImpl<$Res>;
  @override
  $Res call({AuthDataDTO data});

  @override
  $AuthDataDTOCopyWith<$Res> get data;
}

/// @nodoc
class __$$_AuthDTOCopyWithImpl<$Res> extends _$AuthDTOCopyWithImpl<$Res>
    implements _$$_AuthDTOCopyWith<$Res> {
  __$$_AuthDTOCopyWithImpl(_$_AuthDTO _value, $Res Function(_$_AuthDTO) _then)
      : super(_value, (v) => _then(v as _$_AuthDTO));

  @override
  _$_AuthDTO get _value => super._value as _$_AuthDTO;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_AuthDTO(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AuthDataDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthDTO implements _AuthDTO {
  const _$_AuthDTO({required this.data});

  factory _$_AuthDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AuthDTOFromJson(json);

  @override
  final AuthDataDTO data;

  @override
  String toString() {
    return 'AuthDTO(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthDTO &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_AuthDTOCopyWith<_$_AuthDTO> get copyWith =>
      __$$_AuthDTOCopyWithImpl<_$_AuthDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthDTOToJson(this);
  }
}

abstract class _AuthDTO implements AuthDTO {
  const factory _AuthDTO({required final AuthDataDTO data}) = _$_AuthDTO;

  factory _AuthDTO.fromJson(Map<String, dynamic> json) = _$_AuthDTO.fromJson;

  @override
  AuthDataDTO get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthDTOCopyWith<_$_AuthDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
