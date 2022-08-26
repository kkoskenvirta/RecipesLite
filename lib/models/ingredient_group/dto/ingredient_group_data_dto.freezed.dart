// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ingredient_group_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IngredientGroupDataDTO _$IngredientGroupDataDTOFromJson(
    Map<String, dynamic> json) {
  return _IngredientGroupDataDTO.fromJson(json);
}

/// @nodoc
mixin _$IngredientGroupDataDTO {
  String? get id => throw _privateConstructorUsedError;
  List<IngredientIdDTO>? get ingredients => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get sort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientGroupDataDTOCopyWith<IngredientGroupDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientGroupDataDTOCopyWith<$Res> {
  factory $IngredientGroupDataDTOCopyWith(IngredientGroupDataDTO value,
          $Res Function(IngredientGroupDataDTO) then) =
      _$IngredientGroupDataDTOCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      List<IngredientIdDTO>? ingredients,
      String name,
      String? sort});
}

/// @nodoc
class _$IngredientGroupDataDTOCopyWithImpl<$Res>
    implements $IngredientGroupDataDTOCopyWith<$Res> {
  _$IngredientGroupDataDTOCopyWithImpl(this._value, this._then);

  final IngredientGroupDataDTO _value;
  // ignore: unused_field
  final $Res Function(IngredientGroupDataDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? ingredients = freezed,
    Object? name = freezed,
    Object? sort = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientIdDTO>?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_IngredientGroupDataDTOCopyWith<$Res>
    implements $IngredientGroupDataDTOCopyWith<$Res> {
  factory _$$_IngredientGroupDataDTOCopyWith(_$_IngredientGroupDataDTO value,
          $Res Function(_$_IngredientGroupDataDTO) then) =
      __$$_IngredientGroupDataDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      List<IngredientIdDTO>? ingredients,
      String name,
      String? sort});
}

/// @nodoc
class __$$_IngredientGroupDataDTOCopyWithImpl<$Res>
    extends _$IngredientGroupDataDTOCopyWithImpl<$Res>
    implements _$$_IngredientGroupDataDTOCopyWith<$Res> {
  __$$_IngredientGroupDataDTOCopyWithImpl(_$_IngredientGroupDataDTO _value,
      $Res Function(_$_IngredientGroupDataDTO) _then)
      : super(_value, (v) => _then(v as _$_IngredientGroupDataDTO));

  @override
  _$_IngredientGroupDataDTO get _value =>
      super._value as _$_IngredientGroupDataDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? ingredients = freezed,
    Object? name = freezed,
    Object? sort = freezed,
  }) {
    return _then(_$_IngredientGroupDataDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: ingredients == freezed
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientIdDTO>?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
class _$_IngredientGroupDataDTO extends _IngredientGroupDataDTO {
  _$_IngredientGroupDataDTO(
      {this.id,
      final List<IngredientIdDTO>? ingredients,
      this.name = '',
      this.sort})
      : _ingredients = ingredients,
        super._();

  factory _$_IngredientGroupDataDTO.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientGroupDataDTOFromJson(json);

  @override
  final String? id;
  final List<IngredientIdDTO>? _ingredients;
  @override
  List<IngredientIdDTO>? get ingredients {
    final value = _ingredients;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String name;
  @override
  final String? sort;

  @override
  String toString() {
    return 'IngredientGroupDataDTO(id: $id, ingredients: $ingredients, name: $name, sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IngredientGroupDataDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.sort, sort));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(_ingredients),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(sort));

  @JsonKey(ignore: true)
  @override
  _$$_IngredientGroupDataDTOCopyWith<_$_IngredientGroupDataDTO> get copyWith =>
      __$$_IngredientGroupDataDTOCopyWithImpl<_$_IngredientGroupDataDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientGroupDataDTOToJson(
      this,
    );
  }
}

abstract class _IngredientGroupDataDTO extends IngredientGroupDataDTO {
  factory _IngredientGroupDataDTO(
      {final String? id,
      final List<IngredientIdDTO>? ingredients,
      final String name,
      final String? sort}) = _$_IngredientGroupDataDTO;
  _IngredientGroupDataDTO._() : super._();

  factory _IngredientGroupDataDTO.fromJson(Map<String, dynamic> json) =
      _$_IngredientGroupDataDTO.fromJson;

  @override
  String? get id;
  @override
  List<IngredientIdDTO>? get ingredients;
  @override
  String get name;
  @override
  String? get sort;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientGroupDataDTOCopyWith<_$_IngredientGroupDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
