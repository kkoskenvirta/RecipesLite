import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/ingredient/ingredient_model.dart';
import 'package:flutter_e_commerce/models/ingredient_group/ingredient_group_model.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/utils/string_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

part 'form_data_cubit.freezed.dart';
part 'form_data_state.dart';

class FormDataCubit extends Cubit<FormDataState> {
  FormDataCubit({
    required RecipesRepository recipesRepository,
  })  : _recipesRepository = recipesRepository,
        super(FormDataState.initial());

  final RecipesRepository _recipesRepository;

  initializeEdit(RecipeModel? recipe) {
    try {
      if (recipe == null) return;
      emit(
        state.copyWith(
          id: recipe.id,
          name: recipe.name,
          shortDescription: recipe.shortDescription,
          instructions: recipe.instructions!,
          categories: recipe.categories!,
          tags: recipe.tags!,
          blurHash: recipe.blurhash,
          ingredientGroups: recipe.ingredientGroups!,
          difficulty: recipe.difficulty!.toLowerCase(),
          preparationTime: recipe.preparationTime,
          editMode: true,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FormDataStateStatus.error));
    }
  }

  updateRecipeImage(File tempImage) {
    try {
      emit(state.copyWith(image: tempImage));
    } catch (e) {
      emit(state.copyWith(status: FormDataStateStatus.error));
    }
  }

  updateBlurHash(String hash) {
    emit(state.copyWith(blurHash: hash));
  }

  updateBlurHashStatus(BlurHashStatus status) {
    emit(state.copyWith(blurHashStatus: status));
  }

  addIngredientGroup(String name) {
    List<IngredientGroupModel> ingredientGroups = [...state.ingredientGroups];
    ingredientGroups.add(IngredientGroupModel(name: name.capitalize(), ingredients: []));
    emit(state.copyWith(ingredientGroups: ingredientGroups));
  }

  updateIngredientGroupName({required int groupIndex, required String name}) {
    List<IngredientGroupModel> ingredientGroups = [...state.ingredientGroups];
    ingredientGroups[groupIndex] = ingredientGroups[groupIndex].copyWith(name: name);
    emit(state.copyWith(ingredientGroups: ingredientGroups));
  }

  removeIngredientGroup({required int groupIndex}) {
    List<IngredientGroupModel> ingredientGroups = [...state.ingredientGroups];
    ingredientGroups.removeAt(groupIndex);
    emit(state.copyWith(ingredientGroups: ingredientGroups));
  }

  removeIngredientFromGroup({required int groupIndex, required int ingredientIndex}) {
    List<IngredientModel> ingredientList = [...state.ingredientGroups[groupIndex].ingredients];
    List<IngredientGroupModel> ingredientGroups = [...state.ingredientGroups];

    ingredientList.removeAt(ingredientIndex);
    ingredientGroups[groupIndex] = ingredientGroups[groupIndex].copyWith(ingredients: ingredientList);

    emit(state.copyWith(ingredientGroups: ingredientGroups));
  }

  addIngredientToGroup({required int groupIndex, required String name, required String amount, required String unit}) {
    List<IngredientGroupModel> ingredientGroups = [...state.ingredientGroups];
    List<IngredientModel> ingredientList = [...state.ingredientGroups[groupIndex].ingredients];

    ingredientList
        .add(IngredientModel(name: name.capitalize(), amount: double.parse(amount.replaceAll(',', '.')), unit: unit));
    ingredientGroups[groupIndex] = ingredientGroups[groupIndex].copyWith(ingredients: ingredientList);
    emit(state.copyWith(ingredientGroups: ingredientGroups));
  }

  addIngredient(String name, String amount, String unit) {
    List<IngredientModel> ingredientList = [...state.ingredients];
    ingredientList
        .add(IngredientModel(name: name.capitalize(), amount: double.parse(amount.replaceAll(',', '.')), unit: unit));
    emit(state.copyWith(ingredients: ingredientList));
  }

  removeIngredient(index) {
    List<IngredientModel> ingredientList = [...state.ingredients];
    ingredientList.removeAt(index);
    emit(state.copyWith(ingredients: ingredientList));
  }

  updateRecipeName(String name) {
    emit(state.copyWith(name: name));
  }

