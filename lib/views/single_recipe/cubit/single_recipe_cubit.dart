import 'package:bloc/bloc.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';

part 'single_recipe_cubit.freezed.dart';
part 'single_recipe_state.dart';

class SingleRecipeCubit extends Cubit<SingleRecipeState> {
  SingleRecipeCubit({required RecipesRepository recipesRepository}) : super(SingleRecipeState.initial());

  initializeRecipe(RecipeModel? recipeModel) async {
    try {
      emit(state.copyWith(
        status: SingleRecipeStateStatus.loaded,
        recipe: recipeModel,
        favoriteCount: int.parse(recipeModel!.favoritesCount!),
      ));
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

  updateFavoriteCount(bool favorited) =>
      emit(state.copyWith(favoriteCount: state.favoriteCount! + (favorited ? -1 : 1)));
}
