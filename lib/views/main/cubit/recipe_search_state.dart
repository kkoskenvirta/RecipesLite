part of 'recipe_search_cubit.dart';

enum RecipeSearchStatus { initial, loading, loaded, error }

@freezed
class RecipeSearchState with _$RecipeSearchState {
  const factory RecipeSearchState({
    required RecipeSearchStatus status,
    required List<RecipeModel>? recipeList,
    required String searchString,
    required String filterApplied,
  }) = _RecipeSearchState;

  factory RecipeSearchState.initial() {
    return const RecipeSearchState(
      status: RecipeSearchStatus.initial,
      recipeList: [],
      searchString: "",
      filterApplied: "",
    );
  }
}
