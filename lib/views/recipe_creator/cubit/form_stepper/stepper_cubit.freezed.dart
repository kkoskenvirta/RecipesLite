// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stepper_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StepperState {
  StepperItem get stepperItem => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StepperStateCopyWith<StepperState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepperStateCopyWith<$Res> {
  factory $StepperStateCopyWith(
          StepperState value, $Res Function(StepperState) then) =
      _$StepperStateCopyWithImpl<$Res>;
  $Res call({StepperItem stepperItem, int index});
}

/// @nodoc
class _$StepperStateCopyWithImpl<$Res> implements $StepperStateCopyWith<$Res> {
  _$StepperStateCopyWithImpl(this._value, this._then);

  final StepperState _value;
  // ignore: unused_field
  final $Res Function(StepperState) _then;

  @override
  $Res call({
    Object? stepperItem = freezed,
    Object? index = freezed,
  }) {
    return _then(_value.copyWith(
      stepperItem: stepperItem == freezed
          ? _value.stepperItem
          : stepperItem // ignore: cast_nullable_to_non_nullable
              as StepperItem,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_StepperStateCopyWith<$Res>
    implements $StepperStateCopyWith<$Res> {
  factory _$$_StepperStateCopyWith(
          _$_StepperState value, $Res Function(_$_StepperState) then) =
      __$$_StepperStateCopyWithImpl<$Res>;
  @override
  $Res call({StepperItem stepperItem, int index});
}

/// @nodoc
class __$$_StepperStateCopyWithImpl<$Res>
    extends _$StepperStateCopyWithImpl<$Res>
    implements _$$_StepperStateCopyWith<$Res> {
  __$$_StepperStateCopyWithImpl(
      _$_StepperState _value, $Res Function(_$_StepperState) _then)
      : super(_value, (v) => _then(v as _$_StepperState));

  @override
  _$_StepperState get _value => super._value as _$_StepperState;

  @override
  $Res call({
    Object? stepperItem = freezed,
    Object? index = freezed,
  }) {
    return _then(_$_StepperState(
      stepperItem: stepperItem == freezed
          ? _value.stepperItem
          : stepperItem // ignore: cast_nullable_to_non_nullable
              as StepperItem,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_StepperState with DiagnosticableTreeMixin implements _StepperState {
  const _$_StepperState({required this.stepperItem, required this.index});

  @override
  final StepperItem stepperItem;
  @override
  final int index;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StepperState(stepperItem: $stepperItem, index: $index)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StepperState'))
      ..add(DiagnosticsProperty('stepperItem', stepperItem))
      ..add(DiagnosticsProperty('index', index));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StepperState &&
            const DeepCollectionEquality()
                .equals(other.stepperItem, stepperItem) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stepperItem),
      const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$_StepperStateCopyWith<_$_StepperState> get copyWith =>
      __$$_StepperStateCopyWithImpl<_$_StepperState>(this, _$identity);
}

abstract class _StepperState implements StepperState {
  const factory _StepperState(
      {required final StepperItem stepperItem,
      required final int index}) = _$_StepperState;

  @override
  StepperItem get stepperItem;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_StepperStateCopyWith<_$_StepperState> get copyWith =>
      throw _privateConstructorUsedError;
}
