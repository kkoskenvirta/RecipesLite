// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ingredient_group_id_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IngredientGroupIdDTO _$IngredientGroupIdDTOFromJson(Map<String, dynamic> json) {
  return _IngredientGroupIdDTO.fromJson(json);
}

/// @nodoc
mixin _$IngredientGroupIdDTO {
  @JsonKey(name: "id")
  int get relationId => throw _privateConstructorUsedError;
  @JsonKey(name: "ingredient_group_id")
  IngredientGroupDataDTO get ingredientGroup =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientGroupIdDTOCopyWith<IngredientGroupIdDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientGroupIdDTOCopyWith<$Res> {
  factory $IngredientGroupIdDTOCopyWith(IngredientGroupIdDTO value,
          $Res Function(IngredientGroupIdDTO) then) =
      _$IngredientGroupIdDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id")
          int relationId,
      @JsonKey(name: "ingredient_group_id")
          IngredientGroupDataDTO ingredientGroup});

  $IngredientGroupDataDTOCopyWith<$Res> get ingredientGroup;
}

/// @nodoc
class _$IngredientGroupIdDTOCopyWithImpl<$Res>
    implements $IngredientGroupIdDTOCopyWith<$Res> {
  _$IngredientGroupIdDTOCopyWithImpl(this._value, this._then);

  final IngredientGroupIdDTO _value;
  // ignore: unused_field
  final $Res Function(IngredientGroupIdDTO) _then;

  @override
  $Res call({
    Object? relationId = freezed,
    Object? ingredientGroup = freezed,
  }) {
    return _then(_value.copyWith(
      relationId: relationId == freezed
          ? _value.relationId
          : relationId // ignore: cast_nullable_to_non_nullable
              as int,
      ingredientGroup: ingredientGroup == freezed
          ? _value.ingredientGroup
          : ingredientGroup // ignore: cast_nullable_to_non_nullable
              as IngredientGroupDataDTO,
    ));
  }

  @override
  $IngredientGroupDataDTOCopyWith<$Res> get ingredientGroup {
    return $IngredientGroupDataDTOCopyWith<$Res>(_value.ingredientGroup,
        (value) {
      return _then(_value.copyWith(ingredientGroup: value));
    });
  }
}

/// @nodoc
abstract class _$$_IngredientGroupIdDTOCopyWith<$Res>
    implements $IngredientGroupIdDTOCopyWith<$Res> {
  factory _$$_IngredientGroupIdDTOCopyWith(_$_IngredientGroupIdDTO value,
          $Res Function(_$_IngredientGroupIdDTO) then) =
      __$$_IngredientGroupIdDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id")
          int relationId,
      @JsonKey(name: "ingredient_group_id")
          IngredientGroupDataDTO ingredientGroup});

  @override
  $IngredientGroupDataDTOCopyWith<$Res> get ingredientGroup;
}

/// @nodoc
class __$$_IngredientGroupIdDTOCopyWithImpl<$Res>
    extends _$IngredientGroupIdDTOCopyWithImpl<$Res>
    implements _$$_IngredientGroupIdDTOCopyWith<$Res> {
  __$$_IngredientGroupIdDTOCopyWithImpl(_$_IngredientGroupIdDTO _value,
      $Res Function(_$_IngredientGroupIdDTO) _then)
      : super(_value, (v) => _then(v as _$_IngredientGroupIdDTO));

  @override
  _$_IngredientGroupIdDTO get _value => super._value as _$_IngredientGroupIdDTO;

  @override
  $Res call({
    Object? relationId = freezed,
    Object? ingredientGroup = freezed,
  }) {
    return _then(_$_IngredientGroupIdDTO(
      relationId: relationId == freezed
          ? _value.relationId
          : relationId // ignore: cast_nullable_to_non_nullable
              as int,
      ingredientGroup: ingredientGroup == freezed
          ? _value.ingredientGroup
          : ingredientGroup // ignore: cast_nullable_to_non_nullable
              as IngredientGroupDataDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IngredientGroupIdDTO extends _IngredientGroupIdDTO {
  _$_IngredientGroupIdDTO(
      {@JsonKey(name: "id") required this.relationId,
      @JsonKey(name: "ingredient_group_id") required this.ingredientGroup})
      : super._();

  factory _$_IngredientGroupIdDTO.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientGroupIdDTOFromJson(json);

  @override
  @JsonKey(name: "id")
  final int relationId;
  @override
  @JsonKey(name: "ingredient_group_id")
  final IngredientGroupDataDTO ingredientGroup;

  @override
  String toString() {
    return 'IngredientGroupIdDTO(relationId: $relationId, ingredientGroup: $ingredientGroup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IngredientGroupIdDTO &&
            const DeepCollectionEquality()
                .equals(other.relationId, relationId) &&
            const DeepCollectionEquality()
                .equals(other.ingredientGroup, ingredientGroup));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(relationId),
      const DeepCollectionEquality().hash(ingredientGroup));

  @JsonKey(ignore: true)
  @override
  _$$_IngredientGroupIdDTOCopyWith<_$_IngredientGroupIdDTO> get copyWith =>
      __$$_IngredientGroupIdDTOCopyWithImpl<_$_IngredientGroupIdDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientGroupIdDTOToJson(
      this,
    );
  }
}

abstract class _IngredientGroupIdDTO extends IngredientGroupIdDTO {
  factory _IngredientGroupIdDTO(
          {@JsonKey(name: "id")
              required final int relationId,
          @JsonKey(name: "ingredient_group_id")
              required final IngredientGroupDataDTO ingredientGroup}) =
      _$_IngredientGroupIdDTO;
  _IngredientGroupIdDTO._() : super._();

  factory _IngredientGroupIdDTO.fromJson(Map<String, dynamic> json) =
      _$_IngredientGroupIdDTO.fromJson;

  @override
  @JsonKey(name: "id")
  int get relationId;
  @override
  @JsonKey(name: "ingredient_group_id")
  IngredientGroupDataDTO get ingredientGroup;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientGroupIdDTOCopyWith<_$_IngredientGroupIdDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
