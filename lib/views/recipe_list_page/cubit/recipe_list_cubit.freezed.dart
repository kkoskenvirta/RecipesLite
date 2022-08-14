// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecipeListState {
  RecipeListStatus get listStatus => throw _privateConstructorUsedError;
  TagStatus get tagStatus => throw _privateConstructorUsedError;
  List<RecipeModel>? get recipeList => throw _privateConstructorUsedError;
  List<TagModel>? get tags => throw _privateConstructorUsedError;
  List<TagModel> get filters => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeListStateCopyWith<RecipeListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeListStateCopyWith<$Res> {
  factory $RecipeListStateCopyWith(
          RecipeListState value, $Res Function(RecipeListState) then) =
      _$RecipeListStateCopyWithImpl<$Res>;
  $Res call(
      {RecipeListStatus listStatus,
      TagStatus tagStatus,
      List<RecipeModel>? recipeList,
      List<TagModel>? tags,
      List<TagModel> filters});
}

/// @nodoc
class _$RecipeListStateCopyWithImpl<$Res>
    implements $RecipeListStateCopyWith<$Res> {
  _$RecipeListStateCopyWithImpl(this._value, this._then);

  final RecipeListState _value;
  // ignore: unused_field
  final $Res Function(RecipeListState) _then;

  @override
  $Res call({
    Object? listStatus = freezed,
    Object? tagStatus = freezed,
    Object? recipeList = freezed,
    Object? tags = freezed,
    Object? filters = freezed,
  }) {
    return _then(_value.copyWith(
      listStatus: listStatus == freezed
          ? _value.listStatus
          : listStatus // ignore: cast_nullable_to_non_nullable
              as RecipeListStatus,
      tagStatus: tagStatus == freezed
          ? _value.tagStatus
          : tagStatus // ignore: cast_nullable_to_non_nullable
              as TagStatus,
      recipeList: recipeList == freezed
          ? _value.recipeList
          : recipeList // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagModel>?,
      filters: filters == freezed
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<TagModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_RecipeListStateCopyWith<$Res>
    implements $RecipeListStateCopyWith<$Res> {
  factory _$$_RecipeListStateCopyWith(
          _$_RecipeListState value, $Res Function(_$_RecipeListState) then) =
      __$$_RecipeListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {RecipeListStatus listStatus,
      TagStatus tagStatus,
      List<RecipeModel>? recipeList,
      List<TagModel>? tags,
      List<TagModel> filters});
}

/// @nodoc
class __$$_RecipeListStateCopyWithImpl<$Res>
    extends _$RecipeListStateCopyWithImpl<$Res>
    implements _$$_RecipeListStateCopyWith<$Res> {
  __$$_RecipeListStateCopyWithImpl(
      _$_RecipeListState _value, $Res Function(_$_RecipeListState) _then)
      : super(_value, (v) => _then(v as _$_RecipeListState));

  @override
  _$_RecipeListState get _value => super._value as _$_RecipeListState;

  @override
  $Res call({
    Object? listStatus = freezed,
    Object? tagStatus = freezed,
    Object? recipeList = freezed,
    Object? tags = freezed,
    Object? filters = freezed,
  }) {
    return _then(_$_RecipeListState(
      listStatus: listStatus == freezed
          ? _value.listStatus
          : listStatus // ignore: cast_nullable_to_non_nullable
              as RecipeListStatus,
      tagStatus: tagStatus == freezed
          ? _value.tagStatus
          : tagStatus // ignore: cast_nullable_to_non_nullable
              as TagStatus,
      recipeList: recipeList == freezed
          ? _value._recipeList
          : recipeList // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>?,
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagModel>?,
      filters: filters == freezed
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<TagModel>,
    ));
  }
}

/// @nodoc

class _$_RecipeListState implements _RecipeListState {
  const _$_RecipeListState(
      {required this.listStatus,
      required this.tagStatus,
      required final List<RecipeModel>? recipeList,
      required final List<TagModel>? tags,
      required final List<TagModel> filters})
      : _recipeList = recipeList,
        _tags = tags,
        _filters = filters;

  @override
  final RecipeListStatus listStatus;
  @override
  final TagStatus tagStatus;
  final List<RecipeModel>? _recipeList;
  @override
  List<RecipeModel>? get recipeList {
    final value = _recipeList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TagModel>? _tags;
  @override
  List<TagModel>? get tags {
    final value = _tags;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TagModel> _filters;
  @override
  List<TagModel> get filters {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  @override
  String toString() {
    return 'RecipeListState(listStatus: $listStatus, tagStatus: $tagStatus, recipeList: $recipeList, tags: $tags, filters: $filters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeListState &&
            const DeepCollectionEquality()
                .equals(other.listStatus, listStatus) &&
            const DeepCollectionEquality().equals(other.tagStatus, tagStatus) &&
            const DeepCollectionEquality()
                .equals(other._recipeList, _recipeList) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(listStatus),
      const DeepCollectionEquality().hash(tagStatus),
      const DeepCollectionEquality().hash(_recipeList),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_filters));

  @JsonKey(ignore: true)
  @override
  _$$_RecipeListStateCopyWith<_$_RecipeListState> get copyWith =>
      __$$_RecipeListStateCopyWithImpl<_$_RecipeListState>(this, _$identity);
}

abstract class _RecipeListState implements RecipeListState {
  const factory _RecipeListState(
      {required final RecipeListStatus listStatus,
      required final TagStatus tagStatus,
      required final List<RecipeModel>? recipeList,
      required final List<TagModel>? tags,
      required final List<TagModel> filters}) = _$_RecipeListState;

  @override
  RecipeListStatus get listStatus;
  @override
  TagStatus get tagStatus;
  @override
  List<RecipeModel>? get recipeList;
  @override
  List<TagModel>? get tags;
  @override
  List<TagModel> get filters;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeListStateCopyWith<_$_RecipeListState> get copyWith =>
      throw _privateConstructorUsedError;
}