  updateRecipeDescription(String text) {
    emit(state.copyWith(shortDescription: text));
  }

  updateRecipeInstructions(String text) {
    emit(state.copyWith(instructions: text));
  }

  updateRecipeDifficulty(String text) {
    emit(state.copyWith(difficulty: text));
  }

  updateRecipePreparationTime(Duration text) {
    emit(state.copyWith(preparationTime: text.inMinutes));
  }

  updateRecipeShortDescription(String shortDescription) {
    emit(state.copyWith(shortDescription: shortDescription));
  }

  updateIngredientNameFromGroup({required int groupIndex, required int ingredientIndex, required String name}) {
    List<IngredientModel> ingredientList = [...state.ingredientGroups[groupIndex].ingredients];
    List<IngredientGroupModel> ingredientGroups = [...state.ingredientGroups];
    ingredientList[ingredientIndex] =
        state.ingredientGroups[groupIndex].ingredients[ingredientIndex].copyWith(name: name);
    ingredientGroups[groupIndex] = ingredientGroups[groupIndex].copyWith(ingredients: ingredientList);
    emit(state.copyWith(ingredientGroups: ingredientGroups));
  }

  updateIngredientAmountFromGroup({required int groupIndex, required int ingredientIndex, required String amount}) {
    try {
      List<IngredientModel> ingredientList = [...state.ingredientGroups[groupIndex].ingredients];
      List<IngredientGroupModel> ingredientGroups = [...state.ingredientGroups];
      final doubleAmount = double.parse(amount.replaceAll(',', '.'));
      ingredientList[ingredientIndex] =
          state.ingredientGroups[groupIndex].ingredients[ingredientIndex].copyWith(amount: doubleAmount);
      ingredientGroups[groupIndex] = ingredientGroups[groupIndex].copyWith(ingredients: ingredientList);
      emit(state.copyWith(ingredientGroups: ingredientGroups));
    } catch (e) {
      List<IngredientModel> ingredientList = [...state.ingredientGroups[groupIndex].ingredients];
      List<IngredientGroupModel> ingredientGroups = [...state.ingredientGroups];
      ingredientList[ingredientIndex] =
          state.ingredientGroups[groupIndex].ingredients[ingredientIndex].copyWith(amount: null);
      ingredientGroups[groupIndex] = ingredientGroups[groupIndex].copyWith(ingredients: ingredientList);
      emit(state.copyWith(ingredientGroups: ingredientGroups));
    }
  }

  updateIngredientUnitFromGroup({required int groupIndex, required int ingredientIndex, required String unit}) {
    List<IngredientModel> ingredientList = [...state.ingredientGroups[groupIndex].ingredients];
    List<IngredientGroupModel> ingredientGroups = [...state.ingredientGroups];
    ingredientList[ingredientIndex] =
        state.ingredientGroups[groupIndex].ingredients[ingredientIndex].copyWith(unit: unit);
    ingredientGroups[groupIndex] = ingredientGroups[groupIndex].copyWith(ingredients: ingredientList);
    emit(state.copyWith(ingredientGroups: ingredientGroups));
  }

  updateIngredientName(int index, String name) {
    List<IngredientModel> ingredientList = [...state.ingredients];
    ingredientList[index] = ingredientList[index].copyWith(name: name);
    emit(state.copyWith(ingredients: ingredientList));
  }

  updateIngredientAmount(int index, String amount) {
    try {
      List<IngredientModel> ingredientList = [...state.ingredients];
      final doubleAmount = double.parse(amount);
      ingredientList[index] = ingredientList[index].copyWith(amount: doubleAmount);
      emit(state.copyWith(ingredients: ingredientList));
    } catch (e) {
      List<IngredientModel> ingredientList = [...state.ingredients];
      ingredientList[index] = ingredientList[index].copyWith(amount: null);
      emit(state.copyWith(ingredients: ingredientList));
    }
  }

  updateIngredientUnit(int index, String unit) {
    List<IngredientModel> ingredientList = [...state.ingredients];
    ingredientList[index] = ingredientList[index].copyWith(unit: unit);
    emit(state.copyWith(ingredients: ingredientList));
  }

