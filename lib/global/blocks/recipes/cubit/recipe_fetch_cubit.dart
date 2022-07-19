import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_e_commerce/models/recipe/failure_model.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';

part 'recipe_fetch_state.dart';

class RecipeFetchCubit extends Cubit<RecipeFetchState> {
  RecipeFetchCubit({required this.recipesRepository}) : super(RecipeFetchInitial());

  final RecipesRepository recipesRepository;

  Future<void> fetchRecipeApi() async {
    emit(RecipeFetchLoading());
    try {
      final failureOrRecipeList = await recipesRepository.getRecipesList();
      failureOrRecipeList.fold(
        (error) => emit(
          RecipeFetchLoaded(
            recipeList: const [],
          ),
        ),
        (recipeList) => emit(
          RecipeFetchLoaded(recipeList: recipeList ?? []),
        ),
      );
    } on Failure catch (err) {
      emit(RecipeFetchError());
    } catch (e) {
      print("Error: $e");
    }
  }
}
