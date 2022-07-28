import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/incredient/incredient_model.dart';
import 'package:flutter_e_commerce/models/recipe/dto/recipe_data_dto.dart';
import 'package:flutter_e_commerce/models/recipe/dto/recipe_dto.dart';
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

  updateRecipeImage(File tempImage) {
    try {
      emit(state.copyWith(image: tempImage));
    } catch (e) {
      emit(state.copyWith(status: FormDataStateStatus.error));
    }
  }

  updateBlurHash(String hash) {
    emit(state.copyWith(blurHash: hash));
    print(hash);
  }

  updateBlurHashStatus(BlurHashStatus status) {
    emit(state.copyWith(blurHashStatus: status));
  }

  addIncredient(String name, String amount, String unit) {
    print(name + amount.toString() + unit);
    List<IncredientModel> incredientList = [...state.incredients];
    print(incredientList);
    incredientList.add(IncredientModel(name: name, amount: double.parse(amount), unit: unit));
    print(incredientList);
    emit(state.copyWith(incredients: incredientList));

    print(state.incredients);
  }

  removeIncredient(index) {
    List<IncredientModel> incredientList = [...state.incredients];
    incredientList.removeAt(index);
    emit(state.copyWith(incredients: incredientList));
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

  updateIncredientName(int index, String name) {
    List<IncredientModel> incredientList = [...state.incredients];
    incredientList[index] = incredientList[index].copyWith(name: name);
    emit(state.copyWith(incredients: incredientList));
  }

  updateIncredientAmount(int index, String amount) {
    try {
      List<IncredientModel> incredientList = [...state.incredients];
      final doubleAmount = double.parse(amount);
      incredientList[index] = incredientList[index].copyWith(amount: doubleAmount);
      emit(state.copyWith(incredients: incredientList));
    } catch (e) {
      List<IncredientModel> incredientList = [...state.incredients];
      incredientList[index] = incredientList[index].copyWith(amount: null);
      emit(state.copyWith(incredients: incredientList));
    }
  }

  updateIncredientUnit(int index, String unit) {
    List<IncredientModel> incredientList = [...state.incredients];
    incredientList[index] = incredientList[index].copyWith(unit: unit);
    emit(state.copyWith(incredients: incredientList));
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

  Future<bool> submitRecipe() async {
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
      await finalizeSubmit(fileId);

      return true;
    } catch (e) {
      print(e);
      emit(state.copyWith(requestStatus: DirectusRequestStatus.error));
      print("ready to return");

      return false;
    }
  }

  finalizeSubmit(String? fileId) async {
    try {
      final recipe = RecipeModel(
        difficulty: state.difficulty!.capitalize(),
        name: state.name!.capitalize(),
        preparationTime: state.preparationTime,
        shortDescription: state.shortDescription,
        instructions: state.instructions,
        categories: state.categories,
        tags: state.tags,
        incredients: state.incredients,
        blurhash: state.blurHash,
        picture: fileId,
        status: "draft",
      );

      final recipePostRequestDTO = RecipeModel().fromDomain(recipe);
      final failureOrRecipe = await _recipesRepository.addRecipe(recipePostRequestDTO);
      failureOrRecipe.fold(
        (error) => emit(state.copyWith(requestStatus: DirectusRequestStatus.error)),
        (recipe) {
          print("recipe added");
          emit(state.copyWith(requestStatus: DirectusRequestStatus.loaded));
          return;
        },
      );
    } catch (e) {
      emit(state.copyWith(requestStatus: DirectusRequestStatus.error));
    }
  }
}
