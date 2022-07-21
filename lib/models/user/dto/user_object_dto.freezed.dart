// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_object_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserObjectDTO _$UserObjectDTOFromJson(Map<String, dynamic> json) {
  return _UserObjectDTO.fromJson(json);
}

/// @nodoc
mixin _$UserObjectDTO {
  UserDTO get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserObjectDTOCopyWith<UserObjectDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserObjectDTOCopyWith<$Res> {
  factory $UserObjectDTOCopyWith(
          UserObjectDTO value, $Res Function(UserObjectDTO) then) =
      _$UserObjectDTOCopyWithImpl<$Res>;
  $Res call({UserDTO data});

  $UserDTOCopyWith<$Res> get data;
}

/// @nodoc
class _$UserObjectDTOCopyWithImpl<$Res>
    implements $UserObjectDTOCopyWith<$Res> {
  _$UserObjectDTOCopyWithImpl(this._value, this._then);

  final UserObjectDTO _value;
  // ignore: unused_field
  final $Res Function(UserObjectDTO) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserDTO,
    ));
  }

  @override
  $UserDTOCopyWith<$Res> get data {
    return $UserDTOCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserObjectDTOCopyWith<$Res>
    implements $UserObjectDTOCopyWith<$Res> {
  factory _$$_UserObjectDTOCopyWith(
          _$_UserObjectDTO value, $Res Function(_$_UserObjectDTO) then) =
      __$$_UserObjectDTOCopyWithImpl<$Res>;
  @override
  $Res call({UserDTO data});

  @override
  $UserDTOCopyWith<$Res> get data;
}

/// @nodoc
class __$$_UserObjectDTOCopyWithImpl<$Res>
    extends _$UserObjectDTOCopyWithImpl<$Res>
    implements _$$_UserObjectDTOCopyWith<$Res> {
  __$$_UserObjectDTOCopyWithImpl(
      _$_UserObjectDTO _value, $Res Function(_$_UserObjectDTO) _then)
      : super(_value, (v) => _then(v as _$_UserObjectDTO));

  @override
  _$_UserObjectDTO get _value => super._value as _$_UserObjectDTO;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_UserObjectDTO(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserObjectDTO implements _UserObjectDTO {
  const _$_UserObjectDTO({required this.data});

  factory _$_UserObjectDTO.fromJson(Map<String, dynamic> json) =>
      _$$_UserObjectDTOFromJson(json);

  @override
  final UserDTO data;

  @override
  String toString() {
    return 'UserObjectDTO(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserObjectDTO &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_UserObjectDTOCopyWith<_$_UserObjectDTO> get copyWith =>
      __$$_UserObjectDTOCopyWithImpl<_$_UserObjectDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserObjectDTOToJson(
      this,
    );
  }
}

abstract class _UserObjectDTO implements UserObjectDTO {
  const factory _UserObjectDTO({required final UserDTO data}) =
      _$_UserObjectDTO;

  factory _UserObjectDTO.fromJson(Map<String, dynamic> json) =
      _$_UserObjectDTO.fromJson;

  @override
  UserDTO get data;
  @override
  @JsonKey(ignore: true)
  _$$_UserObjectDTOCopyWith<_$_UserObjectDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
