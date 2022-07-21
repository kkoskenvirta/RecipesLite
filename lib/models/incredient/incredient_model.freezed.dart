// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'incredient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IncredientModel _$IncredientModelFromJson(Map<String, dynamic> json) {
  return _IncredientModel.fromJson(json);
}

/// @nodoc
mixin _$IncredientModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncredientModelCopyWith<IncredientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncredientModelCopyWith<$Res> {
  factory $IncredientModelCopyWith(
          IncredientModel value, $Res Function(IncredientModel) then) =
      _$IncredientModelCopyWithImpl<$Res>;
  $Res call({String? id, String? name, double? amount, String? unit});
}

/// @nodoc
class _$IncredientModelCopyWithImpl<$Res>
    implements $IncredientModelCopyWith<$Res> {
  _$IncredientModelCopyWithImpl(this._value, this._then);

  final IncredientModel _value;
  // ignore: unused_field
  final $Res Function(IncredientModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? unit = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_IncredientModelCopyWith<$Res>
    implements $IncredientModelCopyWith<$Res> {
  factory _$$_IncredientModelCopyWith(
          _$_IncredientModel value, $Res Function(_$_IncredientModel) then) =
      __$$_IncredientModelCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? name, double? amount, String? unit});
}

/// @nodoc
class __$$_IncredientModelCopyWithImpl<$Res>
    extends _$IncredientModelCopyWithImpl<$Res>
    implements _$$_IncredientModelCopyWith<$Res> {
  __$$_IncredientModelCopyWithImpl(
      _$_IncredientModel _value, $Res Function(_$_IncredientModel) _then)
      : super(_value, (v) => _then(v as _$_IncredientModel));

  @override
  _$_IncredientModel get _value => super._value as _$_IncredientModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$_IncredientModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IncredientModel extends _IncredientModel {
  _$_IncredientModel({this.id, this.name, this.amount, this.unit}) : super._();

  factory _$_IncredientModel.fromJson(Map<String, dynamic> json) =>
      _$$_IncredientModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final double? amount;
  @override
  final String? unit;

  @override
  String toString() {
    return 'IncredientModel(id: $id, name: $name, amount: $amount, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IncredientModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.unit, unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(unit));

  @JsonKey(ignore: true)
  @override
  _$$_IncredientModelCopyWith<_$_IncredientModel> get copyWith =>
      __$$_IncredientModelCopyWithImpl<_$_IncredientModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IncredientModelToJson(
      this,
    );
  }
}

abstract class _IncredientModel extends IncredientModel {
  factory _IncredientModel(
      {final String? id,
      final String? name,
      final double? amount,
      final String? unit}) = _$_IncredientModel;
  _IncredientModel._() : super._();

  factory _IncredientModel.fromJson(Map<String, dynamic> json) =
      _$_IncredientModel.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  double? get amount;
  @override
  String? get unit;
  @override
  @JsonKey(ignore: true)
  _$$_IncredientModelCopyWith<_$_IncredientModel> get copyWith =>
      throw _privateConstructorUsedError;
}
