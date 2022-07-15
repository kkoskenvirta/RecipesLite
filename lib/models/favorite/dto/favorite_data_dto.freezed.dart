// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavoriteDataDTO _$FavoriteDataDTOFromJson(Map<String, dynamic> json) {
  return _FavoriteDataDTO.fromJson(json);
}

/// @nodoc
mixin _$FavoriteDataDTO {
  @JsonKey(name: 'recipe_id')
  String get recipeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_data_id')
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteDataDTOCopyWith<FavoriteDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteDataDTOCopyWith<$Res> {
  factory $FavoriteDataDTOCopyWith(
          FavoriteDataDTO value, $Res Function(FavoriteDataDTO) then) =
      _$FavoriteDataDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'recipe_id') String recipeId,
      @JsonKey(name: 'user_data_id') String userId});
}

/// @nodoc
class _$FavoriteDataDTOCopyWithImpl<$Res>
    implements $FavoriteDataDTOCopyWith<$Res> {
  _$FavoriteDataDTOCopyWithImpl(this._value, this._then);

  final FavoriteDataDTO _value;
  // ignore: unused_field
  final $Res Function(FavoriteDataDTO) _then;

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
abstract class _$$_FavoriteDataDTOCopyWith<$Res>
    implements $FavoriteDataDTOCopyWith<$Res> {
  factory _$$_FavoriteDataDTOCopyWith(
          _$_FavoriteDataDTO value, $Res Function(_$_FavoriteDataDTO) then) =
      __$$_FavoriteDataDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'recipe_id') String recipeId,
      @JsonKey(name: 'user_data_id') String userId});
}

/// @nodoc
class __$$_FavoriteDataDTOCopyWithImpl<$Res>
    extends _$FavoriteDataDTOCopyWithImpl<$Res>
    implements _$$_FavoriteDataDTOCopyWith<$Res> {
  __$$_FavoriteDataDTOCopyWithImpl(
      _$_FavoriteDataDTO _value, $Res Function(_$_FavoriteDataDTO) _then)
      : super(_value, (v) => _then(v as _$_FavoriteDataDTO));

  @override
  _$_FavoriteDataDTO get _value => super._value as _$_FavoriteDataDTO;

  @override
  $Res call({
    Object? recipeId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_FavoriteDataDTO(
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
class _$_FavoriteDataDTO extends _FavoriteDataDTO {
  _$_FavoriteDataDTO(
      {@JsonKey(name: 'recipe_id') required this.recipeId,
      @JsonKey(name: 'user_data_id') required this.userId})
      : super._();

  factory _$_FavoriteDataDTO.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteDataDTOFromJson(json);

  @override
  @JsonKey(name: 'recipe_id')
  final String recipeId;
  @override
  @JsonKey(name: 'user_data_id')
  final String userId;

  @override
  String toString() {
    return 'FavoriteDataDTO(recipeId: $recipeId, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteDataDTO &&
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
  _$$_FavoriteDataDTOCopyWith<_$_FavoriteDataDTO> get copyWith =>
      __$$_FavoriteDataDTOCopyWithImpl<_$_FavoriteDataDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteDataDTOToJson(this);
  }
}

abstract class _FavoriteDataDTO extends FavoriteDataDTO {
  factory _FavoriteDataDTO(
          {@JsonKey(name: 'recipe_id') required final String recipeId,
          @JsonKey(name: 'user_data_id') required final String userId}) =
      _$_FavoriteDataDTO;
  _FavoriteDataDTO._() : super._();

  factory _FavoriteDataDTO.fromJson(Map<String, dynamic> json) =
      _$_FavoriteDataDTO.fromJson;

  @override
  @JsonKey(name: 'recipe_id')
  String get recipeId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'user_data_id')
  String get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteDataDTOCopyWith<_$_FavoriteDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
