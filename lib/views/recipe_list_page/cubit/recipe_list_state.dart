part of 'recipe_list_cubit.dart';

enum RecipeListStatus { initial, loading, loaded, error }

enum TagStatus { initial, loading, loaded, error }

@freezed
class RecipeListState with _$RecipeListState {
  const factory RecipeListState({
    required RecipeListStatus listStatus,
    required TagStatus tagStatus,
    required List<RecipeModel>? recipeList,
    required List<TagModel>? tags,
    required List<TagModel> filters,
  }) = _RecipeListState;

  factory RecipeListState.initial() {
    return const RecipeListState(
      listStatus: RecipeListStatus.initial,
      tagStatus: TagStatus.initial,
      recipeList: null,
      tags: null,
      filters: [],
    );
  }
}
