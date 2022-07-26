// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'incredient_id_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IncredientIdDTO _$IncredientIdDTOFromJson(Map<String, dynamic> json) {
  return _IncredientIdDTO.fromJson(json);
}

/// @nodoc
mixin _$IncredientIdDTO {
  @JsonKey(name: "incredient_id")
  IncredientDataDTO get incredient => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncredientIdDTOCopyWith<IncredientIdDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncredientIdDTOCopyWith<$Res> {
  factory $IncredientIdDTOCopyWith(
          IncredientIdDTO value, $Res Function(IncredientIdDTO) then) =
      _$IncredientIdDTOCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: "incredient_id") IncredientDataDTO incredient});

  $IncredientDataDTOCopyWith<$Res> get incredient;
}

/// @nodoc
class _$IncredientIdDTOCopyWithImpl<$Res>
    implements $IncredientIdDTOCopyWith<$Res> {
  _$IncredientIdDTOCopyWithImpl(this._value, this._then);

  final IncredientIdDTO _value;
  // ignore: unused_field
  final $Res Function(IncredientIdDTO) _then;

  @override
  $Res call({
    Object? incredient = freezed,
  }) {
    return _then(_value.copyWith(
      incredient: incredient == freezed
          ? _value.incredient
          : incredient // ignore: cast_nullable_to_non_nullable
              as IncredientDataDTO,
    ));
  }

  @override
  $IncredientDataDTOCopyWith<$Res> get incredient {
    return $IncredientDataDTOCopyWith<$Res>(_value.incredient, (value) {
      return _then(_value.copyWith(incredient: value));
    });
  }
}

/// @nodoc
abstract class _$$_IncredientIdDTOCopyWith<$Res>
    implements $IncredientIdDTOCopyWith<$Res> {
  factory _$$_IncredientIdDTOCopyWith(
          _$_IncredientIdDTO value, $Res Function(_$_IncredientIdDTO) then) =
      __$$_IncredientIdDTOCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: "incredient_id") IncredientDataDTO incredient});

  @override
  $IncredientDataDTOCopyWith<$Res> get incredient;
}

/// @nodoc
class __$$_IncredientIdDTOCopyWithImpl<$Res>
    extends _$IncredientIdDTOCopyWithImpl<$Res>
    implements _$$_IncredientIdDTOCopyWith<$Res> {
  __$$_IncredientIdDTOCopyWithImpl(
      _$_IncredientIdDTO _value, $Res Function(_$_IncredientIdDTO) _then)
      : super(_value, (v) => _then(v as _$_IncredientIdDTO));

  @override
  _$_IncredientIdDTO get _value => super._value as _$_IncredientIdDTO;

  @override
  $Res call({
    Object? incredient = freezed,
  }) {
    return _then(_$_IncredientIdDTO(
      incredient: incredient == freezed
          ? _value.incredient
          : incredient // ignore: cast_nullable_to_non_nullable
              as IncredientDataDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IncredientIdDTO extends _IncredientIdDTO {
  _$_IncredientIdDTO({@JsonKey(name: "incredient_id") required this.incredient})
      : super._();

  factory _$_IncredientIdDTO.fromJson(Map<String, dynamic> json) =>
      _$$_IncredientIdDTOFromJson(json);

  @override
  @JsonKey(name: "incredient_id")
  final IncredientDataDTO incredient;

  @override
  String toString() {
    return 'IncredientIdDTO(incredient: $incredient)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IncredientIdDTO &&
            const DeepCollectionEquality()
                .equals(other.incredient, incredient));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(incredient));

  @JsonKey(ignore: true)
  @override
  _$$_IncredientIdDTOCopyWith<_$_IncredientIdDTO> get copyWith =>
      __$$_IncredientIdDTOCopyWithImpl<_$_IncredientIdDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IncredientIdDTOToJson(
      this,
    );
  }
}

abstract class _IncredientIdDTO extends IncredientIdDTO {
  factory _IncredientIdDTO(
      {@JsonKey(name: "incredient_id")
          required final IncredientDataDTO incredient}) = _$_IncredientIdDTO;
  _IncredientIdDTO._() : super._();

  factory _IncredientIdDTO.fromJson(Map<String, dynamic> json) =
      _$_IncredientIdDTO.fromJson;

  @override
  @JsonKey(name: "incredient_id")
  IncredientDataDTO get incredient;
  @override
  @JsonKey(ignore: true)
  _$$_IncredientIdDTOCopyWith<_$_IncredientIdDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
