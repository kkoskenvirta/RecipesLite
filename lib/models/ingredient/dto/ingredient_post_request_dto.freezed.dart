// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ingredient_post_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IngredientPostRequestDTO _$IngredientPostRequestDTOFromJson(
    Map<String, dynamic> json) {
  return _IngredientPostRequestDTO.fromJson(json);
}

/// @nodoc
mixin _$IngredientPostRequestDTO {
  String? get name => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientPostRequestDTOCopyWith<IngredientPostRequestDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientPostRequestDTOCopyWith<$Res> {
  factory $IngredientPostRequestDTOCopyWith(IngredientPostRequestDTO value,
          $Res Function(IngredientPostRequestDTO) then) =
      _$IngredientPostRequestDTOCopyWithImpl<$Res>;
  $Res call({String? name, double? amount, String? unit});
}

/// @nodoc
class _$IngredientPostRequestDTOCopyWithImpl<$Res>
    implements $IngredientPostRequestDTOCopyWith<$Res> {
  _$IngredientPostRequestDTOCopyWithImpl(this._value, this._then);

  final IngredientPostRequestDTO _value;
  // ignore: unused_field
  final $Res Function(IngredientPostRequestDTO) _then;

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
abstract class _$$_IngredientPostRequestDTOCopyWith<$Res>
    implements $IngredientPostRequestDTOCopyWith<$Res> {
  factory _$$_IngredientPostRequestDTOCopyWith(
          _$_IngredientPostRequestDTO value,
          $Res Function(_$_IngredientPostRequestDTO) then) =
      __$$_IngredientPostRequestDTOCopyWithImpl<$Res>;
  @override
  $Res call({String? name, double? amount, String? unit});
}

/// @nodoc
class __$$_IngredientPostRequestDTOCopyWithImpl<$Res>
    extends _$IngredientPostRequestDTOCopyWithImpl<$Res>
    implements _$$_IngredientPostRequestDTOCopyWith<$Res> {
  __$$_IngredientPostRequestDTOCopyWithImpl(_$_IngredientPostRequestDTO _value,
      $Res Function(_$_IngredientPostRequestDTO) _then)
      : super(_value, (v) => _then(v as _$_IngredientPostRequestDTO));

  @override
  _$_IngredientPostRequestDTO get _value =>
      super._value as _$_IngredientPostRequestDTO;

  @override
  $Res call({
    Object? name = freezed,
    Object? amount = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$_IngredientPostRequestDTO(
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
class _$_IngredientPostRequestDTO extends _IngredientPostRequestDTO {
  _$_IngredientPostRequestDTO({this.name, this.amount, this.unit}) : super._();

  factory _$_IngredientPostRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientPostRequestDTOFromJson(json);

  @override
  final String? name;
  @override
  final double? amount;
  @override
  final String? unit;

  @override
  String toString() {
    return 'IngredientPostRequestDTO(name: $name, amount: $amount, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IngredientPostRequestDTO &&
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
  _$$_IngredientPostRequestDTOCopyWith<_$_IngredientPostRequestDTO>
      get copyWith => __$$_IngredientPostRequestDTOCopyWithImpl<
          _$_IngredientPostRequestDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientPostRequestDTOToJson(
      this,
    );
  }
}

abstract class _IngredientPostRequestDTO extends IngredientPostRequestDTO {
  factory _IngredientPostRequestDTO(
      {final String? name,
      final double? amount,
      final String? unit}) = _$_IngredientPostRequestDTO;
  _IngredientPostRequestDTO._() : super._();

  factory _IngredientPostRequestDTO.fromJson(Map<String, dynamic> json) =
      _$_IngredientPostRequestDTO.fromJson;

  @override
  String? get name;
  @override
  double? get amount;
  @override
  String? get unit;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientPostRequestDTOCopyWith<_$_IngredientPostRequestDTO>
      get copyWith => throw _privateConstructorUsedError;
}
