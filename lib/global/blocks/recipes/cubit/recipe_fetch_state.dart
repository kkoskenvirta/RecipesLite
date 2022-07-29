part of 'recipe_fetch_cubit.dart';

enum RecipeFetchStateStatus { initial, loading, loaded, error }

@freezed
class RecipeFetchState with _$RecipeFetchState {
  const factory RecipeFetchState({
    required RecipeFetchStateStatus status,
    required RecipeFetchStateStatus popularStatus,
    required RecipeFetchStateStatus featuredStatus,
    required List<RecipeModel> popular,
    required List<RecipeModel> featured,
  }) = _RecipeFetchState;

  factory RecipeFetchState.initial() {
    return const RecipeFetchState(
      status: RecipeFetchStateStatus.initial,
      popularStatus: RecipeFetchStateStatus.initial,
      featuredStatus: RecipeFetchStateStatus.initial,
      popular: [],
      featured: [],
    );
  }
}
