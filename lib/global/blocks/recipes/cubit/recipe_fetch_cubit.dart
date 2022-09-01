import 'package:bloc/bloc.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';

part 'recipe_fetch_cubit.freezed.dart';
part 'recipe_fetch_state.dart';

class RecipeFetchCubit extends Cubit<RecipeFetchState> {
  RecipeFetchCubit({required this.recipesRepository}) : super(RecipeFetchState.initial());

  final RecipesRepository recipesRepository;

  Future<void> fetchHomePageRecipes() async {
    try {
      emit(state.copyWith(
        status: RecipeFetchStateStatus.loading,
      ));
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
      const String filter = '&filter={"_and":[{"_and":[{"featured":{"_eq":true}}]},{"status":{"_eq":"published"}}]}';
      final errorOrPopularList = await recipesRepository.getRecipesList(limit: 5, filters: filter);
      errorOrPopularList.fold(
        (err) => emit(state.copyWith(status: RecipeFetchStateStatus.error)),
        (featured) {
          emit(state.copyWith(featured: featured!, featuredStatus: RecipeFetchStateStatus.loaded));

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
      const String filter = '&filter={"_and":[{"_and":[{"featured":{"_eq":false}}]},{"status":{"_eq":"published"}}]}';
      const int limit = 8;
      final errorOrPopularList = await recipesRepository.getRecipesList(filters: filter, limit: limit);
      errorOrPopularList.fold(
        (err) => emit(state.copyWith(status: RecipeFetchStateStatus.error)),
        (popular) {
          emit(state.copyWith(popular: popular!, popularStatus: RecipeFetchStateStatus.loaded));

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
