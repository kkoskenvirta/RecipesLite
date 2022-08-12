part of 'recipe_list_cubit.dart';

enum RecipeListStatus { initial, loading, loaded, error }

@freezed
class RecipeListState with _$RecipeListState {
  const factory RecipeListState({
    required RecipeListStatus status,
    required List<RecipeModel>? recipeList,
    required List<TagModel>? tags,
    required List<TagModel> filters,
  }) = _RecipeListState;

  factory RecipeListState.initial() {
    return const RecipeListState(
      status: RecipeListStatus.initial,
      recipeList: null,
      tags: null,
      filters: [],
    );
  }
}
