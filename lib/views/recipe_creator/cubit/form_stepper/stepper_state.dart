part of 'stepper_cubit.dart';

enum StepperItem { start, photos, classification, review }

@freezed
class StepperState with _$StepperState {
  const factory StepperState({
    required StepperItem stepperItem,
    required int index,
  }) = _StepperState;

  factory StepperState.initial() {
    return const StepperState(
      stepperItem: StepperItem.start,
      index: 0,
    );
  }
}
