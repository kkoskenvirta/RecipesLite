// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_single_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeSingleDTO _$RecipeSingleDTOFromJson(Map<String, dynamic> json) {
  return _RecipeSingleDTO.fromJson(json);
}

/// @nodoc
mixin _$RecipeSingleDTO {
  @JsonKey(name: "data")
  RecipeDataDTO get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeSingleDTOCopyWith<RecipeSingleDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeSingleDTOCopyWith<$Res> {
  factory $RecipeSingleDTOCopyWith(
          RecipeSingleDTO value, $Res Function(RecipeSingleDTO) then) =
      _$RecipeSingleDTOCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: "data") RecipeDataDTO data});

  $RecipeDataDTOCopyWith<$Res> get data;
}

/// @nodoc
class _$RecipeSingleDTOCopyWithImpl<$Res>
    implements $RecipeSingleDTOCopyWith<$Res> {
  _$RecipeSingleDTOCopyWithImpl(this._value, this._then);

  final RecipeSingleDTO _value;
  // ignore: unused_field
  final $Res Function(RecipeSingleDTO) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RecipeDataDTO,
    ));
  }

  @override
  $RecipeDataDTOCopyWith<$Res> get data {
    return $RecipeDataDTOCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$$_RecipeSingleDTOCopyWith<$Res>
    implements $RecipeSingleDTOCopyWith<$Res> {
  factory _$$_RecipeSingleDTOCopyWith(
          _$_RecipeSingleDTO value, $Res Function(_$_RecipeSingleDTO) then) =
      __$$_RecipeSingleDTOCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: "data") RecipeDataDTO data});

  @override
  $RecipeDataDTOCopyWith<$Res> get data;
}

/// @nodoc
class __$$_RecipeSingleDTOCopyWithImpl<$Res>
    extends _$RecipeSingleDTOCopyWithImpl<$Res>
    implements _$$_RecipeSingleDTOCopyWith<$Res> {
  __$$_RecipeSingleDTOCopyWithImpl(
      _$_RecipeSingleDTO _value, $Res Function(_$_RecipeSingleDTO) _then)
      : super(_value, (v) => _then(v as _$_RecipeSingleDTO));

  @override
  _$_RecipeSingleDTO get _value => super._value as _$_RecipeSingleDTO;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_RecipeSingleDTO(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RecipeDataDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeSingleDTO implements _RecipeSingleDTO {
  _$_RecipeSingleDTO({@JsonKey(name: "data") required this.data});

  factory _$_RecipeSingleDTO.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeSingleDTOFromJson(json);

  @override
  @JsonKey(name: "data")
  final RecipeDataDTO data;

  @override
  String toString() {
    return 'RecipeSingleDTO(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeSingleDTO &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_RecipeSingleDTOCopyWith<_$_RecipeSingleDTO> get copyWith =>
      __$$_RecipeSingleDTOCopyWithImpl<_$_RecipeSingleDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeSingleDTOToJson(
      this,
    );
  }
}

abstract class _RecipeSingleDTO implements RecipeSingleDTO {
  factory _RecipeSingleDTO(
          {@JsonKey(name: "data") required final RecipeDataDTO data}) =
      _$_RecipeSingleDTO;

  factory _RecipeSingleDTO.fromJson(Map<String, dynamic> json) =
      _$_RecipeSingleDTO.fromJson;

  @override
  @JsonKey(name: "data")
  RecipeDataDTO get data;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeSingleDTOCopyWith<_$_RecipeSingleDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
