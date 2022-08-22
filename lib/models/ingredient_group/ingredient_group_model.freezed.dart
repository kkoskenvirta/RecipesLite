// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ingredient_group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IngredientGroupModel _$IngredientGroupModelFromJson(Map<String, dynamic> json) {
  return _IngredientGroupModel.fromJson(json);
}

/// @nodoc
mixin _$IngredientGroupModel {
  int? get relationId => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<IngredientModel>? get ingredients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientGroupModelCopyWith<IngredientGroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientGroupModelCopyWith<$Res> {
  factory $IngredientGroupModelCopyWith(IngredientGroupModel value,
          $Res Function(IngredientGroupModel) then) =
      _$IngredientGroupModelCopyWithImpl<$Res>;
  $Res call(
      {int? relationId,
      String? id,
      String? name,
      List<IngredientModel>? ingredients});
}

/// @nodoc
class _$IngredientGroupModelCopyWithImpl<$Res>
    implements $IngredientGroupModelCopyWith<$Res> {
  _$IngredientGroupModelCopyWithImpl(this._value, this._then);

  final IngredientGroupModel _value;
  // ignore: unused_field
  final $Res Function(IngredientGroupModel) _then;

  @override
  $Res call({
    Object? relationId = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? ingredients = freezed,
  }) {
    return _then(_value.copyWith(
      relationId: relationId == freezed
          ? _value.relationId
          : relationId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>?,
    ));
  }
}

/// @nodoc
abstract class _$$_IngredientGroupModelCopyWith<$Res>
    implements $IngredientGroupModelCopyWith<$Res> {
  factory _$$_IngredientGroupModelCopyWith(_$_IngredientGroupModel value,
          $Res Function(_$_IngredientGroupModel) then) =
      __$$_IngredientGroupModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? relationId,
      String? id,
      String? name,
      List<IngredientModel>? ingredients});
}

/// @nodoc
class __$$_IngredientGroupModelCopyWithImpl<$Res>
    extends _$IngredientGroupModelCopyWithImpl<$Res>
    implements _$$_IngredientGroupModelCopyWith<$Res> {
  __$$_IngredientGroupModelCopyWithImpl(_$_IngredientGroupModel _value,
      $Res Function(_$_IngredientGroupModel) _then)
      : super(_value, (v) => _then(v as _$_IngredientGroupModel));

  @override
  _$_IngredientGroupModel get _value => super._value as _$_IngredientGroupModel;

  @override
  $Res call({
    Object? relationId = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? ingredients = freezed,
  }) {
    return _then(_$_IngredientGroupModel(
      relationId: relationId == freezed
          ? _value.relationId
          : relationId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: ingredients == freezed
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IngredientGroupModel extends _IngredientGroupModel {
  _$_IngredientGroupModel(
      {this.relationId,
      this.id,
      this.name,
      final List<IngredientModel>? ingredients})
      : _ingredients = ingredients,
        super._();

  factory _$_IngredientGroupModel.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientGroupModelFromJson(json);

  @override
  final int? relationId;
  @override
  final String? id;
  @override
  final String? name;
  final List<IngredientModel>? _ingredients;
  @override
  List<IngredientModel>? get ingredients {
    final value = _ingredients;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'IngredientGroupModel(relationId: $relationId, id: $id, name: $name, ingredients: $ingredients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IngredientGroupModel &&
            const DeepCollectionEquality()
                .equals(other.relationId, relationId) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(relationId),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_ingredients));

  @JsonKey(ignore: true)
  @override
  _$$_IngredientGroupModelCopyWith<_$_IngredientGroupModel> get copyWith =>
      __$$_IngredientGroupModelCopyWithImpl<_$_IngredientGroupModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientGroupModelToJson(
      this,
    );
  }
}

abstract class _IngredientGroupModel extends IngredientGroupModel {
  factory _IngredientGroupModel(
      {final int? relationId,
      final String? id,
      final String? name,
      final List<IngredientModel>? ingredients}) = _$_IngredientGroupModel;
  _IngredientGroupModel._() : super._();

  factory _IngredientGroupModel.fromJson(Map<String, dynamic> json) =
      _$_IngredientGroupModel.fromJson;

  @override
  int? get relationId;
  @override
  String? get id;
  @override
  String? get name;
  @override
  List<IngredientModel>? get ingredients;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientGroupModelCopyWith<_$_IngredientGroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}
