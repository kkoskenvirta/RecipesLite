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
mixin _$CategoryRecipesState {
  CategoryRecipesStateStatus get status => throw _privateConstructorUsedError;
  List<RecipeModel> get recipeList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryRecipesStateCopyWith<CategoryRecipesState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryRecipesStateCopyWith<$Res> {
  factory $CategoryRecipesStateCopyWith(CategoryRecipesState value, $Res Function(CategoryRecipesState) then) =
      _$CategoryRecipesStateCopyWithImpl<$Res>;
  $Res call({CategoryRecipesStateStatus status, List<RecipeModel> recipeList});
}

/// @nodoc
class _$CategoryRecipesStateCopyWithImpl<$Res> implements $CategoryRecipesStateCopyWith<$Res> {
  _$CategoryRecipesStateCopyWithImpl(this._value, this._then);

  final CategoryRecipesState _value;
  // ignore: unused_field
  final $Res Function(CategoryRecipesState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? recipeList = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CategoryRecipesStateStatus,
      recipeList: recipeList == freezed
          ? _value.recipeList
          : recipeList // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_CategoryRecipesStateCopyWith<$Res> implements $CategoryRecipesStateCopyWith<$Res> {
  factory _$$_CategoryRecipesStateCopyWith(_$_CategoryRecipesState value, $Res Function(_$_CategoryRecipesState) then) =
      __$$_CategoryRecipesStateCopyWithImpl<$Res>;
  @override
  $Res call({CategoryRecipesStateStatus status, List<RecipeModel> recipeList});
}

/// @nodoc
class __$$_CategoryRecipesStateCopyWithImpl<$Res> extends _$CategoryRecipesStateCopyWithImpl<$Res>
    implements _$$_CategoryRecipesStateCopyWith<$Res> {
  __$$_CategoryRecipesStateCopyWithImpl(_$_CategoryRecipesState _value, $Res Function(_$_CategoryRecipesState) _then)
      : super(_value, (v) => _then(v as _$_CategoryRecipesState));

  @override
  _$_CategoryRecipesState get _value => super._value as _$_CategoryRecipesState;

  @override
  $Res call({
    Object? status = freezed,
    Object? recipeList = freezed,
  }) {
    return _then(_$_CategoryRecipesState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CategoryRecipesStateStatus,
      recipeList: recipeList == freezed
          ? _value._recipeList
          : recipeList // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>,
    ));
  }
}

/// @nodoc

class _$_CategoryRecipesState with DiagnosticableTreeMixin implements _CategoryRecipesState {
  const _$_CategoryRecipesState({required this.status, required final List<RecipeModel> recipeList})
      : _recipeList = recipeList;

  @override
  final CategoryRecipesStateStatus status;
  final List<RecipeModel> _recipeList;
  @override
  List<RecipeModel> get recipeList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipeList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryRecipesState(status: $status, recipeList: $recipeList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryRecipesState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('recipeList', recipeList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryRecipesState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._recipeList, _recipeList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(status), const DeepCollectionEquality().hash(_recipeList));

  @JsonKey(ignore: true)
  @override
  _$$_CategoryRecipesStateCopyWith<_$_CategoryRecipesState> get copyWith =>
      __$$_CategoryRecipesStateCopyWithImpl<_$_CategoryRecipesState>(this, _$identity);
}

abstract class _CategoryRecipesState implements CategoryRecipesState {
  const factory _CategoryRecipesState(
      {required final CategoryRecipesStateStatus status,
      required final List<RecipeModel> recipeList}) = _$_CategoryRecipesState;

  @override
  CategoryRecipesStateStatus get status;
  @override
  List<RecipeModel> get recipeList;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryRecipesStateCopyWith<_$_CategoryRecipesState> get copyWith => throw _privateConstructorUsedError;
}
