import 'package:bloc/bloc.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/repositorys/category_repository.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';

part 'single_category_cubit.freezed.dart';
part 'single_category_state.dart';

class SingleCategoryCubit extends Cubit<SingleCategoryState> {
  SingleCategoryCubit({
    required CategoryRepository categoryRepository,
    required RecipesRepository recipesRepository,
  })  : _recipesRepository = recipesRepository,
        _categoryRepository = categoryRepository,
        super(SingleCategoryState.initial());

  final RecipesRepository _recipesRepository;
  final CategoryRepository _categoryRepository;

  Future<void> getRecipes(List<CategoryModel>? category) async {
    if (category != null) {
      emit(state.copyWith(categoryFilters: [...category]));
    }
    if (state.recipeListPage == 1) {
      emit(state.copyWith(listStatus: SingleCategoryStatus.loading));
    } else {
      emit(state.copyWith(fetchingMore: SingleCategoryStatus.loading));
    }
    final errorOrRecipeList = await _recipesRepository.getRecipesListWithFilters(
      limit: 15,
      page: state.recipeListPage,
      tags: state.tagFilters,
      categories: state.categoryFilters,
    );
    errorOrRecipeList.fold(
      (err) => emit(state.copyWith(listStatus: SingleCategoryStatus.error)),
      (newRecipes) {
        if (newRecipes == null) {
          emit(state.copyWith(
            listStatus: SingleCategoryStatus.loaded,
            fetchingMore: SingleCategoryStatus.loaded,
            noMoreResults: true,
          ));
          return;
        }
        List<RecipeModel> recipeList = [...state.recipeList!];
        recipeList.addAll(newRecipes);
        emit(state.copyWith(
          listStatus: SingleCategoryStatus.loaded,
          fetchingMore: SingleCategoryStatus.loaded,
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
}
