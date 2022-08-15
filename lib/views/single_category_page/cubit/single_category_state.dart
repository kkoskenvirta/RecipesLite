part of 'single_category_cubit.dart';

enum SingleCategoryStatus { initial, loading, loaded, error }

enum TagStatus { initial, loading, loaded, error }

@freezed
class SingleCategoryState with _$SingleCategoryState {
  const factory SingleCategoryState({
    required SingleCategoryStatus listStatus,
    required SingleCategoryStatus fetchingMore,
    required TagStatus tagStatus,
    required List<RecipeModel>? recipeList,
    required int recipeListPage,
    required bool noMoreResults,
    required List<TagModel>? tags,
    required List<TagModel> tagFilters,
    required List<CategoryModel> categoryFilters,
  }) = _SingleCategoryState;

  factory SingleCategoryState.initial() {
    return const SingleCategoryState(
      listStatus: SingleCategoryStatus.initial,
      fetchingMore: SingleCategoryStatus.initial,
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
