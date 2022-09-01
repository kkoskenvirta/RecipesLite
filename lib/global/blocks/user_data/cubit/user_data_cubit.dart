import 'package:bloc/bloc.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/models/user/user_model.dart';
import 'package:flutter_e_commerce/models/user_data/user_data_model.dart';
import 'package:flutter_e_commerce/repositorys/auth_repository.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/repositorys/user_data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_state.dart';
part 'user_data_cubit.freezed.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(
      {required RecipesRepository recipesRepository,
      required UserDataRepository userDataRepository,
      required AuthRepository authRepository})
      : _authRepository = authRepository,
        _userDataRepository = userDataRepository,
        _recipesRepository = recipesRepository,
        super(UserDataState.initial());

  final UserDataRepository _userDataRepository;
  final AuthRepository _authRepository;
  final RecipesRepository _recipesRepository;

  getUserData() async {
    try {
      emit(state.copyWith(status: UserDataStateStatus.loading, recipeStatus: UserDataStateStatus.loading));
      final errorOrCurrentUser = await _authRepository.getCurrentUser();
      errorOrCurrentUser.fold(
        (err) => emit(state.copyWith(status: UserDataStateStatus.error)),
        (foundUser) async {
          emit(state.copyWith(user: foundUser));
          final errorOrUserData = await _userDataRepository.getUserData(foundUser.id);
          errorOrUserData.fold(
            (err) => null,
            (userData) => emit(
                state.copyWith(userData: userData, favorites: userData.favorites, status: UserDataStateStatus.loaded)),
          );
          _getUserRecipes(foundUser);
        },
      );
    } catch (e) {
      emit(state.copyWith(status: UserDataStateStatus.error));
    }
  }

  _getUserRecipes(UserModel currentUser) async {
    final String filters =
        '&filter={"_and":[{"_and":[{"user_created":{"_eq": "${currentUser.id}"}}]},{"status":{"_neq":"archived"}}]}';
    final errorOrRecipes = await _recipesRepository.getRecipesList(filters: filters);
    errorOrRecipes.fold(
      (err) => emit(state.copyWith(status: UserDataStateStatus.error)),
      (recipes) => emit(state.copyWith(recipeStatus: UserDataStateStatus.loaded, recipes: recipes!)),
    );
  }

  toggleFavorites(RecipeModel recipe) async {
    if (state.user == null) return;
    emit(state.copyWith(status: UserDataStateStatus.loading));
    final List<RecipeModel> oldFavorites = state.favorites;
    final List<RecipeModel> newFavorites = _generateNewFavorites(recipe, state.favorites);
    emit(state.copyWith(status: UserDataStateStatus.loaded, favorites: newFavorites));
    try {
      final favoritesToDirectus =
          newFavorites.map((recipe) => recipe.fromDomainToFavorite(recipe, state.userData!.userId).toJson()).toList();
      await _userDataRepository.updateFavoritesList(favoritesToDirectus, state.userData!.id);
    } catch (e) {
      emit(state.copyWith(status: UserDataStateStatus.loaded, favorites: oldFavorites));
    }
  }

  List<RecipeModel> _generateNewFavorites(RecipeModel recipe, List<RecipeModel> favorites) {
    List<RecipeModel> newFavorites = [...favorites];
    final favorited = newFavorites.where((favorite) => favorite.id == recipe.id);
    favorited.isEmpty ? newFavorites.add(recipe) : newFavorites.removeWhere((favorite) => favorite.id == recipe.id);
    return newFavorites;
  }

  deleteUserData() async {
    if (state.user == null) return;
    final errorOrDeleted = await _userDataRepository.deleteUserData(state.userData!.userId);
    errorOrDeleted.fold(
      (err) => print(err),
      (_) async => UserDataState.initial(),
    );
  }
}
