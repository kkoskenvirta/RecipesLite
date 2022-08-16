// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_id_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryIdDTO _$CategoryIdDTOFromJson(Map<String, dynamic> json) {
  return _CategoryIdDTO.fromJson(json);
}

/// @nodoc
mixin _$CategoryIdDTO {
  @JsonKey(name: "id")
  int get relationId => throw _privateConstructorUsedError;
  @JsonKey(name: "category_id")
  CategoryDataDTO get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryIdDTOCopyWith<CategoryIdDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryIdDTOCopyWith<$Res> {
  factory $CategoryIdDTOCopyWith(
          CategoryIdDTO value, $Res Function(CategoryIdDTO) then) =
      _$CategoryIdDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") int relationId,
      @JsonKey(name: "category_id") CategoryDataDTO category});

  $CategoryDataDTOCopyWith<$Res> get category;
}

/// @nodoc
class _$CategoryIdDTOCopyWithImpl<$Res>
    implements $CategoryIdDTOCopyWith<$Res> {
  _$CategoryIdDTOCopyWithImpl(this._value, this._then);

  final CategoryIdDTO _value;
  // ignore: unused_field
  final $Res Function(CategoryIdDTO) _then;

  @override
  $Res call({
    Object? relationId = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      relationId: relationId == freezed
          ? _value.relationId
          : relationId // ignore: cast_nullable_to_non_nullable
              as int,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDataDTO,
    ));
  }

  @override
  $CategoryDataDTOCopyWith<$Res> get category {
    return $CategoryDataDTOCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc
abstract class _$$_CategoryIdDTOCopyWith<$Res>
    implements $CategoryIdDTOCopyWith<$Res> {
  factory _$$_CategoryIdDTOCopyWith(
          _$_CategoryIdDTO value, $Res Function(_$_CategoryIdDTO) then) =
      __$$_CategoryIdDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") int relationId,
      @JsonKey(name: "category_id") CategoryDataDTO category});

  @override
  $CategoryDataDTOCopyWith<$Res> get category;
}

/// @nodoc
class __$$_CategoryIdDTOCopyWithImpl<$Res>
    extends _$CategoryIdDTOCopyWithImpl<$Res>
    implements _$$_CategoryIdDTOCopyWith<$Res> {
  __$$_CategoryIdDTOCopyWithImpl(
      _$_CategoryIdDTO _value, $Res Function(_$_CategoryIdDTO) _then)
      : super(_value, (v) => _then(v as _$_CategoryIdDTO));

  @override
  _$_CategoryIdDTO get _value => super._value as _$_CategoryIdDTO;

  @override
  $Res call({
    Object? relationId = freezed,
    Object? category = freezed,
  }) {
    return _then(_$_CategoryIdDTO(
      relationId: relationId == freezed
          ? _value.relationId
          : relationId // ignore: cast_nullable_to_non_nullable
              as int,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDataDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryIdDTO extends _CategoryIdDTO {
  _$_CategoryIdDTO(
      {@JsonKey(name: "id") required this.relationId,
      @JsonKey(name: "category_id") required this.category})
      : super._();

  factory _$_CategoryIdDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryIdDTOFromJson(json);

  @override
  @JsonKey(name: "id")
  final int relationId;
  @override
  @JsonKey(name: "category_id")
  final CategoryDataDTO category;

  @override
  String toString() {
    return 'CategoryIdDTO(relationId: $relationId, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryIdDTO &&
            const DeepCollectionEquality()
                .equals(other.relationId, relationId) &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(relationId),
      const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$$_CategoryIdDTOCopyWith<_$_CategoryIdDTO> get copyWith =>
      __$$_CategoryIdDTOCopyWithImpl<_$_CategoryIdDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryIdDTOToJson(
      this,
    );
  }
}

abstract class _CategoryIdDTO extends CategoryIdDTO {
  factory _CategoryIdDTO(
      {@JsonKey(name: "id")
          required final int relationId,
      @JsonKey(name: "category_id")
          required final CategoryDataDTO category}) = _$_CategoryIdDTO;
  _CategoryIdDTO._() : super._();

  factory _CategoryIdDTO.fromJson(Map<String, dynamic> json) =
      _$_CategoryIdDTO.fromJson;

  @override
  @JsonKey(name: "id")
  int get relationId;
  @override
  @JsonKey(name: "category_id")
  CategoryDataDTO get category;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryIdDTOCopyWith<_$_CategoryIdDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
