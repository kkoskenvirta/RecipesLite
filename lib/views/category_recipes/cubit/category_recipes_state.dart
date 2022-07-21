part of 'category_recipes_cubit.dart';

enum CategoryRecipesStateStatus { initial, loading, loaded, error }

@freezed
class CategoryRecipesState with _$CategoryRecipesState {
  const factory CategoryRecipesState({
    required CategoryRecipesStateStatus status,
    required List<RecipeModel> recipeList,
  }) = _CategoryRecipesState;

  factory CategoryRecipesState.initial() {
    return const CategoryRecipesState(
      status: CategoryRecipesStateStatus.initial,
      recipeList: [],
    );
  }
}
