import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/favorite/dto/favorite_dto.dart';
import 'package:flutter_e_commerce/models/ingredient/dto/ingredient_id_dto.dart';
import 'package:flutter_e_commerce/models/ingredient/ingredient_model.dart';
import 'package:flutter_e_commerce/models/recipe/dto/recipe_post_request_dto.dart';
import 'package:flutter_e_commerce/models/relation_details.dart/relation_details.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class RecipeModel with _$RecipeModel {
  factory RecipeModel({
    String? id,
    String? difficulty,
    String? blurhash,
    String? picture,
    String? instructions,
    String? name,
    bool? featured,
    int? preparationTime,
    String? shortDescription,
    int? commentCount,
    String? status,
    double? rating,
    String? userCreated,
    List<IngredientModel>? ingredients,
    List<TagModel>? tags,
    List<CategoryModel>? categories,
    DateTime? dateCreated,
    dynamic dateUpdated,
  }) = _RecipeModel;

  const RecipeModel._();

  factory RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);

  RecipePostRequestDTO fromDomain(RecipeModel recipe, RecipeModel? editableRecipe) {
    List<int?> deleteIngredients = [];
    List<int?> updateingredients = [];
    List<int?> deleteCategories = [];
    List<int?> deleteTags = [];

    if (editableRecipe != null) {
      List<CategoryModel> deleteCategoriesList = [...editableRecipe.categories!];

      for (var newCategory in recipe.categories!) {
        if (newCategory.relationId != null) {
          final match = deleteCategoriesList.indexWhere(
            (oldCategory) => oldCategory.relationId == newCategory.relationId,
          );
          if (match != -1) {
            deleteCategoriesList.removeAt(match);
          }
        }
      }

      List<TagModel> deleteTagsList = [...editableRecipe.tags!];
      for (var newTag in recipe.tags!) {
        if (newTag.relationId != null) {
          final match = deleteTagsList.indexWhere(
            (oldTag) => oldTag.relationId == newTag.relationId,
          );
          if (match != -1) {
            deleteTagsList.removeAt(match);
          }
        }
      }

      List<IngredientModel> deleteIngredientsList = [...editableRecipe.ingredients!];

      for (var newIngredient in recipe.ingredients!) {
        if (newIngredient.relationId != null) {
          final match = deleteIngredientsList.indexWhere(
            (oldIngredient) => oldIngredient.relationId == newIngredient.relationId,
          );
          if (match != -1) {
            deleteIngredientsList.removeAt(match);
          }
        }
      }

      deleteCategories = deleteCategoriesList.map((category) => category.relationId).toList();
      deleteTags = deleteTagsList.map((tag) => tag.relationId).toList();
      deleteIngredients = deleteIngredientsList.map((ingredient) => ingredient.relationId).toList();
    }

    return RecipePostRequestDTO(
      difficulty: recipe.difficulty,
      name: recipe.name!,
      blurhash: recipe.blurhash,
      picture: recipe.picture,
      preparationTime: recipe.preparationTime,
      shortDescription: recipe.shortDescription,
      instructions: recipe.instructions!,
      categories: RelationDetails(
        create: recipe.categories!.where((category) => category.relationId == null).map((category) {
          final createObj = {};
          final categoryObj = {};
          categoryObj["id"] = category.id;
          createObj["recipe_id"] = "+";
          createObj["category_id"] = categoryObj;
          return createObj;
        }).toList(),
        delete: deleteCategories,
      ).toJson(),
      tags: RelationDetails(
        create: recipe.tags!.where((tag) => tag.relationId == null).map((tag) {
          final createObj = {};
          final tagObj = {};
          tagObj["id"] = tag.id;
          createObj["recipe_id"] = "+";
          createObj["tag_id"] = tagObj;
          return createObj;
        }).toList(),
        delete: deleteTags,
      ).toJson(),
      ingredients: RelationDetails(
        create: recipe.ingredients!.where((ingredient) => ingredient.relationId == null).map(
          (ingredient) {
            final createObj = {};
            final ingredientObj = {};
            ingredientObj["name"] = ingredient.name;
            ingredientObj["amount"] = ingredient.amount;
            ingredientObj["unit"] = ingredient.unit;
            createObj["ingredient_id"] = ingredientObj;
            return createObj;
          },
        ).toList(),
        update: recipe.ingredients!.where((ingredient) => ingredient.relationId != null).map(
          (ingredient) {
            if (editableRecipe != null) {
              final modifyRecipe = editableRecipe.ingredients
                  ?.firstWhere((editableingredient) => editableingredient.relationId == ingredient.relationId);
              if (modifyRecipe != null) {
                final mofidyObj = {};
                final ingredientObj = {};
                ingredientObj["name"] = ingredient.name;
                ingredientObj["amount"] = ingredient.amount;
                ingredientObj["unit"] = ingredient.unit;
                mofidyObj["id"] = ingredient.relationId;
                mofidyObj["ingredient_id"] = ingredientObj;
                return mofidyObj;
              }
            }
          },
        ).toList(),
        delete: deleteIngredients,
      ).toJson(),
    );
  }

  FavoriteDTO fromDomainToFavorite(RecipeModel recipe, String currentUser) {
    return FavoriteDTO(recipeId: recipe.id!, userId: currentUser);
  }
}
