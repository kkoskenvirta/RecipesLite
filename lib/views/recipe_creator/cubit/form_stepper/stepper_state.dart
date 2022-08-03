part of 'stepper_cubit.dart';

enum StepperItem { details, ingredients, classification, review }

@freezed
class StepperState with _$StepperState {
  const factory StepperState({
    required StepperItem stepperItem,
    required int index,
  }) = _StepperState;

  factory StepperState.initial() {
    return const StepperState(
      stepperItem: StepperItem.details,
      index: 0,
    );
  }
}
