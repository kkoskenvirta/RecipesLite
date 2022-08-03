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

ingredientPostRequestDTO _$ingredientPostRequestDTOFromJson(
    Map<String, dynamic> json) {
  return _ingredientPostRequestDTO.fromJson(json);
}

/// @nodoc
mixin _$ingredientPostRequestDTO {
  String? get name => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ingredientPostRequestDTOCopyWith<ingredientPostRequestDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ingredientPostRequestDTOCopyWith<$Res> {
  factory $ingredientPostRequestDTOCopyWith(ingredientPostRequestDTO value,
          $Res Function(ingredientPostRequestDTO) then) =
      _$ingredientPostRequestDTOCopyWithImpl<$Res>;
  $Res call({String? name, double? amount, String? unit});
}

/// @nodoc
class _$ingredientPostRequestDTOCopyWithImpl<$Res>
    implements $ingredientPostRequestDTOCopyWith<$Res> {
  _$ingredientPostRequestDTOCopyWithImpl(this._value, this._then);

  final ingredientPostRequestDTO _value;
  // ignore: unused_field
  final $Res Function(ingredientPostRequestDTO) _then;

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
abstract class _$$_ingredientPostRequestDTOCopyWith<$Res>
    implements $ingredientPostRequestDTOCopyWith<$Res> {
  factory _$$_ingredientPostRequestDTOCopyWith(
          _$_ingredientPostRequestDTO value,
          $Res Function(_$_ingredientPostRequestDTO) then) =
      __$$_ingredientPostRequestDTOCopyWithImpl<$Res>;
  @override
  $Res call({String? name, double? amount, String? unit});
}

/// @nodoc
class __$$_ingredientPostRequestDTOCopyWithImpl<$Res>
    extends _$ingredientPostRequestDTOCopyWithImpl<$Res>
    implements _$$_ingredientPostRequestDTOCopyWith<$Res> {
  __$$_ingredientPostRequestDTOCopyWithImpl(_$_ingredientPostRequestDTO _value,
      $Res Function(_$_ingredientPostRequestDTO) _then)
      : super(_value, (v) => _then(v as _$_ingredientPostRequestDTO));

  @override
  _$_ingredientPostRequestDTO get _value =>
      super._value as _$_ingredientPostRequestDTO;

  @override
  $Res call({
    Object? name = freezed,
    Object? amount = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$_ingredientPostRequestDTO(
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
class _$_ingredientPostRequestDTO extends _ingredientPostRequestDTO {
  _$_ingredientPostRequestDTO({this.name, this.amount, this.unit}) : super._();

  factory _$_ingredientPostRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ingredientPostRequestDTOFromJson(json);

  @override
  final String? name;
  @override
  final double? amount;
  @override
  final String? unit;

  @override
  String toString() {
    return 'ingredientPostRequestDTO(name: $name, amount: $amount, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ingredientPostRequestDTO &&
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
  _$$_ingredientPostRequestDTOCopyWith<_$_ingredientPostRequestDTO>
      get copyWith => __$$_ingredientPostRequestDTOCopyWithImpl<
          _$_ingredientPostRequestDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ingredientPostRequestDTOToJson(
      this,
    );
  }
}

abstract class _ingredientPostRequestDTO extends ingredientPostRequestDTO {
  factory _ingredientPostRequestDTO(
      {final String? name,
      final double? amount,
      final String? unit}) = _$_ingredientPostRequestDTO;
  _ingredientPostRequestDTO._() : super._();

  factory _ingredientPostRequestDTO.fromJson(Map<String, dynamic> json) =
      _$_ingredientPostRequestDTO.fromJson;

  @override
  String? get name;
  @override
  double? get amount;
  @override
  String? get unit;
  @override
  @JsonKey(ignore: true)
  _$$_ingredientPostRequestDTOCopyWith<_$_ingredientPostRequestDTO>
      get copyWith => throw _privateConstructorUsedError;
}
