// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'single_recipe_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SingleRecipeState {
  SingleRecipeStateStatus get status => throw _privateConstructorUsedError;
  int? get favoriteCount => throw _privateConstructorUsedError;
  RecipeModel? get recipe => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SingleRecipeStateCopyWith<SingleRecipeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleRecipeStateCopyWith<$Res> {
  factory $SingleRecipeStateCopyWith(
          SingleRecipeState value, $Res Function(SingleRecipeState) then) =
      _$SingleRecipeStateCopyWithImpl<$Res>;
  $Res call(
      {SingleRecipeStateStatus status,
      int? favoriteCount,
      RecipeModel? recipe});

  $RecipeModelCopyWith<$Res>? get recipe;
}

/// @nodoc
class _$SingleRecipeStateCopyWithImpl<$Res>
    implements $SingleRecipeStateCopyWith<$Res> {
  _$SingleRecipeStateCopyWithImpl(this._value, this._then);

  final SingleRecipeState _value;
  // ignore: unused_field
  final $Res Function(SingleRecipeState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? favoriteCount = freezed,
    Object? recipe = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SingleRecipeStateStatus,
      favoriteCount: favoriteCount == freezed
          ? _value.favoriteCount
          : favoriteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      recipe: recipe == freezed
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as RecipeModel?,
    ));
  }

  @override
  $RecipeModelCopyWith<$Res>? get recipe {
    if (_value.recipe == null) {
      return null;
    }

    return $RecipeModelCopyWith<$Res>(_value.recipe!, (value) {
      return _then(_value.copyWith(recipe: value));
    });
  }
}

/// @nodoc
abstract class _$$_SingleRecipeStateCopyWith<$Res>
    implements $SingleRecipeStateCopyWith<$Res> {
  factory _$$_SingleRecipeStateCopyWith(_$_SingleRecipeState value,
          $Res Function(_$_SingleRecipeState) then) =
      __$$_SingleRecipeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {SingleRecipeStateStatus status,
      int? favoriteCount,
      RecipeModel? recipe});

  @override
  $RecipeModelCopyWith<$Res>? get recipe;
}

/// @nodoc
class __$$_SingleRecipeStateCopyWithImpl<$Res>
    extends _$SingleRecipeStateCopyWithImpl<$Res>
    implements _$$_SingleRecipeStateCopyWith<$Res> {
  __$$_SingleRecipeStateCopyWithImpl(
      _$_SingleRecipeState _value, $Res Function(_$_SingleRecipeState) _then)
      : super(_value, (v) => _then(v as _$_SingleRecipeState));

  @override
  _$_SingleRecipeState get _value => super._value as _$_SingleRecipeState;

  @override
  $Res call({
    Object? status = freezed,
    Object? favoriteCount = freezed,
    Object? recipe = freezed,
  }) {
    return _then(_$_SingleRecipeState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SingleRecipeStateStatus,
      favoriteCount: favoriteCount == freezed
          ? _value.favoriteCount
          : favoriteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      recipe: recipe == freezed
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as RecipeModel?,
    ));
  }
}

/// @nodoc

class _$_SingleRecipeState implements _SingleRecipeState {
  const _$_SingleRecipeState(
      {required this.status,
      required this.favoriteCount,
      required this.recipe});

  @override
  final SingleRecipeStateStatus status;
  @override
  final int? favoriteCount;
  @override
  final RecipeModel? recipe;

  @override
  String toString() {
    return 'SingleRecipeState(status: $status, favoriteCount: $favoriteCount, recipe: $recipe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SingleRecipeState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.favoriteCount, favoriteCount) &&
            const DeepCollectionEquality().equals(other.recipe, recipe));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(favoriteCount),
      const DeepCollectionEquality().hash(recipe));

  @JsonKey(ignore: true)
  @override
  _$$_SingleRecipeStateCopyWith<_$_SingleRecipeState> get copyWith =>
      __$$_SingleRecipeStateCopyWithImpl<_$_SingleRecipeState>(
          this, _$identity);
}

abstract class _SingleRecipeState implements SingleRecipeState {
  const factory _SingleRecipeState(
      {required final SingleRecipeStateStatus status,
      required final int? favoriteCount,
      required final RecipeModel? recipe}) = _$_SingleRecipeState;

  @override
  SingleRecipeStateStatus get status;
  @override
  int? get favoriteCount;
  @override
  RecipeModel? get recipe;
  @override
  @JsonKey(ignore: true)
  _$$_SingleRecipeStateCopyWith<_$_SingleRecipeState> get copyWith =>
      throw _privateConstructorUsedError;
}
