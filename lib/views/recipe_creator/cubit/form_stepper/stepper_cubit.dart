import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stepper_state.dart';
part 'stepper_cubit.freezed.dart';

class StepperCubit extends Cubit<StepperState> {
  StepperCubit() : super(StepperState.initial());

  nextStep() {
    switch (state.stepperItem) {
      case StepperItem.details:
        emit(state.copyWith(index: 1, stepperItem: StepperItem.ingredients));
        break;
      case StepperItem.ingredients:
        emit(state.copyWith(index: 2, stepperItem: StepperItem.classification));
        break;
      case StepperItem.classification:
        emit(state.copyWith(index: 3, stepperItem: StepperItem.review));
        break;
      case StepperItem.review:
        break;

      default:
        emit(state.copyWith(index: 0, stepperItem: StepperItem.details));
    }
  }

  goToStep(index) {
    switch (index) {
      case 0:
        emit(state.copyWith(index: 0, stepperItem: StepperItem.details));
        break;
      case 1:
        emit(state.copyWith(index: 1, stepperItem: StepperItem.ingredients));

        break;
      case 2:
        emit(state.copyWith(index: 2, stepperItem: StepperItem.classification));

        break;
      case 3:
        emit(state.copyWith(index: 3, stepperItem: StepperItem.review));

        break;

      default:
        emit(state.copyWith(index: 0, stepperItem: StepperItem.details));
    }
  }

  previousStep() {
    switch (state.stepperItem) {
      case StepperItem.details:
        // emit(state.copyWith(index: 1, stepperItem: StepperItem.ingredients));
        break;
      case StepperItem.ingredients:
        emit(state.copyWith(index: 0, stepperItem: StepperItem.details));
        break;
      case StepperItem.classification:
        emit(state.copyWith(index: 1, stepperItem: StepperItem.ingredients));
        break;
      case StepperItem.review:
        emit(state.copyWith(index: 2, stepperItem: StepperItem.classification));
        break;

      default:
        emit(state.copyWith(index: 0, stepperItem: StepperItem.details));
    }
  }
}
