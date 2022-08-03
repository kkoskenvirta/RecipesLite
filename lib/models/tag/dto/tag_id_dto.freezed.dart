// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag_id_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagIdDTO _$TagIdDTOFromJson(Map<String, dynamic> json) {
  return _TagIdDTO.fromJson(json);
}

/// @nodoc
mixin _$TagIdDTO {
  @JsonKey(name: "id")
  int get relationId => throw _privateConstructorUsedError;
  @JsonKey(name: "tag_id")
  TagDataDTO get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagIdDTOCopyWith<TagIdDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagIdDTOCopyWith<$Res> {
  factory $TagIdDTOCopyWith(TagIdDTO value, $Res Function(TagIdDTO) then) =
      _$TagIdDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") int relationId,
      @JsonKey(name: "tag_id") TagDataDTO tag});

  $TagDataDTOCopyWith<$Res> get tag;
}

/// @nodoc
class _$TagIdDTOCopyWithImpl<$Res> implements $TagIdDTOCopyWith<$Res> {
  _$TagIdDTOCopyWithImpl(this._value, this._then);

  final TagIdDTO _value;
  // ignore: unused_field
  final $Res Function(TagIdDTO) _then;

  @override
  $Res call({
    Object? relationId = freezed,
    Object? tag = freezed,
  }) {
    return _then(_value.copyWith(
      relationId: relationId == freezed
          ? _value.relationId
          : relationId // ignore: cast_nullable_to_non_nullable
              as int,
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagDataDTO,
    ));
  }

  @override
  $TagDataDTOCopyWith<$Res> get tag {
    return $TagDataDTOCopyWith<$Res>(_value.tag, (value) {
      return _then(_value.copyWith(tag: value));
    });
  }
}

/// @nodoc
abstract class _$$_TagIdDTOCopyWith<$Res> implements $TagIdDTOCopyWith<$Res> {
  factory _$$_TagIdDTOCopyWith(
          _$_TagIdDTO value, $Res Function(_$_TagIdDTO) then) =
      __$$_TagIdDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") int relationId,
      @JsonKey(name: "tag_id") TagDataDTO tag});

  @override
  $TagDataDTOCopyWith<$Res> get tag;
}

/// @nodoc
class __$$_TagIdDTOCopyWithImpl<$Res> extends _$TagIdDTOCopyWithImpl<$Res>
    implements _$$_TagIdDTOCopyWith<$Res> {
  __$$_TagIdDTOCopyWithImpl(
      _$_TagIdDTO _value, $Res Function(_$_TagIdDTO) _then)
      : super(_value, (v) => _then(v as _$_TagIdDTO));

  @override
  _$_TagIdDTO get _value => super._value as _$_TagIdDTO;

  @override
  $Res call({
    Object? relationId = freezed,
    Object? tag = freezed,
  }) {
    return _then(_$_TagIdDTO(
      relationId: relationId == freezed
          ? _value.relationId
          : relationId // ignore: cast_nullable_to_non_nullable
              as int,
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagDataDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TagIdDTO extends _TagIdDTO {
  _$_TagIdDTO(
      {@JsonKey(name: "id") required this.relationId,
      @JsonKey(name: "tag_id") required this.tag})
      : super._();

  factory _$_TagIdDTO.fromJson(Map<String, dynamic> json) =>
      _$$_TagIdDTOFromJson(json);

  @override
  @JsonKey(name: "id")
  final int relationId;
  @override
  @JsonKey(name: "tag_id")
  final TagDataDTO tag;

  @override
  String toString() {
    return 'TagIdDTO(relationId: $relationId, tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagIdDTO &&
            const DeepCollectionEquality()
                .equals(other.relationId, relationId) &&
            const DeepCollectionEquality().equals(other.tag, tag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(relationId),
      const DeepCollectionEquality().hash(tag));

  @JsonKey(ignore: true)
  @override
  _$$_TagIdDTOCopyWith<_$_TagIdDTO> get copyWith =>
      __$$_TagIdDTOCopyWithImpl<_$_TagIdDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagIdDTOToJson(
      this,
    );
  }
}

abstract class _TagIdDTO extends TagIdDTO {
  factory _TagIdDTO(
      {@JsonKey(name: "id") required final int relationId,
      @JsonKey(name: "tag_id") required final TagDataDTO tag}) = _$_TagIdDTO;
  _TagIdDTO._() : super._();

  factory _TagIdDTO.fromJson(Map<String, dynamic> json) = _$_TagIdDTO.fromJson;

  @override
  @JsonKey(name: "id")
  int get relationId;
  @override
  @JsonKey(name: "tag_id")
  TagDataDTO get tag;
  @override
  @JsonKey(ignore: true)
  _$$_TagIdDTOCopyWith<_$_TagIdDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
