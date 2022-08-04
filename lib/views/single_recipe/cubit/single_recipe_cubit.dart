import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';

part 'single_recipe_cubit.freezed.dart';
part 'single_recipe_state.dart';

class SingleRecipeCubit extends Cubit<SingleRecipeState> {
  SingleRecipeCubit({required RecipesRepository recipesRepository})
      : _recipesRepository = recipesRepository,
        super(SingleRecipeState.initial());

  final RecipesRepository _recipesRepository;
  initializeRecipe(String? id, RecipeModel? recipeModel) async {
    try {
      if (id != null) {
        emit(state.copyWith(status: SingleRecipeStateStatus.loading));
        final errorOrRecipe = await _recipesRepository.getRecipeWithId(id: id);
        errorOrRecipe.fold(
          (err) => emit(state.copyWith(status: SingleRecipeStateStatus.error)),
          (recipe) {
            emit(state.copyWith(status: SingleRecipeStateStatus.loaded, recipe: recipe));
          },
        );
      } else if (recipeModel != null) {
        emit(state.copyWith(status: SingleRecipeStateStatus.loaded, recipe: recipeModel));
      }
    } catch (e) {
      emit(state.copyWith(status: SingleRecipeStateStatus.error));
    }
  }

  emitUpdatedRecipe(RecipeModel? recipe) {
    try {
      emit(state.copyWith(recipe: recipe));
    } catch (e) {
      emit(state.copyWith(status: SingleRecipeStateStatus.error));
    }
  }
}
