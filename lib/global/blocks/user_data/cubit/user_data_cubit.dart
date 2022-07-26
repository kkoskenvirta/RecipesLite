import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_e_commerce/models/favorite/dto/favorite_dto.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/models/user/user_model.dart';
import 'package:flutter_e_commerce/repositorys/auth_repository.dart';
import 'package:flutter_e_commerce/repositorys/user_data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_state.dart';
part 'user_data_cubit.freezed.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit({required UserDataRepository userDataRepository, required AuthRepository authRepository})
      : _authRepository = authRepository,
        _userDataRepository = userDataRepository,
        super(UserDataState.initial());

  UserModel? currentUser;
  List<RecipeModel>? favo;

  final UserDataRepository _userDataRepository;
  final AuthRepository _authRepository;

  getUserData() async {
    try {
      emit(state.copyWith(status: UserDataStateStatus.loading));
      final errorOrCurrentUser = await _authRepository.getCurrentUser();
      errorOrCurrentUser.fold(
        (err) => emit(state.copyWith(status: UserDataStateStatus.error)),
        (foundUser) {
          currentUser = foundUser;
          emit(state.copyWith(currUser: currentUser));

          _getUserFavorites(currentUser!);
        },
      );
    } catch (e) {
      emit(state.copyWith(status: UserDataStateStatus.error));
    }
  }

  _getUserFavorites(UserModel currentUser) async {
    final errorOrFavorites = await _userDataRepository.getUserFavorites(currentUser);
    errorOrFavorites.fold(
      (err) => emit(state.copyWith(status: UserDataStateStatus.error)),
      (favorites) {
        emit(state.copyWith(status: UserDataStateStatus.loaded, favorites: favorites));
      },
    );
  }

  //addFavorite
  toggleFavorites(RecipeModel recipe) async {
    try {
      //Get user favorites
      if (state.currUser != null) {
        final errorOrFavorites = await _userDataRepository.getUserFavorites(state.currUser!);
        errorOrFavorites.fold(
          (err) {
            emit(
              state.copyWith(status: UserDataStateStatus.error),
            );
          },
          (favorites) async {
            final List<RecipeModel> newFavorites = _generateNewFavorites(recipe, favorites);

            emit(
              state.copyWith(status: UserDataStateStatus.loaded, favorites: newFavorites),
            );
            try {
              _userDataRepository.updateLocalUserData(newFavorites);
              final favoritesToDirectus = _generateFavoritesToDirectus(newFavorites);
              final response = await _userDataRepository.updateFavoritesList(favoritesToDirectus, state.currUser!);
            } catch (e) {
              print("error on favorite toggle");
              emit(
                state.copyWith(status: UserDataStateStatus.loaded, favorites: favorites),
              );
            }
          },
        );
      }
      return;
    } catch (e) {
      state.copyWith(status: UserDataStateStatus.error);
    }
  }

  _generateNewFavorites(RecipeModel recipe, List<RecipeModel> favorites) {
    List<RecipeModel> newFavorites = [...favorites];
    final favorited = newFavorites.where((favorite) => favorite.id == recipe.id);
    if (favorited.isEmpty) {
      newFavorites.add(recipe);
    } else {
      newFavorites.removeWhere((favorite) => favorite.id == recipe.id);
    }
    return newFavorites;
  }

  List<dynamic> _generateFavoritesToDirectus(List<RecipeModel> favorites) {
    return favorites.map((recipe) => FavoriteDTO(recipeId: recipe.id!, userId: currentUser!.id).toJson()).toList();
  }
}
