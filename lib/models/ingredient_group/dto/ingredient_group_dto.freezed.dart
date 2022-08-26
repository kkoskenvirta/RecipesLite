// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ingredient_group_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IngredientGroupDTO _$IngredientGroupDTOFromJson(Map<String, dynamic> json) {
  return _IngredientGroupDTO.fromJson(json);
}

/// @nodoc
mixin _$IngredientGroupDTO {
  @JsonKey(name: "data")
  List<IngredientGroupDataDTO> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientGroupDTOCopyWith<IngredientGroupDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientGroupDTOCopyWith<$Res> {
  factory $IngredientGroupDTOCopyWith(
          IngredientGroupDTO value, $Res Function(IngredientGroupDTO) then) =
      _$IngredientGroupDTOCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: "data") List<IngredientGroupDataDTO> data});
}

/// @nodoc
class _$IngredientGroupDTOCopyWithImpl<$Res>
    implements $IngredientGroupDTOCopyWith<$Res> {
  _$IngredientGroupDTOCopyWithImpl(this._value, this._then);

  final IngredientGroupDTO _value;
  // ignore: unused_field
  final $Res Function(IngredientGroupDTO) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<IngredientGroupDataDTO>,
    ));
  }
}

/// @nodoc
abstract class _$$_IngredientGroupDTOCopyWith<$Res>
    implements $IngredientGroupDTOCopyWith<$Res> {
  factory _$$_IngredientGroupDTOCopyWith(_$_IngredientGroupDTO value,
          $Res Function(_$_IngredientGroupDTO) then) =
      __$$_IngredientGroupDTOCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: "data") List<IngredientGroupDataDTO> data});
}

/// @nodoc
class __$$_IngredientGroupDTOCopyWithImpl<$Res>
    extends _$IngredientGroupDTOCopyWithImpl<$Res>
    implements _$$_IngredientGroupDTOCopyWith<$Res> {
  __$$_IngredientGroupDTOCopyWithImpl(
      _$_IngredientGroupDTO _value, $Res Function(_$_IngredientGroupDTO) _then)
      : super(_value, (v) => _then(v as _$_IngredientGroupDTO));

  @override
  _$_IngredientGroupDTO get _value => super._value as _$_IngredientGroupDTO;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_IngredientGroupDTO(
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<IngredientGroupDataDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IngredientGroupDTO implements _IngredientGroupDTO {
  _$_IngredientGroupDTO(
      {@JsonKey(name: "data") required final List<IngredientGroupDataDTO> data})
      : _data = data;

  factory _$_IngredientGroupDTO.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientGroupDTOFromJson(json);

  final List<IngredientGroupDataDTO> _data;
  @override
  @JsonKey(name: "data")
  List<IngredientGroupDataDTO> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'IngredientGroupDTO(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IngredientGroupDTO &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_IngredientGroupDTOCopyWith<_$_IngredientGroupDTO> get copyWith =>
      __$$_IngredientGroupDTOCopyWithImpl<_$_IngredientGroupDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientGroupDTOToJson(
      this,
    );
  }
}

abstract class _IngredientGroupDTO implements IngredientGroupDTO {
  factory _IngredientGroupDTO(
          {@JsonKey(name: "data")
              required final List<IngredientGroupDataDTO> data}) =
      _$_IngredientGroupDTO;

  factory _IngredientGroupDTO.fromJson(Map<String, dynamic> json) =
      _$_IngredientGroupDTO.fromJson;

  @override
  @JsonKey(name: "data")
  List<IngredientGroupDataDTO> get data;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientGroupDTOCopyWith<_$_IngredientGroupDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
