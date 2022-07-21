import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stepper_state.dart';
part 'stepper_cubit.freezed.dart';

class StepperCubit extends Cubit<StepperState> {
  StepperCubit() : super(StepperState.initial());

  nextStep() {
    switch (state.stepperItem) {
      case StepperItem.start:
        emit(state.copyWith(index: 1, stepperItem: StepperItem.photos));
        break;
      case StepperItem.photos:
        emit(state.copyWith(index: 2, stepperItem: StepperItem.classification));
        break;
      case StepperItem.classification:
        emit(state.copyWith(index: 3, stepperItem: StepperItem.review));
        break;
      case StepperItem.review:
        // emit(state.copyWith(index: 3, stepperItem: StepperItem.review));
        break;

      default:
        emit(state.copyWith(index: 0, stepperItem: StepperItem.start));
    }
  }

  previousStep() {
    switch (state.stepperItem) {
      case StepperItem.start:
        // emit(state.copyWith(index: 1, stepperItem: StepperItem.photos));
        break;
      case StepperItem.photos:
        emit(state.copyWith(index: 0, stepperItem: StepperItem.start));
        break;
      case StepperItem.classification:
        emit(state.copyWith(index: 1, stepperItem: StepperItem.photos));
        break;
      case StepperItem.review:
        emit(state.copyWith(index: 2, stepperItem: StepperItem.classification));
        break;

      default:
        emit(state.copyWith(index: 0, stepperItem: StepperItem.start));
    }
  }
}
