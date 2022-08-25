part of 'recipe_list_cubit.dart';

enum RecipeListStatus { initial, loading, loaded, error }

enum TagStatus { initial, loading, loaded, error }

@freezed
class RecipeListState with _$RecipeListState {
  const factory RecipeListState({
    required RecipeListStatus listStatus,
    required RecipeListStatus fetchingMore,
    required TagStatus tagStatus,
    required List<RecipeModel>? recipeList,
    required int recipeListPage,
    required bool noMoreResults,
    required List<TagModel>? tags,
    required List<TagModel> tagFilters,
    required List<CategoryModel> categoryFilters,
  }) = _RecipeListState;

  factory RecipeListState.initial() {
    return const RecipeListState(
      listStatus: RecipeListStatus.initial,
      fetchingMore: RecipeListStatus.initial,
      tagStatus: TagStatus.initial,
      recipeList: [],
      recipeListPage: 1,
      noMoreResults: false,
      tags: null,
      tagFilters: [],
      categoryFilters: [],
    );
  }
}