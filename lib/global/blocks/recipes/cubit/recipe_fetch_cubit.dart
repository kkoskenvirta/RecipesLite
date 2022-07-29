import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_e_commerce/models/recipe/dto/recipe_dto.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_e_commerce/models/recipe/failure_model.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';

part 'recipe_fetch_cubit.freezed.dart';
part 'recipe_fetch_state.dart';

class RecipeFetchCubit extends Cubit<RecipeFetchState> {
  RecipeFetchCubit({required this.recipesRepository}) : super(RecipeFetchState.initial());

  final RecipesRepository recipesRepository;

  Future<void> fetchHomePageRecipes() async {
    try {
      emit(state.copyWith(status: RecipeFetchStateStatus.loading));
      await fetchFeatured();
      await fetchPopular();
      emit(state.copyWith(status: RecipeFetchStateStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: RecipeFetchStateStatus.error));
    }
  }

  Future<void> fetchFeatured() async {
    try {
      emit(state.copyWith(featuredStatus: RecipeFetchStateStatus.loading));
      const String filter = '&filter={"Featured":{"_eq": "true"}}';
      final errorOrPopularList = await recipesRepository.getRecipesList(limit: 5, filters: filter);
      errorOrPopularList.fold(
        (err) => emit(state.copyWith(status: RecipeFetchStateStatus.error)),
        (featured) {
          emit(state.copyWith(featured: featured!));
          emit(state.copyWith(featuredStatus: RecipeFetchStateStatus.loaded));

          if (state.popularStatus == RecipeFetchStateStatus.loaded) {
            emit(state.copyWith(status: RecipeFetchStateStatus.loaded));
          }
        },
      );
    } catch (e) {
      emit(state.copyWith(status: RecipeFetchStateStatus.error));
    }
  }

  Future<void> fetchPopular() async {
    try {
      emit(state.copyWith(popularStatus: RecipeFetchStateStatus.loading));
      const String filter = '&filter={"Featured":{"_eq": "false"}}';
      const int limit = 8;
      final errorOrPopularList = await recipesRepository.getRecipesList(filters: filter, limit: limit);
      errorOrPopularList.fold(
        (err) => emit(state.copyWith(status: RecipeFetchStateStatus.error)),
        (popular) {
          emit(state.copyWith(popular: popular!));
          emit(state.copyWith(popularStatus: RecipeFetchStateStatus.loading));

          if (state.featuredStatus == RecipeFetchStateStatus.loaded) {
            emit(state.copyWith(status: RecipeFetchStateStatus.loaded));
          }
        },
      );
    } catch (e) {
      emit(state.copyWith(status: RecipeFetchStateStatus.error));
    }
  }
}
