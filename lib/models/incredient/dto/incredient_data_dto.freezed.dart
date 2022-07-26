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

IncredientDataDTO _$IncredientDataDTOFromJson(Map<String, dynamic> json) {
  return _IncredientDataDTO.fromJson(json);
}

/// @nodoc
mixin _$IncredientDataDTO {
  @JsonKey(name: 'incredient_id')
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get sort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncredientDataDTOCopyWith<IncredientDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncredientDataDTOCopyWith<$Res> {
  factory $IncredientDataDTOCopyWith(
          IncredientDataDTO value, $Res Function(IncredientDataDTO) then) =
      _$IncredientDataDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'incredient_id') String? id,
      String name,
      double? amount,
      String unit,
      String? status,
      String? sort});
}

/// @nodoc
class _$IncredientDataDTOCopyWithImpl<$Res>
    implements $IncredientDataDTOCopyWith<$Res> {
  _$IncredientDataDTOCopyWithImpl(this._value, this._then);

  final IncredientDataDTO _value;
  // ignore: unused_field
  final $Res Function(IncredientDataDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? unit = freezed,
    Object? status = freezed,
    Object? sort = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_IncredientDataDTOCopyWith<$Res>
    implements $IncredientDataDTOCopyWith<$Res> {
  factory _$$_IncredientDataDTOCopyWith(_$_IncredientDataDTO value,
          $Res Function(_$_IncredientDataDTO) then) =
      __$$_IncredientDataDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'incredient_id') String? id,
      String name,
      double? amount,
      String unit,
      String? status,
      String? sort});
}

/// @nodoc
class __$$_IncredientDataDTOCopyWithImpl<$Res>
    extends _$IncredientDataDTOCopyWithImpl<$Res>
    implements _$$_IncredientDataDTOCopyWith<$Res> {
  __$$_IncredientDataDTOCopyWithImpl(
      _$_IncredientDataDTO _value, $Res Function(_$_IncredientDataDTO) _then)
      : super(_value, (v) => _then(v as _$_IncredientDataDTO));

  @override
  _$_IncredientDataDTO get _value => super._value as _$_IncredientDataDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? unit = freezed,
    Object? status = freezed,
    Object? sort = freezed,
  }) {
    return _then(_$_IncredientDataDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
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
class _$_IncredientDataDTO extends _IncredientDataDTO {
  _$_IncredientDataDTO(
      {@JsonKey(name: 'incredient_id') this.id,
      this.name = '',
      this.amount,
      this.unit = 'gram',
      this.status,
      this.sort})
      : super._();

  factory _$_IncredientDataDTO.fromJson(Map<String, dynamic> json) =>
      _$$_IncredientDataDTOFromJson(json);

  @override
  @JsonKey(name: 'incredient_id')
  final String? id;
  @override
  @JsonKey()
  final String name;
  @override
  final double? amount;
  @override
  @JsonKey()
  final String unit;
  @override
  final String? status;
  @override
  final String? sort;

  @override
  String toString() {
    return 'IncredientDataDTO(id: $id, name: $name, amount: $amount, unit: $unit, status: $status, sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IncredientDataDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.unit, unit) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.sort, sort));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(unit),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(sort));

  @JsonKey(ignore: true)
  @override
  _$$_IncredientDataDTOCopyWith<_$_IncredientDataDTO> get copyWith =>
      __$$_IncredientDataDTOCopyWithImpl<_$_IncredientDataDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IncredientDataDTOToJson(
      this,
    );
  }
}

abstract class _IncredientDataDTO extends IncredientDataDTO {
  factory _IncredientDataDTO(
      {@JsonKey(name: 'incredient_id') final String? id,
      final String name,
      final double? amount,
      final String unit,
      final String? status,
      final String? sort}) = _$_IncredientDataDTO;
  _IncredientDataDTO._() : super._();

  factory _IncredientDataDTO.fromJson(Map<String, dynamic> json) =
      _$_IncredientDataDTO.fromJson;

  @override
  @JsonKey(name: 'incredient_id')
  String? get id;
  @override
  String get name;
  @override
  double? get amount;
  @override
  String get unit;
  @override
  String? get status;
  @override
  String? get sort;
  @override
  @JsonKey(ignore: true)
  _$$_IncredientDataDTOCopyWith<_$_IncredientDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
