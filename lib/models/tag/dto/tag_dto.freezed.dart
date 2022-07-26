// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagDTO _$TagDTOFromJson(Map<String, dynamic> json) {
  return _TagDTO.fromJson(json);
}

/// @nodoc
mixin _$TagDTO {
  List<TagDataDTO> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagDTOCopyWith<TagDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagDTOCopyWith<$Res> {
  factory $TagDTOCopyWith(TagDTO value, $Res Function(TagDTO) then) =
      _$TagDTOCopyWithImpl<$Res>;
  $Res call({List<TagDataDTO> data});
}

/// @nodoc
class _$TagDTOCopyWithImpl<$Res> implements $TagDTOCopyWith<$Res> {
  _$TagDTOCopyWithImpl(this._value, this._then);

  final TagDTO _value;
  // ignore: unused_field
  final $Res Function(TagDTO) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TagDataDTO>,
    ));
  }
}

/// @nodoc
abstract class _$$_TagDTOCopyWith<$Res> implements $TagDTOCopyWith<$Res> {
  factory _$$_TagDTOCopyWith(_$_TagDTO value, $Res Function(_$_TagDTO) then) =
      __$$_TagDTOCopyWithImpl<$Res>;
  @override
  $Res call({List<TagDataDTO> data});
}

/// @nodoc
class __$$_TagDTOCopyWithImpl<$Res> extends _$TagDTOCopyWithImpl<$Res>
    implements _$$_TagDTOCopyWith<$Res> {
  __$$_TagDTOCopyWithImpl(_$_TagDTO _value, $Res Function(_$_TagDTO) _then)
      : super(_value, (v) => _then(v as _$_TagDTO));

  @override
  _$_TagDTO get _value => super._value as _$_TagDTO;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_TagDTO(
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TagDataDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TagDTO implements _TagDTO {
  const _$_TagDTO({required final List<TagDataDTO> data}) : _data = data;

  factory _$_TagDTO.fromJson(Map<String, dynamic> json) =>
      _$$_TagDTOFromJson(json);

  final List<TagDataDTO> _data;
  @override
  List<TagDataDTO> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TagDTO(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagDTO &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_TagDTOCopyWith<_$_TagDTO> get copyWith =>
      __$$_TagDTOCopyWithImpl<_$_TagDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagDTOToJson(
      this,
    );
  }
}

abstract class _TagDTO implements TagDTO {
  const factory _TagDTO({required final List<TagDataDTO> data}) = _$_TagDTO;

  factory _TagDTO.fromJson(Map<String, dynamic> json) = _$_TagDTO.fromJson;

  @override
  List<TagDataDTO> get data;
  @override
  @JsonKey(ignore: true)
  _$$_TagDTOCopyWith<_$_TagDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
