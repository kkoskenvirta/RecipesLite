part of 'user_data_cubit.dart';

enum UserDataStateStatus { initial, loading, loaded, error }

@freezed
class UserDataState with _$UserDataState {
  const factory UserDataState({
    required UserDataStateStatus status,
    required UserModel? currUser,
    required List<RecipeModel> favorites,
  }) = _UserDataState;

  factory UserDataState.initial() {
    return const UserDataState(
      status: UserDataStateStatus.initial,
      currUser: null,
      favorites: [],
    );
  }
}
