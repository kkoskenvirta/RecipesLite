import 'package:bloc/bloc.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';

part 'recipe_search_cubit.freezed.dart';
part 'recipe_search_state.dart';

class RecipeSearchCubit extends Cubit<RecipeSearchState> {
  RecipeSearchCubit({required this.recipesRepository}) : super(RecipeSearchState.initial());

  final RecipesRepository recipesRepository;

  Future<void> searchRecipes(String text) async {
    try {
      emit(state.copyWith(searchString: text, status: RecipeSearchStatus.loading));

      final String filter;
      if (text.isEmpty) {
        filter = '';
      } else {
        filter =
            '&filter={"_and":[{"_and":[{"_or":[{"Name":{"_contains":"$text"}},{"ingredients":{"ingredient_id":{"name":{"_contains":"$text"}}}},{"categories":{"category_category_id":{"category_name":{"_contains":"$text"}}}},{"tags":{"tag_id":{"tag_name":{"_contains":"$text"}}}}]}]},{"status":{"_neq":"archived"}}]}';
      }

      final errorOrSearchResults = await recipesRepository.searchRecipes(filters: filter);

      errorOrSearchResults.fold(
        (error) => emit(state.copyWith(status: RecipeSearchStatus.error)),
        (searchResult) => emit(
          state.copyWith(status: RecipeSearchStatus.loaded, recipeList: searchResult),
        ),
      );
    } catch (e) {}
  }

  updateSearchString(String string) {
    emit(state.copyWith(filterApplied: string, searchString: string));
  }

  resetSearch() {
    emit(
      state.copyWith(
        status: RecipeSearchStatus.initial,
        recipeList: [],
        searchString: "",
        filterApplied: "",
      ),
    );
  }
}
