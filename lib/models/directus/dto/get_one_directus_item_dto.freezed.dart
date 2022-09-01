// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_one_directus_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetOneDirectusItemDTO _$GetOneDirectusItemDTOFromJson(
    Map<String, dynamic> json) {
  return _GetOneDirectusItemDTO.fromJson(json);
}

/// @nodoc
mixin _$GetOneDirectusItemDTO {
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetOneDirectusItemDTOCopyWith<GetOneDirectusItemDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetOneDirectusItemDTOCopyWith<$Res> {
  factory $GetOneDirectusItemDTOCopyWith(GetOneDirectusItemDTO value,
          $Res Function(GetOneDirectusItemDTO) then) =
      _$GetOneDirectusItemDTOCopyWithImpl<$Res>;
  $Res call({dynamic data});
}

/// @nodoc
class _$GetOneDirectusItemDTOCopyWithImpl<$Res>
    implements $GetOneDirectusItemDTOCopyWith<$Res> {
  _$GetOneDirectusItemDTOCopyWithImpl(this._value, this._then);

  final GetOneDirectusItemDTO _value;
  // ignore: unused_field
  final $Res Function(GetOneDirectusItemDTO) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_GetOneDirectusItemDTOCopyWith<$Res>
    implements $GetOneDirectusItemDTOCopyWith<$Res> {
  factory _$$_GetOneDirectusItemDTOCopyWith(_$_GetOneDirectusItemDTO value,
          $Res Function(_$_GetOneDirectusItemDTO) then) =
      __$$_GetOneDirectusItemDTOCopyWithImpl<$Res>;
  @override
  $Res call({dynamic data});
}

/// @nodoc
class __$$_GetOneDirectusItemDTOCopyWithImpl<$Res>
    extends _$GetOneDirectusItemDTOCopyWithImpl<$Res>
    implements _$$_GetOneDirectusItemDTOCopyWith<$Res> {
  __$$_GetOneDirectusItemDTOCopyWithImpl(_$_GetOneDirectusItemDTO _value,
      $Res Function(_$_GetOneDirectusItemDTO) _then)
      : super(_value, (v) => _then(v as _$_GetOneDirectusItemDTO));

  @override
  _$_GetOneDirectusItemDTO get _value =>
      super._value as _$_GetOneDirectusItemDTO;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_GetOneDirectusItemDTO(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetOneDirectusItemDTO extends _GetOneDirectusItemDTO {
  const _$_GetOneDirectusItemDTO({required this.data}) : super._();

  factory _$_GetOneDirectusItemDTO.fromJson(Map<String, dynamic> json) =>
      _$$_GetOneDirectusItemDTOFromJson(json);

  @override
  final dynamic data;

  @override
  String toString() {
    return 'GetOneDirectusItemDTO(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetOneDirectusItemDTO &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_GetOneDirectusItemDTOCopyWith<_$_GetOneDirectusItemDTO> get copyWith =>
      __$$_GetOneDirectusItemDTOCopyWithImpl<_$_GetOneDirectusItemDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetOneDirectusItemDTOToJson(
      this,
    );
  }
}

abstract class _GetOneDirectusItemDTO extends GetOneDirectusItemDTO {
  const factory _GetOneDirectusItemDTO({required final dynamic data}) =
      _$_GetOneDirectusItemDTO;
  const _GetOneDirectusItemDTO._() : super._();

  factory _GetOneDirectusItemDTO.fromJson(Map<String, dynamic> json) =
      _$_GetOneDirectusItemDTO.fromJson;

  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$_GetOneDirectusItemDTOCopyWith<_$_GetOneDirectusItemDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
