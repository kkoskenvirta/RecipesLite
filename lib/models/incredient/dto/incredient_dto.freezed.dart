// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'incredient_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IncredientDTO _$IncredientDTOFromJson(Map<String, dynamic> json) {
  return _IncredientDTO.fromJson(json);
}

/// @nodoc
mixin _$IncredientDTO {
  List<IncredientDataDTO> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncredientDTOCopyWith<IncredientDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncredientDTOCopyWith<$Res> {
  factory $IncredientDTOCopyWith(
          IncredientDTO value, $Res Function(IncredientDTO) then) =
      _$IncredientDTOCopyWithImpl<$Res>;
  $Res call({List<IncredientDataDTO> data});
}

/// @nodoc
class _$IncredientDTOCopyWithImpl<$Res>
    implements $IncredientDTOCopyWith<$Res> {
  _$IncredientDTOCopyWithImpl(this._value, this._then);

  final IncredientDTO _value;
  // ignore: unused_field
  final $Res Function(IncredientDTO) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<IncredientDataDTO>,
    ));
  }
}

/// @nodoc
abstract class _$$_IncredientDTOCopyWith<$Res>
    implements $IncredientDTOCopyWith<$Res> {
  factory _$$_IncredientDTOCopyWith(
          _$_IncredientDTO value, $Res Function(_$_IncredientDTO) then) =
      __$$_IncredientDTOCopyWithImpl<$Res>;
  @override
  $Res call({List<IncredientDataDTO> data});
}

/// @nodoc
class __$$_IncredientDTOCopyWithImpl<$Res>
    extends _$IncredientDTOCopyWithImpl<$Res>
    implements _$$_IncredientDTOCopyWith<$Res> {
  __$$_IncredientDTOCopyWithImpl(
      _$_IncredientDTO _value, $Res Function(_$_IncredientDTO) _then)
      : super(_value, (v) => _then(v as _$_IncredientDTO));

  @override
  _$_IncredientDTO get _value => super._value as _$_IncredientDTO;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_IncredientDTO(
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<IncredientDataDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IncredientDTO implements _IncredientDTO {
  const _$_IncredientDTO({required final List<IncredientDataDTO> data})
      : _data = data;

  factory _$_IncredientDTO.fromJson(Map<String, dynamic> json) =>
      _$$_IncredientDTOFromJson(json);

  final List<IncredientDataDTO> _data;
  @override
  List<IncredientDataDTO> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'IncredientDTO(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IncredientDTO &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_IncredientDTOCopyWith<_$_IncredientDTO> get copyWith =>
      __$$_IncredientDTOCopyWithImpl<_$_IncredientDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IncredientDTOToJson(
      this,
    );
  }
}

abstract class _IncredientDTO implements IncredientDTO {
  const factory _IncredientDTO({required final List<IncredientDataDTO> data}) =
      _$_IncredientDTO;

  factory _IncredientDTO.fromJson(Map<String, dynamic> json) =
      _$_IncredientDTO.fromJson;

  @override
  List<IncredientDataDTO> get data;
  @override
  @JsonKey(ignore: true)
  _$$_IncredientDTOCopyWith<_$_IncredientDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