  updateCategoryList(CategoryModel newCategory, bool status) {
    List<CategoryModel> categoryList = [...state.categories];
    final selected = categoryList.where((category) => category.id == newCategory.id);
    if (selected.isEmpty) {
      categoryList.add(newCategory);
    } else {
      categoryList.removeWhere((category) => category.id == newCategory.id);
    }
    emit(state.copyWith(categories: categoryList));
  }

  updateTagList(TagModel newTag, bool status) {
    List<TagModel> tagList = [...state.tags];
    final selected = tagList.where((tag) => tag.id == newTag.id);
    if (selected.isEmpty) {
      tagList.add(newTag);
    } else {
      tagList.removeWhere((tag) => tag.id == newTag.id);
    }
    emit(state.copyWith(tags: tagList));
  }

  Future<bool> submitRecipe(bool editMode, RecipeModel? editableRecipe) async {
    try {
      emit(state.copyWith(requestStatus: DirectusRequestStatus.loading));
      String? fileId;
      if (state.image != null) {
        String? mimeType = mime(state.image!.path);
        String mimee = mimeType!.split('/')[0];
        String type = mimeType.split('/')[1];

        final image = FormData.fromMap({
          'title': '${state.name}-${DateTime.now().toUtc().toString()}',
          'file': await MultipartFile.fromFile(state.image!.path, contentType: MediaType(mimee, type)),
          'upload_by': null,
          'modified_by': null,
        });

        final failureOrFile = await _recipesRepository.uploadImage(image);
        failureOrFile.fold(
          (error) {
            emit(state.copyWith(requestStatus: DirectusRequestStatus.error));
          },
          (file) {
            fileId = file.id!;
          },
        );
      }
      await finalizeSubmit(fileId, editMode, editableRecipe);
      if (editMode) {
        await fetchRecipeData(state.id);
      }
      return true;
    } catch (e) {
      emit(state.copyWith(requestStatus: DirectusRequestStatus.error));

      return false;
    }
  }

  finalizeSubmit(String? fileId, bool editMode, RecipeModel? editableRecipe) async {
    try {
      final pictureId = fileId ?? editableRecipe?.picture;
      final recipe = RecipeModel(
        id: state.id,
        difficulty: state.difficulty!.capitalize(),
        name: state.name!.capitalize(),
        preparationTime: state.preparationTime,
        shortDescription: state.shortDescription,
        instructions: state.instructions,
        categories: state.categories,
        tags: state.tags,
        ingredientGroups: state.ingredientGroups,
        blurhash: state.blurHash,
        picture: pictureId,
        status: "draft",
      );

      final recipePostRequestDTO = RecipeModel().fromDomain(recipe, editableRecipe);

      if (editMode && recipe.id != null) {
        final failureOrRecipe = await _recipesRepository.modifyRecipe(recipePostRequestDTO, recipe.id!);
        failureOrRecipe.fold(
          (error) => emit(state.copyWith(requestStatus: DirectusRequestStatus.error)),
          (recipe) async {
            emit(state.copyWith(requestStatus: DirectusRequestStatus.loaded));
            return;
          },
        );
      } else {
        final failureOrRecipe = await _recipesRepository.addRecipe(recipePostRequestDTO);
        failureOrRecipe.fold(
          (error) => emit(state.copyWith(requestStatus: DirectusRequestStatus.error)),
          (recipe) {
            emit(state.copyWith(requestStatus: DirectusRequestStatus.loaded));
            return;
          },
        );
      }
    } catch (e) {
      emit(state.copyWith(requestStatus: DirectusRequestStatus.error));
    }
  }

  fetchRecipeData(String? id) async {
    try {
      if (id == null) return;
      emit(state.copyWith(recipeFetchStatus: DirectusRequestStatus.loading));
      final errorOrRecipe = await _recipesRepository.getRecipeWithId(id: id);
      errorOrRecipe.fold(
        (err) => emit(state.copyWith(recipeFetchStatus: DirectusRequestStatus.error)),
        (recipe) {
          emit(state.copyWith(recipeFetchStatus: DirectusRequestStatus.loaded, recipe: recipe));
        },
      );
    } catch (e) {
      emit(state.copyWith(recipeFetchStatus: DirectusRequestStatus.error));
    }
  }
}
