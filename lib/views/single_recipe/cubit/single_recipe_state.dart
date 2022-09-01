part of 'single_recipe_cubit.dart';

enum SingleRecipeStateStatus { initial, loading, loaded, error }

@freezed
class SingleRecipeState with _$SingleRecipeState {
  const factory SingleRecipeState({
    required SingleRecipeStateStatus status,
    required int? favoriteCount,
    required RecipeModel? recipe,
  }) = _SingleRecipeState;

  factory SingleRecipeState.initial() {
    return const SingleRecipeState(
      status: SingleRecipeStateStatus.initial,
      favoriteCount: null,
      recipe: null,
    );
  }
}
