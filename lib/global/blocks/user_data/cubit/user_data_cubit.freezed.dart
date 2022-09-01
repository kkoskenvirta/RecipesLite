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
  UserDataStateStatus get recipeStatus => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  UserDataModel? get userData => throw _privateConstructorUsedError;
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
      UserDataStateStatus recipeStatus,
      UserModel? user,
      UserDataModel? userData,
      List<RecipeModel> favorites,
      List<RecipeModel> recipes});

  $UserModelCopyWith<$Res>? get user;
  $UserDataModelCopyWith<$Res>? get userData;
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
    Object? recipeStatus = freezed,
    Object? user = freezed,
    Object? userData = freezed,
    Object? favorites = freezed,
    Object? recipes = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserDataStateStatus,
      recipeStatus: recipeStatus == freezed
          ? _value.recipeStatus
          : recipeStatus // ignore: cast_nullable_to_non_nullable
              as UserDataStateStatus,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      userData: userData == freezed
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserDataModel?,
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
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $UserDataModelCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $UserDataModelCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value));
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
      UserDataStateStatus recipeStatus,
      UserModel? user,
      UserDataModel? userData,
      List<RecipeModel> favorites,
      List<RecipeModel> recipes});

  @override
  $UserModelCopyWith<$Res>? get user;
  @override
  $UserDataModelCopyWith<$Res>? get userData;
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
    Object? recipeStatus = freezed,
    Object? user = freezed,
    Object? userData = freezed,
    Object? favorites = freezed,
    Object? recipes = freezed,
  }) {
    return _then(_$_UserDataState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserDataStateStatus,
      recipeStatus: recipeStatus == freezed
          ? _value.recipeStatus
          : recipeStatus // ignore: cast_nullable_to_non_nullable
              as UserDataStateStatus,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      userData: userData == freezed
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserDataModel?,
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

class _$_UserDataState implements _UserDataState {
  const _$_UserDataState(
      {required this.status,
      required this.recipeStatus,
      required this.user,
      required this.userData,
      required final List<RecipeModel> favorites,
      required final List<RecipeModel> recipes})
      : _favorites = favorites,
        _recipes = recipes;

  @override
  final UserDataStateStatus status;
  @override
  final UserDataStateStatus recipeStatus;
  @override
  final UserModel? user;
  @override
  final UserDataModel? userData;
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
  String toString() {
    return 'UserDataState(status: $status, recipeStatus: $recipeStatus, user: $user, userData: $userData, favorites: $favorites, recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDataState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.recipeStatus, recipeStatus) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.userData, userData) &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites) &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(recipeStatus),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(userData),
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
      required final UserDataStateStatus recipeStatus,
      required final UserModel? user,
      required final UserDataModel? userData,
      required final List<RecipeModel> favorites,
      required final List<RecipeModel> recipes}) = _$_UserDataState;

  @override
  UserDataStateStatus get status;
  @override
  UserDataStateStatus get recipeStatus;
  @override
  UserModel? get user;
  @override
  UserDataModel? get userData;
  @override
  List<RecipeModel> get favorites;
  @override
  List<RecipeModel> get recipes;
  @override
  @JsonKey(ignore: true)
  _$$_UserDataStateCopyWith<_$_UserDataState> get copyWith =>
      throw _privateConstructorUsedError;
}
