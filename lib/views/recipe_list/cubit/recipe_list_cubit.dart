import 'package:bloc/bloc.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/repositorys/category_repository.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/utils/sort.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';

part 'recipe_list_cubit.freezed.dart';
part 'recipe_list_state.dart';

class RecipeListCubit extends Cubit<RecipeListState> {
  RecipeListCubit({
    required CategoryRepository categoryRepository,
    required RecipesRepository recipesRepository,
  })  : _recipesRepository = recipesRepository,
        _categoryRepository = categoryRepository,
        super(RecipeListState.initial());

  final RecipesRepository _recipesRepository;
  final CategoryRepository _categoryRepository;

  Future<void> getRecipes(List<CategoryModel>? category) async {
    if (category != null) {
      emit(state.copyWith(categoryFilters: [...category]));
    }
    if (state.recipeListPage == 1) {
      emit(state.copyWith(listStatus: RecipeListStatus.loading));
    } else {
      emit(state.copyWith(fetchingMore: RecipeListStatus.loading));
    }
    final errorOrRecipeList = await _recipesRepository.getRecipesListWithFilters(
      limit: 15,
      page: state.recipeListPage,
      tags: state.tagFilters,
      categories: state.categoryFilters,
      sort: state.sort,
      search: state.searchString,
    );
    errorOrRecipeList.fold(
      (err) => emit(state.copyWith(listStatus: RecipeListStatus.error)),
      (newRecipes) {
        if (newRecipes == null) {
          emit(state.copyWith(
            listStatus: RecipeListStatus.loaded,
            fetchingMore: RecipeListStatus.loaded,
            noMoreResults: true,
          ));
          return;
        }
        List<RecipeModel> recipeList = [...state.recipeList!];
        recipeList.addAll(newRecipes);
        emit(state.copyWith(
          listStatus: RecipeListStatus.loaded,
          fetchingMore: RecipeListStatus.loaded,
          recipeList: recipeList,
          recipeListPage: state.recipeListPage + 1,
        ));
      },
    );
  }

  Future<void> getTags() async {
    emit(state.copyWith(tagStatus: TagStatus.loading));
    final errorOrTags = await _categoryRepository.getTagList();
    errorOrTags.fold(
      (err) => emit(state.copyWith(tagStatus: TagStatus.error)),
      (tagList) => emit(state.copyWith(
        tagStatus: TagStatus.loaded,
        tags: tagList!,
      )),
    );
  }

  updateSort(SortBy sort) {
    emit(state.copyWith(
      sort: sort,
      recipeListPage: 1,
      recipeList: [],
    ));
  }

  updateTagList(TagModel newTag, bool status) {
    List<TagModel> filterList = [...state.tagFilters];
    final selected = filterList.where((tag) => tag.id == newTag.id);
    if (selected.isEmpty) {
      filterList.add(newTag);
    } else {
      filterList.removeWhere((tag) => tag.id == newTag.id);
    }
    emit(state.copyWith(
      tagFilters: filterList,
      recipeListPage: 1,
      recipeList: [],
      noMoreResults: false,
    ));
    getRecipes(state.categoryFilters);
  }

  updateSearchString(String string) {
    emit(state.copyWith(
      searchString: string,
      recipeListPage: 1,
      recipeList: [],
    ));
  }

  resetSearch() {
    emit(
      state.copyWith(
        listStatus: RecipeListStatus.initial,
        recipeListPage: 1,
        recipeList: [],
        searchString: "",
      ),
    );
    getRecipes(state.categoryFilters);
  }
}
