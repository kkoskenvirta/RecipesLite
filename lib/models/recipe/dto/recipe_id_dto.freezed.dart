// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_id_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeIdDTO _$RecipeIdDTOFromJson(Map<String, dynamic> json) {
  return _RecipeIdDTO.fromJson(json);
}

/// @nodoc
mixin _$RecipeIdDTO {
  @JsonKey(name: "recipe_id")
  RecipeDataDTO get recipe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeIdDTOCopyWith<RecipeIdDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeIdDTOCopyWith<$Res> {
  factory $RecipeIdDTOCopyWith(
          RecipeIdDTO value, $Res Function(RecipeIdDTO) then) =
      _$RecipeIdDTOCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: "recipe_id") RecipeDataDTO recipe});

  $RecipeDataDTOCopyWith<$Res> get recipe;
}

/// @nodoc
class _$RecipeIdDTOCopyWithImpl<$Res> implements $RecipeIdDTOCopyWith<$Res> {
  _$RecipeIdDTOCopyWithImpl(this._value, this._then);

  final RecipeIdDTO _value;
  // ignore: unused_field
  final $Res Function(RecipeIdDTO) _then;

  @override
  $Res call({
    Object? recipe = freezed,
  }) {
    return _then(_value.copyWith(
      recipe: recipe == freezed
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as RecipeDataDTO,
    ));
  }

  @override
  $RecipeDataDTOCopyWith<$Res> get recipe {
    return $RecipeDataDTOCopyWith<$Res>(_value.recipe, (value) {
      return _then(_value.copyWith(recipe: value));
    });
  }
}

/// @nodoc
abstract class _$$_RecipeIdDTOCopyWith<$Res>
    implements $RecipeIdDTOCopyWith<$Res> {
  factory _$$_RecipeIdDTOCopyWith(
          _$_RecipeIdDTO value, $Res Function(_$_RecipeIdDTO) then) =
      __$$_RecipeIdDTOCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: "recipe_id") RecipeDataDTO recipe});

  @override
  $RecipeDataDTOCopyWith<$Res> get recipe;
}

/// @nodoc
class __$$_RecipeIdDTOCopyWithImpl<$Res> extends _$RecipeIdDTOCopyWithImpl<$Res>
    implements _$$_RecipeIdDTOCopyWith<$Res> {
  __$$_RecipeIdDTOCopyWithImpl(
      _$_RecipeIdDTO _value, $Res Function(_$_RecipeIdDTO) _then)
      : super(_value, (v) => _then(v as _$_RecipeIdDTO));

  @override
  _$_RecipeIdDTO get _value => super._value as _$_RecipeIdDTO;

  @override
  $Res call({
    Object? recipe = freezed,
  }) {
    return _then(_$_RecipeIdDTO(
      recipe: recipe == freezed
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as RecipeDataDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeIdDTO extends _RecipeIdDTO {
  _$_RecipeIdDTO({@JsonKey(name: "recipe_id") required this.recipe})
      : super._();

  factory _$_RecipeIdDTO.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeIdDTOFromJson(json);

  @override
  @JsonKey(name: "recipe_id")
  final RecipeDataDTO recipe;

  @override
  String toString() {
    return 'RecipeIdDTO(recipe: $recipe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeIdDTO &&
            const DeepCollectionEquality().equals(other.recipe, recipe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(recipe));

  @JsonKey(ignore: true)
  @override
  _$$_RecipeIdDTOCopyWith<_$_RecipeIdDTO> get copyWith =>
      __$$_RecipeIdDTOCopyWithImpl<_$_RecipeIdDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeIdDTOToJson(
      this,
    );
  }
}

abstract class _RecipeIdDTO extends RecipeIdDTO {
  factory _RecipeIdDTO(
          {@JsonKey(name: "recipe_id") required final RecipeDataDTO recipe}) =
      _$_RecipeIdDTO;
  _RecipeIdDTO._() : super._();

  factory _RecipeIdDTO.fromJson(Map<String, dynamic> json) =
      _$_RecipeIdDTO.fromJson;

  @override
  @JsonKey(name: "recipe_id")
  RecipeDataDTO get recipe;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeIdDTOCopyWith<_$_RecipeIdDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
