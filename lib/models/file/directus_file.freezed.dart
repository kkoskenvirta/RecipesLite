// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'directus_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DirectusFile {
  String? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DirectusFileCopyWith<DirectusFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectusFileCopyWith<$Res> {
  factory $DirectusFileCopyWith(
          DirectusFile value, $Res Function(DirectusFile) then) =
      _$DirectusFileCopyWithImpl<$Res>;
  $Res call({String? id});
}

/// @nodoc
class _$DirectusFileCopyWithImpl<$Res> implements $DirectusFileCopyWith<$Res> {
  _$DirectusFileCopyWithImpl(this._value, this._then);

  final DirectusFile _value;
  // ignore: unused_field
  final $Res Function(DirectusFile) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_DirectusFileCopyWith<$Res>
    implements $DirectusFileCopyWith<$Res> {
  factory _$$_DirectusFileCopyWith(
          _$_DirectusFile value, $Res Function(_$_DirectusFile) then) =
      __$$_DirectusFileCopyWithImpl<$Res>;
  @override
  $Res call({String? id});
}

/// @nodoc
class __$$_DirectusFileCopyWithImpl<$Res>
    extends _$DirectusFileCopyWithImpl<$Res>
    implements _$$_DirectusFileCopyWith<$Res> {
  __$$_DirectusFileCopyWithImpl(
      _$_DirectusFile _value, $Res Function(_$_DirectusFile) _then)
      : super(_value, (v) => _then(v as _$_DirectusFile));

  @override
  _$_DirectusFile get _value => super._value as _$_DirectusFile;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_DirectusFile(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DirectusFile implements _DirectusFile {
  _$_DirectusFile({this.id});

  @override
  final String? id;

  @override
  String toString() {
    return 'DirectusFile(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DirectusFile &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_DirectusFileCopyWith<_$_DirectusFile> get copyWith =>
      __$$_DirectusFileCopyWithImpl<_$_DirectusFile>(this, _$identity);
}

abstract class _DirectusFile implements DirectusFile {
  factory _DirectusFile({final String? id}) = _$_DirectusFile;

  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_DirectusFileCopyWith<_$_DirectusFile> get copyWith =>
      throw _privateConstructorUsedError;
}
