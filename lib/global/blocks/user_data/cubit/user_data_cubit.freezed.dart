// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_data_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserDataState {
  UserDataStateStatus get status => throw _privateConstructorUsedError;
  UserDataStateStatus get favoriteQuery => throw _privateConstructorUsedError;
  UserDataStateStatus get recipeQuery => throw _privateConstructorUsedError;
  UserModel? get currUser => throw _privateConstructorUsedError;
  List<RecipeModel> get favorites => throw _privateConstructorUsedError;
  List<RecipeModel> get recipes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDataStateCopyWith<UserDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataStateCopyWith<$Res> {
  factory $UserDataStateCopyWith(
          UserDataState value, $Res Function(UserDataState) then) =
      _$UserDataStateCopyWithImpl<$Res>;
  $Res call(
      {UserDataStateStatus status,
      UserDataStateStatus favoriteQuery,
      UserDataStateStatus recipeQuery,
      UserModel? currUser,
      List<RecipeModel> favorites,
      List<RecipeModel> recipes});

  $UserModelCopyWith<$Res>? get currUser;
}

/// @nodoc
class _$UserDataStateCopyWithImpl<$Res>
    implements $UserDataStateCopyWith<$Res> {
  _$UserDataStateCopyWithImpl(this._value, this._then);

  final UserDataState _value;
  // ignore: unused_field
  final $Res Function(UserDataState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? favoriteQuery = freezed,
    Object? recipeQuery = freezed,
    Object? currUser = freezed,
    Object? favorites = freezed,
    Object? recipes = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserDataStateStatus,
      favoriteQuery: favoriteQuery == freezed
          ? _value.favoriteQuery
          : favoriteQuery // ignore: cast_nullable_to_non_nullable
              as UserDataStateStatus,
      recipeQuery: recipeQuery == freezed
          ? _value.recipeQuery
          : recipeQuery // ignore: cast_nullable_to_non_nullable
              as UserDataStateStatus,
      currUser: currUser == freezed
          ? _value.currUser
          : currUser // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      favorites: favorites == freezed
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>,
      recipes: recipes == freezed
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>,
    ));
  }

  @override
  $UserModelCopyWith<$Res>? get currUser {
    if (_value.currUser == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.currUser!, (value) {
      return _then(_value.copyWith(currUser: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserDataStateCopyWith<$Res>
    implements $UserDataStateCopyWith<$Res> {
  factory _$$_UserDataStateCopyWith(
          _$_UserDataState value, $Res Function(_$_UserDataState) then) =
      __$$_UserDataStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserDataStateStatus status,
      UserDataStateStatus favoriteQuery,
      UserDataStateStatus recipeQuery,
      UserModel? currUser,
      List<RecipeModel> favorites,
      List<RecipeModel> recipes});

  @override
  $UserModelCopyWith<$Res>? get currUser;
}

/// @nodoc
class __$$_UserDataStateCopyWithImpl<$Res>
    extends _$UserDataStateCopyWithImpl<$Res>
    implements _$$_UserDataStateCopyWith<$Res> {
  __$$_UserDataStateCopyWithImpl(
      _$_UserDataState _value, $Res Function(_$_UserDataState) _then)
      : super(_value, (v) => _then(v as _$_UserDataState));

  @override
  _$_UserDataState get _value => super._value as _$_UserDataState;

  @override
  $Res call({
    Object? status = freezed,
    Object? favoriteQuery = freezed,
    Object? recipeQuery = freezed,
    Object? currUser = freezed,
    Object? favorites = freezed,
    Object? recipes = freezed,
  }) {
    return _then(_$_UserDataState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserDataStateStatus,
      favoriteQuery: favoriteQuery == freezed
          ? _value.favoriteQuery
          : favoriteQuery // ignore: cast_nullable_to_non_nullable
              as UserDataStateStatus,
      recipeQuery: recipeQuery == freezed
          ? _value.recipeQuery
          : recipeQuery // ignore: cast_nullable_to_non_nullable
              as UserDataStateStatus,
      currUser: currUser == freezed
          ? _value.currUser
          : currUser // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      favorites: favorites == freezed
          ? _value._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>,
      recipes: recipes == freezed
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>,
    ));
  }
}

/// @nodoc

class _$_UserDataState with DiagnosticableTreeMixin implements _UserDataState {
  const _$_UserDataState(
      {required this.status,
      required this.favoriteQuery,
      required this.recipeQuery,
      required this.currUser,
      required final List<RecipeModel> favorites,
      required final List<RecipeModel> recipes})
      : _favorites = favorites,
        _recipes = recipes;

  @override
  final UserDataStateStatus status;
  @override
  final UserDataStateStatus favoriteQuery;
  @override
  final UserDataStateStatus recipeQuery;
  @override
  final UserModel? currUser;
  final List<RecipeModel> _favorites;
  @override
  List<RecipeModel> get favorites {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

  final List<RecipeModel> _recipes;
  @override
  List<RecipeModel> get recipes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserDataState(status: $status, favoriteQuery: $favoriteQuery, recipeQuery: $recipeQuery, currUser: $currUser, favorites: $favorites, recipes: $recipes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserDataState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('favoriteQuery', favoriteQuery))
      ..add(DiagnosticsProperty('recipeQuery', recipeQuery))
      ..add(DiagnosticsProperty('currUser', currUser))
      ..add(DiagnosticsProperty('favorites', favorites))
      ..add(DiagnosticsProperty('recipes', recipes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDataState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.favoriteQuery, favoriteQuery) &&
            const DeepCollectionEquality()
                .equals(other.recipeQuery, recipeQuery) &&
            const DeepCollectionEquality().equals(other.currUser, currUser) &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites) &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(favoriteQuery),
      const DeepCollectionEquality().hash(recipeQuery),
      const DeepCollectionEquality().hash(currUser),
      const DeepCollectionEquality().hash(_favorites),
      const DeepCollectionEquality().hash(_recipes));

  @JsonKey(ignore: true)
  @override
  _$$_UserDataStateCopyWith<_$_UserDataState> get copyWith =>
      __$$_UserDataStateCopyWithImpl<_$_UserDataState>(this, _$identity);
}

abstract class _UserDataState implements UserDataState {
  const factory _UserDataState(
      {required final UserDataStateStatus status,
      required final UserDataStateStatus favoriteQuery,
      required final UserDataStateStatus recipeQuery,
      required final UserModel? currUser,
      required final List<RecipeModel> favorites,
      required final List<RecipeModel> recipes}) = _$_UserDataState;

  @override
  UserDataStateStatus get status;
  @override
  UserDataStateStatus get favoriteQuery;
  @override
  UserDataStateStatus get recipeQuery;
  @override
  UserModel? get currUser;
  @override
  List<RecipeModel> get favorites;
  @override
  List<RecipeModel> get recipes;
  @override
  @JsonKey(ignore: true)
  _$$_UserDataStateCopyWith<_$_UserDataState> get copyWith =>
      throw _privateConstructorUsedError;
}
