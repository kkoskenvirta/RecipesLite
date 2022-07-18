// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavoriteDTO _$FavoriteDTOFromJson(Map<String, dynamic> json) {
  return _FavoriteDTO.fromJson(json);
}

/// @nodoc
mixin _$FavoriteDTO {
  @JsonKey(name: 'recipe_id')
  String get recipeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteDTOCopyWith<FavoriteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteDTOCopyWith<$Res> {
  factory $FavoriteDTOCopyWith(
          FavoriteDTO value, $Res Function(FavoriteDTO) then) =
      _$FavoriteDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'recipe_id') String recipeId,
      @JsonKey(name: 'user_id') String userId});
}

/// @nodoc
class _$FavoriteDTOCopyWithImpl<$Res> implements $FavoriteDTOCopyWith<$Res> {
  _$FavoriteDTOCopyWithImpl(this._value, this._then);

  final FavoriteDTO _value;
  // ignore: unused_field
  final $Res Function(FavoriteDTO) _then;

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
abstract class _$$_FavoriteDTOCopyWith<$Res>
    implements $FavoriteDTOCopyWith<$Res> {
  factory _$$_FavoriteDTOCopyWith(
          _$_FavoriteDTO value, $Res Function(_$_FavoriteDTO) then) =
      __$$_FavoriteDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'recipe_id') String recipeId,
      @JsonKey(name: 'user_id') String userId});
}

/// @nodoc
class __$$_FavoriteDTOCopyWithImpl<$Res> extends _$FavoriteDTOCopyWithImpl<$Res>
    implements _$$_FavoriteDTOCopyWith<$Res> {
  __$$_FavoriteDTOCopyWithImpl(
      _$_FavoriteDTO _value, $Res Function(_$_FavoriteDTO) _then)
      : super(_value, (v) => _then(v as _$_FavoriteDTO));

  @override
  _$_FavoriteDTO get _value => super._value as _$_FavoriteDTO;

  @override
  $Res call({
    Object? recipeId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_FavoriteDTO(
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
class _$_FavoriteDTO extends _FavoriteDTO {
  _$_FavoriteDTO(
      {@JsonKey(name: 'recipe_id') required this.recipeId,
      @JsonKey(name: 'user_id') required this.userId})
      : super._();

  factory _$_FavoriteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteDTOFromJson(json);

  @override
  @JsonKey(name: 'recipe_id')
  final String recipeId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;

  @override
  String toString() {
    return 'FavoriteDTO(recipeId: $recipeId, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteDTO &&
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
  _$$_FavoriteDTOCopyWith<_$_FavoriteDTO> get copyWith =>
      __$$_FavoriteDTOCopyWithImpl<_$_FavoriteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteDTOToJson(this);
  }
}

abstract class _FavoriteDTO extends FavoriteDTO {
  factory _FavoriteDTO(
      {@JsonKey(name: 'recipe_id') required final String recipeId,
      @JsonKey(name: 'user_id') required final String userId}) = _$_FavoriteDTO;
  _FavoriteDTO._() : super._();

  factory _FavoriteDTO.fromJson(Map<String, dynamic> json) =
      _$_FavoriteDTO.fromJson;

  @override
  @JsonKey(name: 'recipe_id')
  String get recipeId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteDTOCopyWith<_$_FavoriteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
