import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/incredient/incredient_model.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';

part 'form_data_cubit.freezed.dart';
part 'form_data_state.dart';

class FormDataCubit extends Cubit<FormDataState> {
  FormDataCubit({required RecipesRepository recipesRepository})
      : _recipeRepository = recipesRepository,
        super(FormDataState.initial());

  final RecipesRepository _recipeRepository;

  updateRecipeImage(File tempImage) {
    try {
      emit(state.copyWith(image: tempImage));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: FormDataStateStatus.error));
    }
  }

  addIncredient() {
    List<IncredientModel> incredientList = [...state.incredients];
    incredientList.add(IncredientModel.create());
    emit(state.copyWith(incredients: incredientList));
  }

  removeIncredient(index) {
    List<IncredientModel> incredientList = [...state.incredients];
    incredientList.removeAt(index);
    emit(state.copyWith(incredients: incredientList));
  }

  updateRecipeName(String name) {
    emit(state.copyWith(name: name));
  }

  updateShortDescription(String shortDescription) {
    emit(state.copyWith(shortDescription: shortDescription));
  }

  updateInstructions(String instructions) {
    emit(state.copyWith(instructions: instructions));
  }

  updateIncredientName(int index, String name) {
    print('${index} ${name}');
    List<IncredientModel> incredientList = [...state.incredients];
    incredientList[index] = incredientList[index].copyWith(name: name);
    print(incredientList);
    emit(state.copyWith(incredients: incredientList));
  }

  updateIncredientAmount(int index, String amount) {
    try {
      print('${index} ${amount}');

      List<IncredientModel> incredientList = [...state.incredients];
      final doubleAmount = double.parse(amount);
      incredientList[index] = incredientList[index].copyWith(amount: doubleAmount);
      emit(state.copyWith(incredients: incredientList));
    } catch (e) {}
    List<IncredientModel> incredientList = [...state.incredients];
    incredientList[index] = incredientList[index].copyWith(amount: null);
    emit(state.copyWith(incredients: incredientList));
  }

  updateIncredientUnit(int index, String unit) {
    print('${index.toString()}-$unit');
    List<IncredientModel> incredientList = [...state.incredients];
    incredientList[index] = incredientList[index].copyWith(unit: unit);
    emit(state.copyWith(incredients: incredientList));
  }

  submitRecipe() async {}
}
