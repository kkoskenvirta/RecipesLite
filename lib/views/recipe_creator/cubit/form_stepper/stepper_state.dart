part of 'stepper_cubit.dart';

enum StepperItem { details, incredients, classification, review }

@freezed
class StepperState with _$StepperState {
  const factory StepperState({
    required StepperItem stepperItem,
    required int index,
  }) = _StepperState;

  factory StepperState.initial() {
    return const StepperState(
      stepperItem: StepperItem.review,
      index: 3,
    );
  }
}
