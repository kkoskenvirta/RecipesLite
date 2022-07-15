part of 'profile_cubit.dart';

enum ProfileStateStatus { initial, loading, loaded, error }

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required ProfileStateStatus status,
    required DirectusUser? currUser,
    required List<FavoriteModel> favorites,
  }) = _ProfileState;

  factory ProfileState.initial() {
    return const ProfileState(
      status: ProfileStateStatus.initial,
      currUser: null,
      favorites: [],
    );
  }

  // const factory ProfileState.initial() = _Initial;

  // const factory ProfileState.loading() = _Loading;

  // const factory ProfileState.error(String message) = _Error;

  // const factory ProfileState.loaded({
  //   required DirectusUser currUser,
  //   required List<FavoriteModel> favorites,
  // }) = _Loaded;
}
