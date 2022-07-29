// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_fetch_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecipeFetchState {
  RecipeFetchStateStatus get status => throw _privateConstructorUsedError;
  RecipeFetchStateStatus get popularStatus =>
      throw _privateConstructorUsedError;
  RecipeFetchStateStatus get featuredStatus =>
      throw _privateConstructorUsedError;
  List<RecipeModel> get popular => throw _privateConstructorUsedError;
  List<RecipeModel> get featured => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeFetchStateCopyWith<RecipeFetchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeFetchStateCopyWith<$Res> {
  factory $RecipeFetchStateCopyWith(
          RecipeFetchState value, $Res Function(RecipeFetchState) then) =
      _$RecipeFetchStateCopyWithImpl<$Res>;
  $Res call(
      {RecipeFetchStateStatus status,
      RecipeFetchStateStatus popularStatus,
      RecipeFetchStateStatus featuredStatus,
      List<RecipeModel> popular,
      List<RecipeModel> featured});
}

/// @nodoc
class _$RecipeFetchStateCopyWithImpl<$Res>
    implements $RecipeFetchStateCopyWith<$Res> {
  _$RecipeFetchStateCopyWithImpl(this._value, this._then);

  final RecipeFetchState _value;
  // ignore: unused_field
  final $Res Function(RecipeFetchState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? popularStatus = freezed,
    Object? featuredStatus = freezed,
    Object? popular = freezed,
    Object? featured = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RecipeFetchStateStatus,
      popularStatus: popularStatus == freezed
          ? _value.popularStatus
          : popularStatus // ignore: cast_nullable_to_non_nullable
              as RecipeFetchStateStatus,
      featuredStatus: featuredStatus == freezed
          ? _value.featuredStatus
          : featuredStatus // ignore: cast_nullable_to_non_nullable
              as RecipeFetchStateStatus,
      popular: popular == freezed
          ? _value.popular
          : popular // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>,
      featured: featured == freezed
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_RecipeFetchStateCopyWith<$Res>
    implements $RecipeFetchStateCopyWith<$Res> {
  factory _$$_RecipeFetchStateCopyWith(
          _$_RecipeFetchState value, $Res Function(_$_RecipeFetchState) then) =
      __$$_RecipeFetchStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {RecipeFetchStateStatus status,
      RecipeFetchStateStatus popularStatus,
      RecipeFetchStateStatus featuredStatus,
      List<RecipeModel> popular,
      List<RecipeModel> featured});
}

/// @nodoc
class __$$_RecipeFetchStateCopyWithImpl<$Res>
    extends _$RecipeFetchStateCopyWithImpl<$Res>
    implements _$$_RecipeFetchStateCopyWith<$Res> {
  __$$_RecipeFetchStateCopyWithImpl(
      _$_RecipeFetchState _value, $Res Function(_$_RecipeFetchState) _then)
      : super(_value, (v) => _then(v as _$_RecipeFetchState));

  @override
  _$_RecipeFetchState get _value => super._value as _$_RecipeFetchState;

  @override
  $Res call({
    Object? status = freezed,
    Object? popularStatus = freezed,
    Object? featuredStatus = freezed,
    Object? popular = freezed,
    Object? featured = freezed,
  }) {
    return _then(_$_RecipeFetchState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RecipeFetchStateStatus,
      popularStatus: popularStatus == freezed
          ? _value.popularStatus
          : popularStatus // ignore: cast_nullable_to_non_nullable
              as RecipeFetchStateStatus,
      featuredStatus: featuredStatus == freezed
          ? _value.featuredStatus
          : featuredStatus // ignore: cast_nullable_to_non_nullable
              as RecipeFetchStateStatus,
      popular: popular == freezed
          ? _value._popular
          : popular // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>,
      featured: featured == freezed
          ? _value._featured
          : featured // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>,
    ));
  }
}

/// @nodoc

class _$_RecipeFetchState implements _RecipeFetchState {
  const _$_RecipeFetchState(
      {required this.status,
      required this.popularStatus,
      required this.featuredStatus,
      required final List<RecipeModel> popular,
      required final List<RecipeModel> featured})
      : _popular = popular,
        _featured = featured;

  @override
  final RecipeFetchStateStatus status;
  @override
  final RecipeFetchStateStatus popularStatus;
  @override
  final RecipeFetchStateStatus featuredStatus;
  final List<RecipeModel> _popular;
  @override
  List<RecipeModel> get popular {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popular);
  }

  final List<RecipeModel> _featured;
  @override
  List<RecipeModel> get featured {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_featured);
  }

  @override
  String toString() {
    return 'RecipeFetchState(status: $status, popularStatus: $popularStatus, featuredStatus: $featuredStatus, popular: $popular, featured: $featured)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeFetchState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.popularStatus, popularStatus) &&
            const DeepCollectionEquality()
                .equals(other.featuredStatus, featuredStatus) &&
            const DeepCollectionEquality().equals(other._popular, _popular) &&
            const DeepCollectionEquality().equals(other._featured, _featured));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(popularStatus),
      const DeepCollectionEquality().hash(featuredStatus),
      const DeepCollectionEquality().hash(_popular),
      const DeepCollectionEquality().hash(_featured));

  @JsonKey(ignore: true)
  @override
  _$$_RecipeFetchStateCopyWith<_$_RecipeFetchState> get copyWith =>
      __$$_RecipeFetchStateCopyWithImpl<_$_RecipeFetchState>(this, _$identity);
}

abstract class _RecipeFetchState implements RecipeFetchState {
  const factory _RecipeFetchState(
      {required final RecipeFetchStateStatus status,
      required final RecipeFetchStateStatus popularStatus,
      required final RecipeFetchStateStatus featuredStatus,
      required final List<RecipeModel> popular,
      required final List<RecipeModel> featured}) = _$_RecipeFetchState;

  @override
  RecipeFetchStateStatus get status;
  @override
  RecipeFetchStateStatus get popularStatus;
  @override
  RecipeFetchStateStatus get featuredStatus;
  @override
  List<RecipeModel> get popular;
  @override
  List<RecipeModel> get featured;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeFetchStateCopyWith<_$_RecipeFetchState> get copyWith =>
      throw _privateConstructorUsedError;
}
