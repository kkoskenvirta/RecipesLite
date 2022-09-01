part of 'user_data_cubit.dart';

enum UserDataStateStatus { initial, loading, loaded, error }

@freezed
class UserDataState with _$UserDataState {
  const factory UserDataState({
    required UserDataStateStatus status,
    required UserDataStateStatus recipeStatus,
    required UserModel? user,
    required UserDataModel? userData,
    required List<RecipeModel> favorites,
    required List<RecipeModel> recipes,
  }) = _UserDataState;

  factory UserDataState.initial() {
    return const UserDataState(
      status: UserDataStateStatus.initial,
      recipeStatus: UserDataStateStatus.initial,
      user: null,
      userData: null,
      favorites: [],
      recipes: [],
    );
  }
}
