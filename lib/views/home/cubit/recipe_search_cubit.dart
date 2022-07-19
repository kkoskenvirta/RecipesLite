import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_e_commerce/config/api_config.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_e_commerce/models/recipe/failure_model.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';

part 'recipe_search_state.dart';

class RecipeSearchCubit extends Cubit<RecipeSearchState> {
  RecipeSearchCubit({required this.recipesRepository}) : super(RecipeSearchInitial());

  final RecipesRepository recipesRepository;

  Future<void> searchRecipes(String text) async {
    emit(RecipeSearchLoading());
    try {
      final String query;
      if (text.isEmpty) {
        query = '$baseUrl$recipesPath';
      } else {
        query = '$baseUrl$recipesPath?filter[name][_contains]=$text';
      }

      final errorOrSearchResults = await recipesRepository.searchRecipes(query);

      errorOrSearchResults.fold(
          (error) => emit(RecipeSearchError()), (searchResult) => emit(RecipeSearchLoaded(recipeList: searchResult)));
    } on Failure catch (err) {
      emit(RecipeSearchError());
    } catch (e) {
      print("Error: $e");
    }
  }
}