// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'directus_file_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DirectusFileDTO _$DirectusFileDTOFromJson(Map<String, dynamic> json) {
  return _DirectusFileDTO.fromJson(json);
}

/// @nodoc
mixin _$DirectusFileDTO {
  DirectusFileDataDTO get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DirectusFileDTOCopyWith<DirectusFileDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectusFileDTOCopyWith<$Res> {
  factory $DirectusFileDTOCopyWith(
          DirectusFileDTO value, $Res Function(DirectusFileDTO) then) =
      _$DirectusFileDTOCopyWithImpl<$Res>;
  $Res call({DirectusFileDataDTO data});

  $DirectusFileDataDTOCopyWith<$Res> get data;
}

/// @nodoc
class _$DirectusFileDTOCopyWithImpl<$Res>
    implements $DirectusFileDTOCopyWith<$Res> {
  _$DirectusFileDTOCopyWithImpl(this._value, this._then);

  final DirectusFileDTO _value;
  // ignore: unused_field
  final $Res Function(DirectusFileDTO) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DirectusFileDataDTO,
    ));
  }

  @override
  $DirectusFileDataDTOCopyWith<$Res> get data {
    return $DirectusFileDataDTOCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$$_DirectusFileDTOCopyWith<$Res>
    implements $DirectusFileDTOCopyWith<$Res> {
  factory _$$_DirectusFileDTOCopyWith(
          _$_DirectusFileDTO value, $Res Function(_$_DirectusFileDTO) then) =
      __$$_DirectusFileDTOCopyWithImpl<$Res>;
  @override
  $Res call({DirectusFileDataDTO data});

  @override
  $DirectusFileDataDTOCopyWith<$Res> get data;
}

/// @nodoc
class __$$_DirectusFileDTOCopyWithImpl<$Res>
    extends _$DirectusFileDTOCopyWithImpl<$Res>
    implements _$$_DirectusFileDTOCopyWith<$Res> {
  __$$_DirectusFileDTOCopyWithImpl(
      _$_DirectusFileDTO _value, $Res Function(_$_DirectusFileDTO) _then)
      : super(_value, (v) => _then(v as _$_DirectusFileDTO));

  @override
  _$_DirectusFileDTO get _value => super._value as _$_DirectusFileDTO;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_DirectusFileDTO(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DirectusFileDataDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DirectusFileDTO implements _DirectusFileDTO {
  const _$_DirectusFileDTO({required this.data});

  factory _$_DirectusFileDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DirectusFileDTOFromJson(json);

  @override
  final DirectusFileDataDTO data;

  @override
  String toString() {
    return 'DirectusFileDTO(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DirectusFileDTO &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_DirectusFileDTOCopyWith<_$_DirectusFileDTO> get copyWith =>
      __$$_DirectusFileDTOCopyWithImpl<_$_DirectusFileDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DirectusFileDTOToJson(
      this,
    );
  }
}

abstract class _DirectusFileDTO implements DirectusFileDTO {
  const factory _DirectusFileDTO({required final DirectusFileDataDTO data}) =
      _$_DirectusFileDTO;

  factory _DirectusFileDTO.fromJson(Map<String, dynamic> json) =
      _$_DirectusFileDTO.fromJson;

  @override
  DirectusFileDataDTO get data;
  @override
  @JsonKey(ignore: true)
  _$$_DirectusFileDTOCopyWith<_$_DirectusFileDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
