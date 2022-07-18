// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_data_object_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDataObjectDTO _$UserDataObjectDTOFromJson(Map<String, dynamic> json) {
  return _UserDataObjectDTO.fromJson(json);
}

/// @nodoc
mixin _$UserDataObjectDTO {
  UserDataDTO get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataObjectDTOCopyWith<UserDataObjectDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataObjectDTOCopyWith<$Res> {
  factory $UserDataObjectDTOCopyWith(
          UserDataObjectDTO value, $Res Function(UserDataObjectDTO) then) =
      _$UserDataObjectDTOCopyWithImpl<$Res>;
  $Res call({UserDataDTO data});

  $UserDataDTOCopyWith<$Res> get data;
}

/// @nodoc
class _$UserDataObjectDTOCopyWithImpl<$Res>
    implements $UserDataObjectDTOCopyWith<$Res> {
  _$UserDataObjectDTOCopyWithImpl(this._value, this._then);

  final UserDataObjectDTO _value;
  // ignore: unused_field
  final $Res Function(UserDataObjectDTO) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserDataDTO,
    ));
  }

  @override
  $UserDataDTOCopyWith<$Res> get data {
    return $UserDataDTOCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserDataObjectDTOCopyWith<$Res>
    implements $UserDataObjectDTOCopyWith<$Res> {
  factory _$$_UserDataObjectDTOCopyWith(_$_UserDataObjectDTO value,
          $Res Function(_$_UserDataObjectDTO) then) =
      __$$_UserDataObjectDTOCopyWithImpl<$Res>;
  @override
  $Res call({UserDataDTO data});

  @override
  $UserDataDTOCopyWith<$Res> get data;
}

/// @nodoc
class __$$_UserDataObjectDTOCopyWithImpl<$Res>
    extends _$UserDataObjectDTOCopyWithImpl<$Res>
    implements _$$_UserDataObjectDTOCopyWith<$Res> {
  __$$_UserDataObjectDTOCopyWithImpl(
      _$_UserDataObjectDTO _value, $Res Function(_$_UserDataObjectDTO) _then)
      : super(_value, (v) => _then(v as _$_UserDataObjectDTO));

  @override
  _$_UserDataObjectDTO get _value => super._value as _$_UserDataObjectDTO;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_UserDataObjectDTO(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserDataDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDataObjectDTO implements _UserDataObjectDTO {
  const _$_UserDataObjectDTO({required this.data});

  factory _$_UserDataObjectDTO.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataObjectDTOFromJson(json);

  @override
  final UserDataDTO data;

  @override
  String toString() {
    return 'UserDataObjectDTO(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDataObjectDTO &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_UserDataObjectDTOCopyWith<_$_UserDataObjectDTO> get copyWith =>
      __$$_UserDataObjectDTOCopyWithImpl<_$_UserDataObjectDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDataObjectDTOToJson(this);
  }
}

abstract class _UserDataObjectDTO implements UserDataObjectDTO {
  const factory _UserDataObjectDTO({required final UserDataDTO data}) =
      _$_UserDataObjectDTO;

  factory _UserDataObjectDTO.fromJson(Map<String, dynamic> json) =
      _$_UserDataObjectDTO.fromJson;

  @override
  UserDataDTO get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserDataObjectDTOCopyWith<_$_UserDataObjectDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
