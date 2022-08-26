// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'form_fetch_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormFetchState {
  FormFetchStateStatus get status => throw _privateConstructorUsedError;
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  List<TagModel> get tags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormFetchStateCopyWith<FormFetchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormFetchStateCopyWith<$Res> {
  factory $FormFetchStateCopyWith(
          FormFetchState value, $Res Function(FormFetchState) then) =
      _$FormFetchStateCopyWithImpl<$Res>;
  $Res call(
      {FormFetchStateStatus status,
      List<CategoryModel> categories,
      List<TagModel> tags});
}

/// @nodoc
class _$FormFetchStateCopyWithImpl<$Res>
    implements $FormFetchStateCopyWith<$Res> {
  _$FormFetchStateCopyWithImpl(this._value, this._then);

  final FormFetchState _value;
  // ignore: unused_field
  final $Res Function(FormFetchState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? categories = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormFetchStateStatus,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_FormFetchStateCopyWith<$Res>
    implements $FormFetchStateCopyWith<$Res> {
  factory _$$_FormFetchStateCopyWith(
          _$_FormFetchState value, $Res Function(_$_FormFetchState) then) =
      __$$_FormFetchStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {FormFetchStateStatus status,
      List<CategoryModel> categories,
      List<TagModel> tags});
}

/// @nodoc
class __$$_FormFetchStateCopyWithImpl<$Res>
    extends _$FormFetchStateCopyWithImpl<$Res>
    implements _$$_FormFetchStateCopyWith<$Res> {
  __$$_FormFetchStateCopyWithImpl(
      _$_FormFetchState _value, $Res Function(_$_FormFetchState) _then)
      : super(_value, (v) => _then(v as _$_FormFetchState));

  @override
  _$_FormFetchState get _value => super._value as _$_FormFetchState;

  @override
  $Res call({
    Object? status = freezed,
    Object? categories = freezed,
    Object? tags = freezed,
  }) {
    return _then(_$_FormFetchState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormFetchStateStatus,
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagModel>,
    ));
  }
}

/// @nodoc

class _$_FormFetchState implements _FormFetchState {
  const _$_FormFetchState(
      {required this.status,
      required final List<CategoryModel> categories,
      required final List<TagModel> tags})
      : _categories = categories,
        _tags = tags;

  @override
  final FormFetchStateStatus status;
  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<TagModel> _tags;
  @override
  List<TagModel> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'FormFetchState(status: $status, categories: $categories, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormFetchState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  _$$_FormFetchStateCopyWith<_$_FormFetchState> get copyWith =>
      __$$_FormFetchStateCopyWithImpl<_$_FormFetchState>(this, _$identity);
}

abstract class _FormFetchState implements FormFetchState {
  const factory _FormFetchState(
      {required final FormFetchStateStatus status,
      required final List<CategoryModel> categories,
      required final List<TagModel> tags}) = _$_FormFetchState;

  @override
  FormFetchStateStatus get status;
  @override
  List<CategoryModel> get categories;
  @override
  List<TagModel> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_FormFetchStateCopyWith<_$_FormFetchState> get copyWith =>
      throw _privateConstructorUsedError;
}
