// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ingredient_id_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IngredientIdDTO _$IngredientIdDTOFromJson(Map<String, dynamic> json) {
  return _IngredientIdDTO.fromJson(json);
}

/// @nodoc
mixin _$IngredientIdDTO {
  @JsonKey(name: "id")
  int? get relationId => throw _privateConstructorUsedError;
  @JsonKey(name: "ingredient_id")
  IngredientDataDTO get ingredient => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientIdDTOCopyWith<IngredientIdDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientIdDTOCopyWith<$Res> {
  factory $IngredientIdDTOCopyWith(
          IngredientIdDTO value, $Res Function(IngredientIdDTO) then) =
      _$IngredientIdDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") int? relationId,
      @JsonKey(name: "ingredient_id") IngredientDataDTO ingredient});

  $IngredientDataDTOCopyWith<$Res> get ingredient;
}

/// @nodoc
class _$IngredientIdDTOCopyWithImpl<$Res>
    implements $IngredientIdDTOCopyWith<$Res> {
  _$IngredientIdDTOCopyWithImpl(this._value, this._then);

  final IngredientIdDTO _value;
  // ignore: unused_field
  final $Res Function(IngredientIdDTO) _then;

  @override
  $Res call({
    Object? relationId = freezed,
    Object? ingredient = freezed,
  }) {
    return _then(_value.copyWith(
      relationId: relationId == freezed
          ? _value.relationId
          : relationId // ignore: cast_nullable_to_non_nullable
              as int?,
      ingredient: ingredient == freezed
          ? _value.ingredient
          : ingredient // ignore: cast_nullable_to_non_nullable
              as IngredientDataDTO,
    ));
  }

  @override
  $IngredientDataDTOCopyWith<$Res> get ingredient {
    return $IngredientDataDTOCopyWith<$Res>(_value.ingredient, (value) {
      return _then(_value.copyWith(ingredient: value));
    });
  }
}

/// @nodoc
abstract class _$$_IngredientIdDTOCopyWith<$Res>
    implements $IngredientIdDTOCopyWith<$Res> {
  factory _$$_IngredientIdDTOCopyWith(
          _$_IngredientIdDTO value, $Res Function(_$_IngredientIdDTO) then) =
      __$$_IngredientIdDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") int? relationId,
      @JsonKey(name: "ingredient_id") IngredientDataDTO ingredient});

  @override
  $IngredientDataDTOCopyWith<$Res> get ingredient;
}

/// @nodoc
class __$$_IngredientIdDTOCopyWithImpl<$Res>
    extends _$IngredientIdDTOCopyWithImpl<$Res>
    implements _$$_IngredientIdDTOCopyWith<$Res> {
  __$$_IngredientIdDTOCopyWithImpl(
      _$_IngredientIdDTO _value, $Res Function(_$_IngredientIdDTO) _then)
      : super(_value, (v) => _then(v as _$_IngredientIdDTO));

  @override
  _$_IngredientIdDTO get _value => super._value as _$_IngredientIdDTO;

  @override
  $Res call({
    Object? relationId = freezed,
    Object? ingredient = freezed,
  }) {
    return _then(_$_IngredientIdDTO(
      relationId: relationId == freezed
          ? _value.relationId
          : relationId // ignore: cast_nullable_to_non_nullable
              as int?,
      ingredient: ingredient == freezed
          ? _value.ingredient
          : ingredient // ignore: cast_nullable_to_non_nullable
              as IngredientDataDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IngredientIdDTO extends _IngredientIdDTO {
  _$_IngredientIdDTO(
      {@JsonKey(name: "id") this.relationId,
      @JsonKey(name: "ingredient_id") required this.ingredient})
      : super._();

  factory _$_IngredientIdDTO.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientIdDTOFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? relationId;
  @override
  @JsonKey(name: "ingredient_id")
  final IngredientDataDTO ingredient;

  @override
  String toString() {
    return 'IngredientIdDTO(relationId: $relationId, ingredient: $ingredient)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IngredientIdDTO &&
            const DeepCollectionEquality()
                .equals(other.relationId, relationId) &&
            const DeepCollectionEquality()
                .equals(other.ingredient, ingredient));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(relationId),
      const DeepCollectionEquality().hash(ingredient));

  @JsonKey(ignore: true)
  @override
  _$$_IngredientIdDTOCopyWith<_$_IngredientIdDTO> get copyWith =>
      __$$_IngredientIdDTOCopyWithImpl<_$_IngredientIdDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientIdDTOToJson(
      this,
    );
  }
}

abstract class _IngredientIdDTO extends IngredientIdDTO {
  factory _IngredientIdDTO(
      {@JsonKey(name: "id")
          final int? relationId,
      @JsonKey(name: "ingredient_id")
          required final IngredientDataDTO ingredient}) = _$_IngredientIdDTO;
  _IngredientIdDTO._() : super._();

  factory _IngredientIdDTO.fromJson(Map<String, dynamic> json) =
      _$_IngredientIdDTO.fromJson;

  @override
  @JsonKey(name: "id")
  int? get relationId;
  @override
  @JsonKey(name: "ingredient_id")
  IngredientDataDTO get ingredient;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientIdDTOCopyWith<_$_IngredientIdDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
