// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) {
  return _FavoriteModel.fromJson(json);
}

/// @nodoc
mixin _$FavoriteModel {
  @JsonKey(name: 'recipe_id')
  String get recipeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteModelCopyWith<FavoriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteModelCopyWith<$Res> {
  factory $FavoriteModelCopyWith(
          FavoriteModel value, $Res Function(FavoriteModel) then) =
      _$FavoriteModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'recipe_id') String recipeId,
      @JsonKey(name: 'user_id') String userId});
}

/// @nodoc
class _$FavoriteModelCopyWithImpl<$Res>
    implements $FavoriteModelCopyWith<$Res> {
  _$FavoriteModelCopyWithImpl(this._value, this._then);

  final FavoriteModel _value;
  // ignore: unused_field
  final $Res Function(FavoriteModel) _then;

  @override
  $Res call({
    Object? recipeId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      recipeId: recipeId == freezed
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FavoriteModelCopyWith<$Res>
    implements $FavoriteModelCopyWith<$Res> {
  factory _$$_FavoriteModelCopyWith(
          _$_FavoriteModel value, $Res Function(_$_FavoriteModel) then) =
      __$$_FavoriteModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'recipe_id') String recipeId,
      @JsonKey(name: 'user_id') String userId});
}

/// @nodoc
class __$$_FavoriteModelCopyWithImpl<$Res>
    extends _$FavoriteModelCopyWithImpl<$Res>
    implements _$$_FavoriteModelCopyWith<$Res> {
  __$$_FavoriteModelCopyWithImpl(
      _$_FavoriteModel _value, $Res Function(_$_FavoriteModel) _then)
      : super(_value, (v) => _then(v as _$_FavoriteModel));

  @override
  _$_FavoriteModel get _value => super._value as _$_FavoriteModel;

  @override
  $Res call({
    Object? recipeId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_FavoriteModel(
      recipeId: recipeId == freezed
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavoriteModel extends _FavoriteModel {
  _$_FavoriteModel(
      {@JsonKey(name: 'recipe_id') required this.recipeId,
      @JsonKey(name: 'user_id') required this.userId})
      : super._();

  factory _$_FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteModelFromJson(json);

  @override
  @JsonKey(name: 'recipe_id')
  final String recipeId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;

  @override
  String toString() {
    return 'FavoriteModel(recipeId: $recipeId, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteModel &&
            const DeepCollectionEquality().equals(other.recipeId, recipeId) &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(recipeId),
      const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_FavoriteModelCopyWith<_$_FavoriteModel> get copyWith =>
      __$$_FavoriteModelCopyWithImpl<_$_FavoriteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteModelToJson(this);
  }
}

abstract class _FavoriteModel extends FavoriteModel {
  factory _FavoriteModel(
          {@JsonKey(name: 'recipe_id') required final String recipeId,
          @JsonKey(name: 'user_id') required final String userId}) =
      _$_FavoriteModel;
  _FavoriteModel._() : super._();

  factory _FavoriteModel.fromJson(Map<String, dynamic> json) =
      _$_FavoriteModel.fromJson;

  @override
  @JsonKey(name: 'recipe_id')
  String get recipeId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteModelCopyWith<_$_FavoriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}
