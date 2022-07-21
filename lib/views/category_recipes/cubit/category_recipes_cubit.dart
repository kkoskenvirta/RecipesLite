import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';

part 'category_recipes_cubit.freezed.dart';
part 'category_recipes_state.dart';

class CategoryRecipesCubit extends Cubit<CategoryRecipesState> {
  CategoryRecipesCubit({required RecipesRepository recipesRepository})
      : _recipesRepository = recipesRepository,
        super(CategoryRecipesState.initial());

  final RecipesRepository _recipesRepository;
  getCategoryRecipes(CategoryModel category) async {
    try {
      emit(state.copyWith(status: CategoryRecipesStateStatus.loading));
      final errorOrRecipeList = await _recipesRepository.getRecipesListWithCategory(category);
      errorOrRecipeList.fold(
        (err) => emit(state.copyWith(status: CategoryRecipesStateStatus.error)),
        (recipeList) {
          emit(state.copyWith(status: CategoryRecipesStateStatus.loaded, recipeList: recipeList!));
        },
      );
    } catch (e) {
      emit(state.copyWith(status: CategoryRecipesStateStatus.error));
    }
  }
}
