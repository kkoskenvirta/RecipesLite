// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'relation_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RelationDetails _$RelationDetailsFromJson(Map<String, dynamic> json) {
  return _RelationDetails.fromJson(json);
}

/// @nodoc
mixin _$RelationDetails {
  List<dynamic> get create => throw _privateConstructorUsedError;
  List<dynamic> get update => throw _privateConstructorUsedError;
  List<dynamic> get delete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RelationDetailsCopyWith<RelationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationDetailsCopyWith<$Res> {
  factory $RelationDetailsCopyWith(
          RelationDetails value, $Res Function(RelationDetails) then) =
      _$RelationDetailsCopyWithImpl<$Res>;
  $Res call({List<dynamic> create, List<dynamic> update, List<dynamic> delete});
}

/// @nodoc
class _$RelationDetailsCopyWithImpl<$Res>
    implements $RelationDetailsCopyWith<$Res> {
  _$RelationDetailsCopyWithImpl(this._value, this._then);

  final RelationDetails _value;
  // ignore: unused_field
  final $Res Function(RelationDetails) _then;

  @override
  $Res call({
    Object? create = freezed,
    Object? update = freezed,
    Object? delete = freezed,
  }) {
    return _then(_value.copyWith(
      create: create == freezed
          ? _value.create
          : create // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      update: update == freezed
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      delete: delete == freezed
          ? _value.delete
          : delete // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$$_RelationDetailsCopyWith<$Res>
    implements $RelationDetailsCopyWith<$Res> {
  factory _$$_RelationDetailsCopyWith(
          _$_RelationDetails value, $Res Function(_$_RelationDetails) then) =
      __$$_RelationDetailsCopyWithImpl<$Res>;
  @override
  $Res call({List<dynamic> create, List<dynamic> update, List<dynamic> delete});
}

/// @nodoc
class __$$_RelationDetailsCopyWithImpl<$Res>
    extends _$RelationDetailsCopyWithImpl<$Res>
    implements _$$_RelationDetailsCopyWith<$Res> {
  __$$_RelationDetailsCopyWithImpl(
      _$_RelationDetails _value, $Res Function(_$_RelationDetails) _then)
      : super(_value, (v) => _then(v as _$_RelationDetails));

  @override
  _$_RelationDetails get _value => super._value as _$_RelationDetails;

  @override
  $Res call({
    Object? create = freezed,
    Object? update = freezed,
    Object? delete = freezed,
  }) {
    return _then(_$_RelationDetails(
      create: create == freezed
          ? _value._create
          : create // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      update: update == freezed
          ? _value._update
          : update // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      delete: delete == freezed
          ? _value._delete
          : delete // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RelationDetails extends _RelationDetails {
  _$_RelationDetails(
      {final List<dynamic> create = const [],
      final List<dynamic> update = const [],
      final List<dynamic> delete = const []})
      : _create = create,
        _update = update,
        _delete = delete,
        super._();

  factory _$_RelationDetails.fromJson(Map<String, dynamic> json) =>
      _$$_RelationDetailsFromJson(json);

  final List<dynamic> _create;
  @override
  @JsonKey()
  List<dynamic> get create {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_create);
  }

  final List<dynamic> _update;
  @override
  @JsonKey()
  List<dynamic> get update {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_update);
  }

  final List<dynamic> _delete;
  @override
  @JsonKey()
  List<dynamic> get delete {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_delete);
  }

  @override
  String toString() {
    return 'RelationDetails(create: $create, update: $update, delete: $delete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RelationDetails &&
            const DeepCollectionEquality().equals(other._create, _create) &&
            const DeepCollectionEquality().equals(other._update, _update) &&
            const DeepCollectionEquality().equals(other._delete, _delete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_create),
      const DeepCollectionEquality().hash(_update),
      const DeepCollectionEquality().hash(_delete));

  @JsonKey(ignore: true)
  @override
  _$$_RelationDetailsCopyWith<_$_RelationDetails> get copyWith =>
      __$$_RelationDetailsCopyWithImpl<_$_RelationDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RelationDetailsToJson(
      this,
    );
  }
}

abstract class _RelationDetails extends RelationDetails {
  factory _RelationDetails(
      {final List<dynamic> create,
      final List<dynamic> update,
      final List<dynamic> delete}) = _$_RelationDetails;
  _RelationDetails._() : super._();

  factory _RelationDetails.fromJson(Map<String, dynamic> json) =
      _$_RelationDetails.fromJson;

  @override
  List<dynamic> get create;
  @override
  List<dynamic> get update;
  @override
  List<dynamic> get delete;
  @override
  @JsonKey(ignore: true)
  _$$_RelationDetailsCopyWith<_$_RelationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
