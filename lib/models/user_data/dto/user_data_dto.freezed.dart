// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDataDTO _$UserDataDTOFromJson(Map<String, dynamic> json) {
  return _UserDataDTO.fromJson(json);
}

/// @nodoc
mixin _$UserDataDTO {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'favorites')
  List<RecipeIdDTO> get favorites => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataDTOCopyWith<UserDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataDTOCopyWith<$Res> {
  factory $UserDataDTOCopyWith(
          UserDataDTO value, $Res Function(UserDataDTO) then) =
      _$UserDataDTOCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'user') String userId,
      @JsonKey(name: 'favorites') List<RecipeIdDTO> favorites});
}

/// @nodoc
class _$UserDataDTOCopyWithImpl<$Res> implements $UserDataDTOCopyWith<$Res> {
  _$UserDataDTOCopyWithImpl(this._value, this._then);

  final UserDataDTO _value;
  // ignore: unused_field
  final $Res Function(UserDataDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? favorites = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      favorites: favorites == freezed
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<RecipeIdDTO>,
    ));
  }
}

/// @nodoc
abstract class _$$_UserDataDTOCopyWith<$Res>
    implements $UserDataDTOCopyWith<$Res> {
  factory _$$_UserDataDTOCopyWith(
          _$_UserDataDTO value, $Res Function(_$_UserDataDTO) then) =
      __$$_UserDataDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'user') String userId,
      @JsonKey(name: 'favorites') List<RecipeIdDTO> favorites});
}

/// @nodoc
class __$$_UserDataDTOCopyWithImpl<$Res> extends _$UserDataDTOCopyWithImpl<$Res>
    implements _$$_UserDataDTOCopyWith<$Res> {
  __$$_UserDataDTOCopyWithImpl(
      _$_UserDataDTO _value, $Res Function(_$_UserDataDTO) _then)
      : super(_value, (v) => _then(v as _$_UserDataDTO));

  @override
  _$_UserDataDTO get _value => super._value as _$_UserDataDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? favorites = freezed,
  }) {
    return _then(_$_UserDataDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      favorites: favorites == freezed
          ? _value._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<RecipeIdDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDataDTO extends _UserDataDTO {
  _$_UserDataDTO(
      {required this.id,
      @JsonKey(name: 'user') required this.userId,
      @JsonKey(name: 'favorites') required final List<RecipeIdDTO> favorites})
      : _favorites = favorites,
        super._();

  factory _$_UserDataDTO.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataDTOFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user')
  final String userId;
  final List<RecipeIdDTO> _favorites;
  @override
  @JsonKey(name: 'favorites')
  List<RecipeIdDTO> get favorites {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

  @override
  String toString() {
    return 'UserDataDTO(id: $id, userId: $userId, favorites: $favorites)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDataDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(_favorites));

  @JsonKey(ignore: true)
  @override
  _$$_UserDataDTOCopyWith<_$_UserDataDTO> get copyWith =>
      __$$_UserDataDTOCopyWithImpl<_$_UserDataDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDataDTOToJson(this);
  }
}

abstract class _UserDataDTO extends UserDataDTO {
  factory _UserDataDTO(
      {required final String id,
      @JsonKey(name: 'user')
          required final String userId,
      @JsonKey(name: 'favorites')
          required final List<RecipeIdDTO> favorites}) = _$_UserDataDTO;
  _UserDataDTO._() : super._();

  factory _UserDataDTO.fromJson(Map<String, dynamic> json) =
      _$_UserDataDTO.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'user')
  String get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'favorites')
  List<RecipeIdDTO> get favorites => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserDataDTOCopyWith<_$_UserDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
