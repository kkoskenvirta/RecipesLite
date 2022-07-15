// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeDTO _$RecipeDTOFromJson(Map<String, dynamic> json) {
  return _RecipeDTO.fromJson(json);
}

/// @nodoc
mixin _$RecipeDTO {
  @JsonKey(name: "data")
  List<RecipeDataDTO> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeDTOCopyWith<RecipeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeDTOCopyWith<$Res> {
  factory $RecipeDTOCopyWith(RecipeDTO value, $Res Function(RecipeDTO) then) =
      _$RecipeDTOCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: "data") List<RecipeDataDTO> data});
}

/// @nodoc
class _$RecipeDTOCopyWithImpl<$Res> implements $RecipeDTOCopyWith<$Res> {
  _$RecipeDTOCopyWithImpl(this._value, this._then);

  final RecipeDTO _value;
  // ignore: unused_field
  final $Res Function(RecipeDTO) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RecipeDataDTO>,
    ));
  }
}

/// @nodoc
abstract class _$$_RecipeDTOCopyWith<$Res> implements $RecipeDTOCopyWith<$Res> {
  factory _$$_RecipeDTOCopyWith(
          _$_RecipeDTO value, $Res Function(_$_RecipeDTO) then) =
      __$$_RecipeDTOCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: "data") List<RecipeDataDTO> data});
}

/// @nodoc
class __$$_RecipeDTOCopyWithImpl<$Res> extends _$RecipeDTOCopyWithImpl<$Res>
    implements _$$_RecipeDTOCopyWith<$Res> {
  __$$_RecipeDTOCopyWithImpl(
      _$_RecipeDTO _value, $Res Function(_$_RecipeDTO) _then)
      : super(_value, (v) => _then(v as _$_RecipeDTO));

  @override
  _$_RecipeDTO get _value => super._value as _$_RecipeDTO;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_RecipeDTO(
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RecipeDataDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeDTO implements _RecipeDTO {
  _$_RecipeDTO({@JsonKey(name: "data") required final List<RecipeDataDTO> data})
      : _data = data;

  factory _$_RecipeDTO.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeDTOFromJson(json);

  final List<RecipeDataDTO> _data;
  @override
  @JsonKey(name: "data")
  List<RecipeDataDTO> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'RecipeDTO(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeDTO &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_RecipeDTOCopyWith<_$_RecipeDTO> get copyWith =>
      __$$_RecipeDTOCopyWithImpl<_$_RecipeDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeDTOToJson(this);
  }
}

abstract class _RecipeDTO implements RecipeDTO {
  factory _RecipeDTO(
          {@JsonKey(name: "data") required final List<RecipeDataDTO> data}) =
      _$_RecipeDTO;

  factory _RecipeDTO.fromJson(Map<String, dynamic> json) =
      _$_RecipeDTO.fromJson;

  @override
  @JsonKey(name: "data")
  List<RecipeDataDTO> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeDTOCopyWith<_$_RecipeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
