// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationState {
  NavBarItem get navBarItem => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get currentPath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationStateCopyWith<NavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res>;
  $Res call(
      {NavBarItem navBarItem, int index, String title, String? currentPath});
}

/// @nodoc
class _$NavigationStateCopyWithImpl<$Res>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  final NavigationState _value;
  // ignore: unused_field
  final $Res Function(NavigationState) _then;

  @override
  $Res call({
    Object? navBarItem = freezed,
    Object? index = freezed,
    Object? title = freezed,
    Object? currentPath = freezed,
  }) {
    return _then(_value.copyWith(
      navBarItem: navBarItem == freezed
          ? _value.navBarItem
          : navBarItem // ignore: cast_nullable_to_non_nullable
              as NavBarItem,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      currentPath: currentPath == freezed
          ? _value.currentPath
          : currentPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_NavigationStateCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$$_NavigationStateCopyWith(
          _$_NavigationState value, $Res Function(_$_NavigationState) then) =
      __$$_NavigationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {NavBarItem navBarItem, int index, String title, String? currentPath});
}

/// @nodoc
class __$$_NavigationStateCopyWithImpl<$Res>
    extends _$NavigationStateCopyWithImpl<$Res>
    implements _$$_NavigationStateCopyWith<$Res> {
  __$$_NavigationStateCopyWithImpl(
      _$_NavigationState _value, $Res Function(_$_NavigationState) _then)
      : super(_value, (v) => _then(v as _$_NavigationState));

  @override
  _$_NavigationState get _value => super._value as _$_NavigationState;

  @override
  $Res call({
    Object? navBarItem = freezed,
    Object? index = freezed,
    Object? title = freezed,
    Object? currentPath = freezed,
  }) {
    return _then(_$_NavigationState(
      navBarItem: navBarItem == freezed
          ? _value.navBarItem
          : navBarItem // ignore: cast_nullable_to_non_nullable
              as NavBarItem,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      currentPath: currentPath == freezed
          ? _value.currentPath
          : currentPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_NavigationState
    with DiagnosticableTreeMixin
    implements _NavigationState {
  const _$_NavigationState(
      {required this.navBarItem,
      required this.index,
      required this.title,
      required this.currentPath});

  @override
  final NavBarItem navBarItem;
  @override
  final int index;
  @override
  final String title;
  @override
  final String? currentPath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NavigationState(navBarItem: $navBarItem, index: $index, title: $title, currentPath: $currentPath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NavigationState'))
      ..add(DiagnosticsProperty('navBarItem', navBarItem))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('currentPath', currentPath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NavigationState &&
            const DeepCollectionEquality()
                .equals(other.navBarItem, navBarItem) &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.currentPath, currentPath));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(navBarItem),
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(currentPath));

  @JsonKey(ignore: true)
  @override
  _$$_NavigationStateCopyWith<_$_NavigationState> get copyWith =>
      __$$_NavigationStateCopyWithImpl<_$_NavigationState>(this, _$identity);
}

abstract class _NavigationState implements NavigationState {
  const factory _NavigationState(
      {required final NavBarItem navBarItem,
      required final int index,
      required final String title,
      required final String? currentPath}) = _$_NavigationState;

  @override
  NavBarItem get navBarItem;
  @override
  int get index;
  @override
  String get title;
  @override
  String? get currentPath;
  @override
  @JsonKey(ignore: true)
  _$$_NavigationStateCopyWith<_$_NavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}
