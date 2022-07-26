// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'incredient_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryDataDTO _$CategoryDataDTOFromJson(Map<String, dynamic> json) {
  return _CategoryDataDTO.fromJson(json);
}

/// @nodoc
mixin _$CategoryDataDTO {
  @JsonKey(name: 'category_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_picture')
  String get picture => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_icon')
  String get icon => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get sort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryDataDTOCopyWith<CategoryDataDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDataDTOCopyWith<$Res> {
  factory $CategoryDataDTOCopyWith(CategoryDataDTO value, $Res Function(CategoryDataDTO) then) =
      _$CategoryDataDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'category_id') String id,
      @JsonKey(name: 'category_name') String name,
      @JsonKey(name: 'category_picture') String picture,
      @JsonKey(name: 'category_icon') String icon,
      String? status,
      String? sort});
}

/// @nodoc
class _$CategoryDataDTOCopyWithImpl<$Res> implements $CategoryDataDTOCopyWith<$Res> {
  _$CategoryDataDTOCopyWithImpl(this._value, this._then);

  final CategoryDataDTO _value;
  // ignore: unused_field
  final $Res Function(CategoryDataDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? picture = freezed,
    Object? icon = freezed,
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
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_CategoryDataDTOCopyWith<$Res> implements $CategoryDataDTOCopyWith<$Res> {
  factory _$$_CategoryDataDTOCopyWith(_$_CategoryDataDTO value, $Res Function(_$_CategoryDataDTO) then) =
      __$$_CategoryDataDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'category_id') String id,
      @JsonKey(name: 'category_name') String name,
      @JsonKey(name: 'category_picture') String picture,
      @JsonKey(name: 'category_icon') String icon,
      String? status,
      String? sort});
}

/// @nodoc
class __$$_CategoryDataDTOCopyWithImpl<$Res> extends _$CategoryDataDTOCopyWithImpl<$Res>
    implements _$$_CategoryDataDTOCopyWith<$Res> {
  __$$_CategoryDataDTOCopyWithImpl(_$_CategoryDataDTO _value, $Res Function(_$_CategoryDataDTO) _then)
      : super(_value, (v) => _then(v as _$_CategoryDataDTO));

  @override
  _$_CategoryDataDTO get _value => super._value as _$_CategoryDataDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? picture = freezed,
    Object? icon = freezed,
    Object? status = freezed,
    Object? sort = freezed,
  }) {
    return _then(_$_CategoryDataDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
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
class _$_CategoryDataDTO extends _CategoryDataDTO {
  _$_CategoryDataDTO(
      {@JsonKey(name: 'category_id') required this.id,
      @JsonKey(name: 'category_name') this.name = '',
      @JsonKey(name: 'category_picture') this.picture = '',
      @JsonKey(name: 'category_icon') this.icon = '',
      this.status,
      this.sort})
      : super._();

  factory _$_CategoryDataDTO.fromJson(Map<String, dynamic> json) => _$$_CategoryDataDTOFromJson(json);

  @override
  @JsonKey(name: 'category_id')
  final String id;
  @override
  @JsonKey(name: 'category_name')
  final String name;
  @override
  @JsonKey(name: 'category_picture')
  final String picture;
  @override
  @JsonKey(name: 'category_icon')
  final String icon;
  @override
  final String? status;
  @override
  final String? sort;

  @override
  String toString() {
    return 'CategoryDataDTO(id: $id, name: $name, picture: $picture, icon: $icon, status: $status, sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryDataDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.picture, picture) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.sort, sort));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(picture),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(sort));

  @JsonKey(ignore: true)
  @override
  _$$_CategoryDataDTOCopyWith<_$_CategoryDataDTO> get copyWith =>
      __$$_CategoryDataDTOCopyWithImpl<_$_CategoryDataDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryDataDTOToJson(
      this,
    );
  }
}

abstract class _CategoryDataDTO extends CategoryDataDTO {
  factory _CategoryDataDTO(
      {@JsonKey(name: 'category_id') required final String id,
      @JsonKey(name: 'category_name') final String name,
      @JsonKey(name: 'category_picture') final String picture,
      @JsonKey(name: 'category_icon') final String icon,
      final String? status,
      final String? sort}) = _$_CategoryDataDTO;
  _CategoryDataDTO._() : super._();

  factory _CategoryDataDTO.fromJson(Map<String, dynamic> json) = _$_CategoryDataDTO.fromJson;

  @override
  @JsonKey(name: 'category_id')
  String get id;
  @override
  @JsonKey(name: 'category_name')
  String get name;
  @override
  @JsonKey(name: 'category_picture')
  String get picture;
  @override
  @JsonKey(name: 'category_icon')
  String get icon;
  @override
  String? get status;
  @override
  String? get sort;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryDataDTOCopyWith<_$_CategoryDataDTO> get copyWith => throw _privateConstructorUsedError;
}
