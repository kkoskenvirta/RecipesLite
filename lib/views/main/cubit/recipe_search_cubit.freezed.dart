// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecipeSearchState {
  RecipeSearchStatus get status => throw _privateConstructorUsedError;
  List<RecipeModel>? get recipeList => throw _privateConstructorUsedError;
  String get searchString => throw _privateConstructorUsedError;
  String get filterApplied => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeSearchStateCopyWith<RecipeSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeSearchStateCopyWith<$Res> {
  factory $RecipeSearchStateCopyWith(
          RecipeSearchState value, $Res Function(RecipeSearchState) then) =
      _$RecipeSearchStateCopyWithImpl<$Res>;
  $Res call(
      {RecipeSearchStatus status,
      List<RecipeModel>? recipeList,
      String searchString,
      String filterApplied});
}

/// @nodoc
class _$RecipeSearchStateCopyWithImpl<$Res>
    implements $RecipeSearchStateCopyWith<$Res> {
  _$RecipeSearchStateCopyWithImpl(this._value, this._then);

  final RecipeSearchState _value;
  // ignore: unused_field
  final $Res Function(RecipeSearchState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? recipeList = freezed,
    Object? searchString = freezed,
    Object? filterApplied = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RecipeSearchStatus,
      recipeList: recipeList == freezed
          ? _value.recipeList
          : recipeList // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>?,
      searchString: searchString == freezed
          ? _value.searchString
          : searchString // ignore: cast_nullable_to_non_nullable
              as String,
      filterApplied: filterApplied == freezed
          ? _value.filterApplied
          : filterApplied // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RecipeSearchStateCopyWith<$Res>
    implements $RecipeSearchStateCopyWith<$Res> {
  factory _$$_RecipeSearchStateCopyWith(_$_RecipeSearchState value,
          $Res Function(_$_RecipeSearchState) then) =
      __$$_RecipeSearchStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {RecipeSearchStatus status,
      List<RecipeModel>? recipeList,
      String searchString,
      String filterApplied});
}

/// @nodoc
class __$$_RecipeSearchStateCopyWithImpl<$Res>
    extends _$RecipeSearchStateCopyWithImpl<$Res>
    implements _$$_RecipeSearchStateCopyWith<$Res> {
  __$$_RecipeSearchStateCopyWithImpl(
      _$_RecipeSearchState _value, $Res Function(_$_RecipeSearchState) _then)
      : super(_value, (v) => _then(v as _$_RecipeSearchState));

  @override
  _$_RecipeSearchState get _value => super._value as _$_RecipeSearchState;

  @override
  $Res call({
    Object? status = freezed,
    Object? recipeList = freezed,
    Object? searchString = freezed,
    Object? filterApplied = freezed,
  }) {
    return _then(_$_RecipeSearchState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RecipeSearchStatus,
      recipeList: recipeList == freezed
          ? _value._recipeList
          : recipeList // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>?,
      searchString: searchString == freezed
          ? _value.searchString
          : searchString // ignore: cast_nullable_to_non_nullable
              as String,
      filterApplied: filterApplied == freezed
          ? _value.filterApplied
          : filterApplied // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RecipeSearchState implements _RecipeSearchState {
  const _$_RecipeSearchState(
      {required this.status,
      required final List<RecipeModel>? recipeList,
      required this.searchString,
      required this.filterApplied})
      : _recipeList = recipeList;

  @override
  final RecipeSearchStatus status;
  final List<RecipeModel>? _recipeList;
  @override
  List<RecipeModel>? get recipeList {
    final value = _recipeList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String searchString;
  @override
  final String filterApplied;

  @override
  String toString() {
    return 'RecipeSearchState(status: $status, recipeList: $recipeList, searchString: $searchString, filterApplied: $filterApplied)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeSearchState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other._recipeList, _recipeList) &&
            const DeepCollectionEquality()
                .equals(other.searchString, searchString) &&
            const DeepCollectionEquality()
                .equals(other.filterApplied, filterApplied));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_recipeList),
      const DeepCollectionEquality().hash(searchString),
      const DeepCollectionEquality().hash(filterApplied));

  @JsonKey(ignore: true)
  @override
  _$$_RecipeSearchStateCopyWith<_$_RecipeSearchState> get copyWith =>
      __$$_RecipeSearchStateCopyWithImpl<_$_RecipeSearchState>(
          this, _$identity);
}

abstract class _RecipeSearchState implements RecipeSearchState {
  const factory _RecipeSearchState(
      {required final RecipeSearchStatus status,
      required final List<RecipeModel>? recipeList,
      required final String searchString,
      required final String filterApplied}) = _$_RecipeSearchState;

  @override
  RecipeSearchStatus get status;
  @override
  List<RecipeModel>? get recipeList;
  @override
  String get searchString;
  @override
  String get filterApplied;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeSearchStateCopyWith<_$_RecipeSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
