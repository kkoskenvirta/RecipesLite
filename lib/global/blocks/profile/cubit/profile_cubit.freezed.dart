// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileState {
  ProfileStateStatus get status => throw _privateConstructorUsedError;
  DirectusUser? get currUser => throw _privateConstructorUsedError;
  List<FavoriteModel> get favorites => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res>;
  $Res call(
      {ProfileStateStatus status,
      DirectusUser? currUser,
      List<FavoriteModel> favorites});
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res> implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  final ProfileState _value;
  // ignore: unused_field
  final $Res Function(ProfileState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? currUser = freezed,
    Object? favorites = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProfileStateStatus,
      currUser: currUser == freezed
          ? _value.currUser
          : currUser // ignore: cast_nullable_to_non_nullable
              as DirectusUser?,
      favorites: favorites == freezed
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<FavoriteModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_ProfileStateCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$_ProfileStateCopyWith(
          _$_ProfileState value, $Res Function(_$_ProfileState) then) =
      __$$_ProfileStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ProfileStateStatus status,
      DirectusUser? currUser,
      List<FavoriteModel> favorites});
}

/// @nodoc
class __$$_ProfileStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res>
    implements _$$_ProfileStateCopyWith<$Res> {
  __$$_ProfileStateCopyWithImpl(
      _$_ProfileState _value, $Res Function(_$_ProfileState) _then)
      : super(_value, (v) => _then(v as _$_ProfileState));

  @override
  _$_ProfileState get _value => super._value as _$_ProfileState;

  @override
  $Res call({
    Object? status = freezed,
    Object? currUser = freezed,
    Object? favorites = freezed,
  }) {
    return _then(_$_ProfileState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProfileStateStatus,
      currUser: currUser == freezed
          ? _value.currUser
          : currUser // ignore: cast_nullable_to_non_nullable
              as DirectusUser?,
      favorites: favorites == freezed
          ? _value._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<FavoriteModel>,
    ));
  }
}

/// @nodoc

class _$_ProfileState with DiagnosticableTreeMixin implements _ProfileState {
  const _$_ProfileState(
      {required this.status,
      required this.currUser,
      required final List<FavoriteModel> favorites})
      : _favorites = favorites;

  @override
  final ProfileStateStatus status;
  @override
  final DirectusUser? currUser;
  final List<FavoriteModel> _favorites;
  @override
  List<FavoriteModel> get favorites {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileState(status: $status, currUser: $currUser, favorites: $favorites)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('currUser', currUser))
      ..add(DiagnosticsProperty('favorites', favorites));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.currUser, currUser) &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(currUser),
      const DeepCollectionEquality().hash(_favorites));

  @JsonKey(ignore: true)
  @override
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      __$$_ProfileStateCopyWithImpl<_$_ProfileState>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {required final ProfileStateStatus status,
      required final DirectusUser? currUser,
      required final List<FavoriteModel> favorites}) = _$_ProfileState;

  @override
  ProfileStateStatus get status => throw _privateConstructorUsedError;
  @override
  DirectusUser? get currUser => throw _privateConstructorUsedError;
  @override
  List<FavoriteModel> get favorites => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
