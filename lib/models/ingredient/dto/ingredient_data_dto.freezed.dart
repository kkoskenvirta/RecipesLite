// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ingredient_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IngredientDataDTO _$IngredientDataDTOFromJson(Map<String, dynamic> json) {
  return _IngredientDataDTO.fromJson(json);
}

/// @nodoc
mixin _$IngredientDataDTO {
  @JsonKey(name: 'ingredient_id')
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String? get sort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientDataDTOCopyWith<IngredientDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientDataDTOCopyWith<$Res> {
  factory $IngredientDataDTOCopyWith(
          IngredientDataDTO value, $Res Function(IngredientDataDTO) then) =
      _$IngredientDataDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ingredient_id') String? id,
      String name,
      double? amount,
      String unit,
      String? sort});
}

/// @nodoc
class _$IngredientDataDTOCopyWithImpl<$Res>
    implements $IngredientDataDTOCopyWith<$Res> {
  _$IngredientDataDTOCopyWithImpl(this._value, this._then);

  final IngredientDataDTO _value;
  // ignore: unused_field
  final $Res Function(IngredientDataDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? unit = freezed,
    Object? sort = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_IngredientDataDTOCopyWith<$Res>
    implements $IngredientDataDTOCopyWith<$Res> {
  factory _$$_IngredientDataDTOCopyWith(_$_IngredientDataDTO value,
          $Res Function(_$_IngredientDataDTO) then) =
      __$$_IngredientDataDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ingredient_id') String? id,
      String name,
      double? amount,
      String unit,
      String? sort});
}

/// @nodoc
class __$$_IngredientDataDTOCopyWithImpl<$Res>
    extends _$IngredientDataDTOCopyWithImpl<$Res>
    implements _$$_IngredientDataDTOCopyWith<$Res> {
  __$$_IngredientDataDTOCopyWithImpl(
      _$_IngredientDataDTO _value, $Res Function(_$_IngredientDataDTO) _then)
      : super(_value, (v) => _then(v as _$_IngredientDataDTO));

  @override
  _$_IngredientDataDTO get _value => super._value as _$_IngredientDataDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? unit = freezed,
    Object? sort = freezed,
  }) {
    return _then(_$_IngredientDataDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IngredientDataDTO extends _IngredientDataDTO {
  _$_IngredientDataDTO(
      {@JsonKey(name: 'ingredient_id') this.id,
      this.name = '',
      this.amount,
      this.unit = 'gram',
      this.sort})
      : super._();

  factory _$_IngredientDataDTO.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientDataDTOFromJson(json);

  @override
  @JsonKey(name: 'ingredient_id')
  final String? id;
  @override
  @JsonKey()
  final String name;
  @override
  final double? amount;
  @override
  @JsonKey()
  final String unit;
  @override
  final String? sort;

  @override
  String toString() {
    return 'IngredientDataDTO(id: $id, name: $name, amount: $amount, unit: $unit, sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IngredientDataDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.unit, unit) &&
            const DeepCollectionEquality().equals(other.sort, sort));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(unit),
      const DeepCollectionEquality().hash(sort));

  @JsonKey(ignore: true)
  @override
  _$$_IngredientDataDTOCopyWith<_$_IngredientDataDTO> get copyWith =>
      __$$_IngredientDataDTOCopyWithImpl<_$_IngredientDataDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientDataDTOToJson(
      this,
    );
  }
}

abstract class _IngredientDataDTO extends IngredientDataDTO {
  factory _IngredientDataDTO(
      {@JsonKey(name: 'ingredient_id') final String? id,
      final String name,
      final double? amount,
      final String unit,
      final String? sort}) = _$_IngredientDataDTO;
  _IngredientDataDTO._() : super._();

  factory _IngredientDataDTO.fromJson(Map<String, dynamic> json) =
      _$_IngredientDataDTO.fromJson;

  @override
  @JsonKey(name: 'ingredient_id')
  String? get id;
  @override
  String get name;
  @override
  double? get amount;
  @override
  String get unit;
  @override
  String? get sort;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientDataDTOCopyWith<_$_IngredientDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
