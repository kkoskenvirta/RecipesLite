part of 'user_data_cubit.dart';

enum UserDataStateStatus { initial, loading, loaded, error }

@freezed
class UserDataState with _$UserDataState {
  const factory UserDataState({
    required UserDataStateStatus status,
    required UserDataStateStatus favoriteQuery,
    required UserDataStateStatus recipeQuery,
    required UserModel? currUser,
    required List<RecipeModel> favorites,
    required List<RecipeModel> recipes,
  }) = _UserDataState;

  factory UserDataState.initial() {
    return const UserDataState(
      status: UserDataStateStatus.initial,
      favoriteQuery: UserDataStateStatus.initial,
      recipeQuery: UserDataStateStatus.initial,
      currUser: null,
      favorites: [],
      recipes: [],
    );
  }
}
