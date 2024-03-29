// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagModel _$TagModelFromJson(Map<String, dynamic> json) {
  return _TagModel.fromJson(json);
}

/// @nodoc
mixin _$TagModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get relationId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get sort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagModelCopyWith<TagModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagModelCopyWith<$Res> {
  factory $TagModelCopyWith(TagModel value, $Res Function(TagModel) then) =
      _$TagModelCopyWithImpl<$Res>;
  $Res call(
      {String id, String name, int? relationId, String? status, String? sort});
}

/// @nodoc
class _$TagModelCopyWithImpl<$Res> implements $TagModelCopyWith<$Res> {
  _$TagModelCopyWithImpl(this._value, this._then);

  final TagModel _value;
  // ignore: unused_field
  final $Res Function(TagModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? relationId = freezed,
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
      relationId: relationId == freezed
          ? _value.relationId
          : relationId // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$_TagModelCopyWith<$Res> implements $TagModelCopyWith<$Res> {
  factory _$$_TagModelCopyWith(
          _$_TagModel value, $Res Function(_$_TagModel) then) =
      __$$_TagModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String name, int? relationId, String? status, String? sort});
}

/// @nodoc
class __$$_TagModelCopyWithImpl<$Res> extends _$TagModelCopyWithImpl<$Res>
    implements _$$_TagModelCopyWith<$Res> {
  __$$_TagModelCopyWithImpl(
      _$_TagModel _value, $Res Function(_$_TagModel) _then)
      : super(_value, (v) => _then(v as _$_TagModel));

  @override
  _$_TagModel get _value => super._value as _$_TagModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? relationId = freezed,
    Object? status = freezed,
    Object? sort = freezed,
  }) {
    return _then(_$_TagModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      relationId: relationId == freezed
          ? _value.relationId
          : relationId // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$_TagModel extends _TagModel {
  _$_TagModel(
      {required this.id,
      required this.name,
      this.relationId,
      this.status,
      this.sort})
      : super._();

  factory _$_TagModel.fromJson(Map<String, dynamic> json) =>
      _$$_TagModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int? relationId;
  @override
  final String? status;
  @override
  final String? sort;

  @override
  String toString() {
    return 'TagModel(id: $id, name: $name, relationId: $relationId, status: $status, sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.relationId, relationId) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.sort, sort));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(relationId),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(sort));

  @JsonKey(ignore: true)
  @override
  _$$_TagModelCopyWith<_$_TagModel> get copyWith =>
      __$$_TagModelCopyWithImpl<_$_TagModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagModelToJson(
      this,
    );
  }
}

abstract class _TagModel extends TagModel {
  factory _TagModel(
      {required final String id,
      required final String name,
      final int? relationId,
      final String? status,
      final String? sort}) = _$_TagModel;
  _TagModel._() : super._();

  factory _TagModel.fromJson(Map<String, dynamic> json) = _$_TagModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int? get relationId;
  @override
  String? get status;
  @override
  String? get sort;
  @override
  @JsonKey(ignore: true)
  _$$_TagModelCopyWith<_$_TagModel> get copyWith =>
      throw _privateConstructorUsedError;
}
