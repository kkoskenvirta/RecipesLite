// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagDataDTO _$TagDataDTOFromJson(Map<String, dynamic> json) {
  return _TagDataDTO.fromJson(json);
}

/// @nodoc
mixin _$TagDataDTO {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag_name')
  String get name => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get sort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagDataDTOCopyWith<TagDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagDataDTOCopyWith<$Res> {
  factory $TagDataDTOCopyWith(
          TagDataDTO value, $Res Function(TagDataDTO) then) =
      _$TagDataDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'tag_name') String name,
      String? status,
      String? sort});
}

/// @nodoc
class _$TagDataDTOCopyWithImpl<$Res> implements $TagDataDTOCopyWith<$Res> {
  _$TagDataDTOCopyWithImpl(this._value, this._then);

  final TagDataDTO _value;
  // ignore: unused_field
  final $Res Function(TagDataDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? sort = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_TagDataDTOCopyWith<$Res>
    implements $TagDataDTOCopyWith<$Res> {
  factory _$$_TagDataDTOCopyWith(
          _$_TagDataDTO value, $Res Function(_$_TagDataDTO) then) =
      __$$_TagDataDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'tag_name') String name,
      String? status,
      String? sort});
}

/// @nodoc
class __$$_TagDataDTOCopyWithImpl<$Res> extends _$TagDataDTOCopyWithImpl<$Res>
    implements _$$_TagDataDTOCopyWith<$Res> {
  __$$_TagDataDTOCopyWithImpl(
      _$_TagDataDTO _value, $Res Function(_$_TagDataDTO) _then)
      : super(_value, (v) => _then(v as _$_TagDataDTO));

  @override
  _$_TagDataDTO get _value => super._value as _$_TagDataDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? sort = freezed,
  }) {
    return _then(_$_TagDataDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TagDataDTO extends _TagDataDTO {
  _$_TagDataDTO(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'tag_name') this.name = '',
      this.status,
      this.sort})
      : super._();

  factory _$_TagDataDTO.fromJson(Map<String, dynamic> json) =>
      _$$_TagDataDTOFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'tag_name')
  final String name;
  @override
  final String? status;
  @override
  final String? sort;

  @override
  String toString() {
    return 'TagDataDTO(id: $id, name: $name, status: $status, sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagDataDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.sort, sort));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(sort));

  @JsonKey(ignore: true)
  @override
  _$$_TagDataDTOCopyWith<_$_TagDataDTO> get copyWith =>
      __$$_TagDataDTOCopyWithImpl<_$_TagDataDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagDataDTOToJson(
      this,
    );
  }
}

abstract class _TagDataDTO extends TagDataDTO {
  factory _TagDataDTO(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'tag_name') final String name,
      final String? status,
      final String? sort}) = _$_TagDataDTO;
  _TagDataDTO._() : super._();

  factory _TagDataDTO.fromJson(Map<String, dynamic> json) =
      _$_TagDataDTO.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'tag_name')
  String get name;
  @override
  String? get status;
  @override
  String? get sort;
  @override
  @JsonKey(ignore: true)
  _$$_TagDataDTOCopyWith<_$_TagDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
