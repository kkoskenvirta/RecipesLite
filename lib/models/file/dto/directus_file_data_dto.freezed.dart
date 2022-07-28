// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'directus_file_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DirectusFileDataDTO _$DirectusFileDataDTOFromJson(Map<String, dynamic> json) {
  return _DirectusFileDataDTO.fromJson(json);
}

/// @nodoc
mixin _$DirectusFileDataDTO {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DirectusFileDataDTOCopyWith<DirectusFileDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectusFileDataDTOCopyWith<$Res> {
  factory $DirectusFileDataDTOCopyWith(
          DirectusFileDataDTO value, $Res Function(DirectusFileDataDTO) then) =
      _$DirectusFileDataDTOCopyWithImpl<$Res>;
  $Res call({String? id, String? title});
}

/// @nodoc
class _$DirectusFileDataDTOCopyWithImpl<$Res>
    implements $DirectusFileDataDTOCopyWith<$Res> {
  _$DirectusFileDataDTOCopyWithImpl(this._value, this._then);

  final DirectusFileDataDTO _value;
  // ignore: unused_field
  final $Res Function(DirectusFileDataDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_DirectusFileDataDTOCopyWith<$Res>
    implements $DirectusFileDataDTOCopyWith<$Res> {
  factory _$$_DirectusFileDataDTOCopyWith(_$_DirectusFileDataDTO value,
          $Res Function(_$_DirectusFileDataDTO) then) =
      __$$_DirectusFileDataDTOCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? title});
}

/// @nodoc
class __$$_DirectusFileDataDTOCopyWithImpl<$Res>
    extends _$DirectusFileDataDTOCopyWithImpl<$Res>
    implements _$$_DirectusFileDataDTOCopyWith<$Res> {
  __$$_DirectusFileDataDTOCopyWithImpl(_$_DirectusFileDataDTO _value,
      $Res Function(_$_DirectusFileDataDTO) _then)
      : super(_value, (v) => _then(v as _$_DirectusFileDataDTO));

  @override
  _$_DirectusFileDataDTO get _value => super._value as _$_DirectusFileDataDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_DirectusFileDataDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DirectusFileDataDTO extends _DirectusFileDataDTO {
  _$_DirectusFileDataDTO({this.id, this.title}) : super._();

  factory _$_DirectusFileDataDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DirectusFileDataDTOFromJson(json);

  @override
  final String? id;
  @override
  final String? title;

  @override
  String toString() {
    return 'DirectusFileDataDTO(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DirectusFileDataDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  _$$_DirectusFileDataDTOCopyWith<_$_DirectusFileDataDTO> get copyWith =>
      __$$_DirectusFileDataDTOCopyWithImpl<_$_DirectusFileDataDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DirectusFileDataDTOToJson(
      this,
    );
  }
}

abstract class _DirectusFileDataDTO extends DirectusFileDataDTO {
  factory _DirectusFileDataDTO({final String? id, final String? title}) =
      _$_DirectusFileDataDTO;
  _DirectusFileDataDTO._() : super._();

  factory _DirectusFileDataDTO.fromJson(Map<String, dynamic> json) =
      _$_DirectusFileDataDTO.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$_DirectusFileDataDTOCopyWith<_$_DirectusFileDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
