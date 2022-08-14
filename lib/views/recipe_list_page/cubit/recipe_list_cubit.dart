import 'package:bloc/bloc.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/repositorys/category_repository.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
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

  Future<void> getRecipes() async {
    emit(state.copyWith(listStatus: RecipeListStatus.loading));
    if (state.filters.isNotEmpty) {
      final errorOrRecipeList = await _recipesRepository.getRecipesListWithTags(state.filters);
      errorOrRecipeList.fold(
        (err) => emit(state.copyWith(listStatus: RecipeListStatus.error)),
        (recipeList) => emit(state.copyWith(listStatus: RecipeListStatus.loaded, recipeList: recipeList!)),
      );
    } else {
      final errorOrRecipeList = await _recipesRepository.getRecipesList();
      errorOrRecipeList.fold(
        (err) => emit(state.copyWith(listStatus: RecipeListStatus.error)),
        (recipeList) => emit(state.copyWith(listStatus: RecipeListStatus.loaded, recipeList: recipeList!)),
      );
    }
  }

  Future<void> getTags() async {
    emit(state.copyWith(tagStatus: TagStatus.loading));
    final errorOrTags = await _categoryRepository.getTagList();
    errorOrTags.fold(
      (err) => emit(state.copyWith(tagStatus: TagStatus.error)),
      (tagList) => emit(state.copyWith(tagStatus: TagStatus.loaded, tags: tagList!)),
    );
  }

  updateTagList(TagModel newTag, bool status) {
    List<TagModel> filterList = [...state.filters];
    final selected = filterList.where((tag) => tag.id == newTag.id);
    if (selected.isEmpty) {
      filterList.add(newTag);
    } else {
      filterList.removeWhere((tag) => tag.id == newTag.id);
    }
    emit(state.copyWith(filters: filterList));
    getRecipes();
  }
}
