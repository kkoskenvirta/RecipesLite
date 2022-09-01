// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_many_directus_items_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetManyDirectusItemsDTO _$GetManyDirectusItemsDTOFromJson(
    Map<String, dynamic> json) {
  return _GetManyDirectusItemsDTO.fromJson(json);
}

/// @nodoc
mixin _$GetManyDirectusItemsDTO {
  List<dynamic> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetManyDirectusItemsDTOCopyWith<GetManyDirectusItemsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetManyDirectusItemsDTOCopyWith<$Res> {
  factory $GetManyDirectusItemsDTOCopyWith(GetManyDirectusItemsDTO value,
          $Res Function(GetManyDirectusItemsDTO) then) =
      _$GetManyDirectusItemsDTOCopyWithImpl<$Res>;
  $Res call({List<dynamic> data});
}

/// @nodoc
class _$GetManyDirectusItemsDTOCopyWithImpl<$Res>
    implements $GetManyDirectusItemsDTOCopyWith<$Res> {
  _$GetManyDirectusItemsDTOCopyWithImpl(this._value, this._then);

  final GetManyDirectusItemsDTO _value;
  // ignore: unused_field
  final $Res Function(GetManyDirectusItemsDTO) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$$_GetManyDirectusItemsDTOCopyWith<$Res>
    implements $GetManyDirectusItemsDTOCopyWith<$Res> {
  factory _$$_GetManyDirectusItemsDTOCopyWith(_$_GetManyDirectusItemsDTO value,
          $Res Function(_$_GetManyDirectusItemsDTO) then) =
      __$$_GetManyDirectusItemsDTOCopyWithImpl<$Res>;
  @override
  $Res call({List<dynamic> data});
}

/// @nodoc
class __$$_GetManyDirectusItemsDTOCopyWithImpl<$Res>
    extends _$GetManyDirectusItemsDTOCopyWithImpl<$Res>
    implements _$$_GetManyDirectusItemsDTOCopyWith<$Res> {
  __$$_GetManyDirectusItemsDTOCopyWithImpl(_$_GetManyDirectusItemsDTO _value,
      $Res Function(_$_GetManyDirectusItemsDTO) _then)
      : super(_value, (v) => _then(v as _$_GetManyDirectusItemsDTO));

  @override
  _$_GetManyDirectusItemsDTO get _value =>
      super._value as _$_GetManyDirectusItemsDTO;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_GetManyDirectusItemsDTO(
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetManyDirectusItemsDTO extends _GetManyDirectusItemsDTO {
  const _$_GetManyDirectusItemsDTO({required final List<dynamic> data})
      : _data = data,
        super._();

  factory _$_GetManyDirectusItemsDTO.fromJson(Map<String, dynamic> json) =>
      _$$_GetManyDirectusItemsDTOFromJson(json);

  final List<dynamic> _data;
  @override
  List<dynamic> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetManyDirectusItemsDTO(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetManyDirectusItemsDTO &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_GetManyDirectusItemsDTOCopyWith<_$_GetManyDirectusItemsDTO>
      get copyWith =>
          __$$_GetManyDirectusItemsDTOCopyWithImpl<_$_GetManyDirectusItemsDTO>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetManyDirectusItemsDTOToJson(
      this,
    );
  }
}

abstract class _GetManyDirectusItemsDTO extends GetManyDirectusItemsDTO {
  const factory _GetManyDirectusItemsDTO({required final List<dynamic> data}) =
      _$_GetManyDirectusItemsDTO;
  const _GetManyDirectusItemsDTO._() : super._();

  factory _GetManyDirectusItemsDTO.fromJson(Map<String, dynamic> json) =
      _$_GetManyDirectusItemsDTO.fromJson;

  @override
  List<dynamic> get data;
  @override
  @JsonKey(ignore: true)
  _$$_GetManyDirectusItemsDTOCopyWith<_$_GetManyDirectusItemsDTO>
      get copyWith => throw _privateConstructorUsedError;
}
