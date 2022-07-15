import 'package:bloc/bloc.dart';
import 'package:directus/directus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_e_commerce/models/favorite/favorite_model.dart';
import 'package:flutter_e_commerce/modules/dio_module.dart';
import 'package:flutter_e_commerce/modules/directus_module.dart';
import 'package:flutter_e_commerce/repositorys/auth_repository.dart';
import 'package:flutter_e_commerce/repositorys/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());
  final _userRepository = UserRepository(
    dioModule: DioModule(),
    directus: DirectusModule(),
  );

  DirectusUser? currentUser;

  getCurrentUser() async {
    try {
      emit(state.copyWith(status: ProfileStateStatus.loading));
      final errorOrCurrentUser = await _userRepository.getCurrentUser();
      errorOrCurrentUser.fold(
        (err) => emit(state.copyWith(status: ProfileStateStatus.error)),
        (foundUser) {
          currentUser = foundUser;
          _getUserFavorites(currentUser!);
        },
      );
    } catch (e) {
      emit(state.copyWith(status: ProfileStateStatus.error));
    }
  }

  _getUserFavorites(DirectusUser currentUser) async {
    final errorOrFavorites = await _userRepository.getUserFavorites();
    errorOrFavorites.fold(
      (err) => emit(state.copyWith(status: ProfileStateStatus.error)),
      (favorites) {
        emit(state.copyWith(favorites: favorites));
      },
    );
  }

  //addFavorite
  toggleFavorites(String recipeId) async {
    try {
      //Get user favorites
      final errorOrFavorites = await _userRepository.getUserFavorites();
      errorOrFavorites.fold(
        (err) => emit(
          state.copyWith(status: ProfileStateStatus.error),
        ),
        (favorites) async {
          final List<FavoriteModel> newFavorites = _generateNewFavorites(recipeId, favorites);
          emit(
            state.copyWith(status: ProfileStateStatus.loaded, favorites: newFavorites),
          );
          try {
            final response = await _userRepository.updateFavoritesList(newFavorites);
          } catch (e) {
            emit(
              state.copyWith(status: ProfileStateStatus.loaded, favorites: favorites),
            );
          }
        },
      );
    } catch (e) {
      state.copyWith(status: ProfileStateStatus.error);
    }
  }

  _generateNewFavorites(String newRecipeId, List<FavoriteModel> favorites) {
    List<FavoriteModel> newFavorites = [...favorites];
    final favorited = newFavorites.where((favorite) => favorite.recipeId == newRecipeId);
    if (favorited.isEmpty) {
      newFavorites.add(FavoriteModel(recipeId: newRecipeId, userId: currentUser!.id!));
    } else {
      newFavorites.removeWhere((favorite) => favorite.recipeId == newRecipeId);
    }
    return newFavorites;
  }
}
