// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'incredient_post_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IncredientPostRequestDTO _$IncredientPostRequestDTOFromJson(
    Map<String, dynamic> json) {
  return _IncredientPostRequestDTO.fromJson(json);
}

/// @nodoc
mixin _$IncredientPostRequestDTO {
  String? get name => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncredientPostRequestDTOCopyWith<IncredientPostRequestDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncredientPostRequestDTOCopyWith<$Res> {
  factory $IncredientPostRequestDTOCopyWith(IncredientPostRequestDTO value,
          $Res Function(IncredientPostRequestDTO) then) =
      _$IncredientPostRequestDTOCopyWithImpl<$Res>;
  $Res call({String? name, double? amount, String? unit});
}

/// @nodoc
class _$IncredientPostRequestDTOCopyWithImpl<$Res>
    implements $IncredientPostRequestDTOCopyWith<$Res> {
  _$IncredientPostRequestDTOCopyWithImpl(this._value, this._then);

  final IncredientPostRequestDTO _value;
  // ignore: unused_field
  final $Res Function(IncredientPostRequestDTO) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? amount = freezed,
    Object? unit = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_IncredientPostRequestDTOCopyWith<$Res>
    implements $IncredientPostRequestDTOCopyWith<$Res> {
  factory _$$_IncredientPostRequestDTOCopyWith(
          _$_IncredientPostRequestDTO value,
          $Res Function(_$_IncredientPostRequestDTO) then) =
      __$$_IncredientPostRequestDTOCopyWithImpl<$Res>;
  @override
  $Res call({String? name, double? amount, String? unit});
}

/// @nodoc
class __$$_IncredientPostRequestDTOCopyWithImpl<$Res>
    extends _$IncredientPostRequestDTOCopyWithImpl<$Res>
    implements _$$_IncredientPostRequestDTOCopyWith<$Res> {
  __$$_IncredientPostRequestDTOCopyWithImpl(_$_IncredientPostRequestDTO _value,
      $Res Function(_$_IncredientPostRequestDTO) _then)
      : super(_value, (v) => _then(v as _$_IncredientPostRequestDTO));

  @override
  _$_IncredientPostRequestDTO get _value =>
      super._value as _$_IncredientPostRequestDTO;

  @override
  $Res call({
    Object? name = freezed,
    Object? amount = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$_IncredientPostRequestDTO(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IncredientPostRequestDTO extends _IncredientPostRequestDTO {
  _$_IncredientPostRequestDTO({this.name, this.amount, this.unit}) : super._();

  factory _$_IncredientPostRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$$_IncredientPostRequestDTOFromJson(json);

  @override
  final String? name;
  @override
  final double? amount;
  @override
  final String? unit;

  @override
  String toString() {
    return 'IncredientPostRequestDTO(name: $name, amount: $amount, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IncredientPostRequestDTO &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.unit, unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(unit));

  @JsonKey(ignore: true)
  @override
  _$$_IncredientPostRequestDTOCopyWith<_$_IncredientPostRequestDTO>
      get copyWith => __$$_IncredientPostRequestDTOCopyWithImpl<
          _$_IncredientPostRequestDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IncredientPostRequestDTOToJson(
      this,
    );
  }
}

abstract class _IncredientPostRequestDTO extends IncredientPostRequestDTO {
  factory _IncredientPostRequestDTO(
      {final String? name,
      final double? amount,
      final String? unit}) = _$_IncredientPostRequestDTO;
  _IncredientPostRequestDTO._() : super._();

  factory _IncredientPostRequestDTO.fromJson(Map<String, dynamic> json) =
      _$_IncredientPostRequestDTO.fromJson;

  @override
  String? get name;
  @override
  double? get amount;
  @override
  String? get unit;
  @override
  @JsonKey(ignore: true)
  _$$_IncredientPostRequestDTOCopyWith<_$_IncredientPostRequestDTO>
      get copyWith => throw _privateConstructorUsedError;
}
