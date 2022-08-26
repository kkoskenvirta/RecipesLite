import 'package:collection/collection.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/favorite/dto/favorite_dto.dart';
import 'package:flutter_e_commerce/models/ingredient/ingredient_model.dart';
import 'package:flutter_e_commerce/models/ingredient_group/ingredient_group_model.dart';
import 'package:flutter_e_commerce/models/recipe/dto/recipe_post_request_dto.dart';
import 'package:flutter_e_commerce/models/relation_details.dart/relation_details.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    String? favoritesCount,
    bool? featured,
    int? preparationTime,
    String? shortDescription,
    int? commentCount,
    String? status,
    double? rating,
    String? userCreated,
    List<IngredientGroupModel>? ingredientGroups,
    List<TagModel>? tags,
    List<CategoryModel>? categories,
    DateTime? dateCreated,
    dynamic dateUpdated,
  }) = _RecipeModel;

  const RecipeModel._();

  factory RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);

  RecipePostRequestDTO fromDomain(RecipeModel recipe, RecipeModel? editableRecipe) {
    List<int?> deleteIngredientGroups = [];
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

      List<IngredientGroupModel> deleteIngredientGroupsList = [...editableRecipe.ingredientGroups!];
      for (var newGroup in recipe.ingredientGroups!) {
        if (newGroup.relationId != null) {
          final match = deleteIngredientGroupsList.indexWhere(
            (oldGroup) => oldGroup.relationId == newGroup.relationId,
          );
          if (match != -1) {
            deleteIngredientGroupsList.removeAt(match);
          }
        }
      }
      deleteCategories = deleteCategoriesList.map((category) => category.relationId).toList();
      deleteTags = deleteTagsList.map((tag) => tag.relationId).toList();
      deleteIngredientGroups = deleteIngredientGroupsList.map((group) => group.relationId).toList();
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
      ingredientGroups: RelationDetails(
        create: recipe.ingredientGroups!.where((group) => group.relationId == null).map(
          (group) {
            final createObj = {};
            final groupObj = {};
            groupObj["name"] = group.name;
            groupObj["ingredients"] = RelationDetails(
              create: group.ingredients.map(
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
              update: [],
              delete: [],
            ).toJson();
            createObj["ingredient_group_id"] = groupObj;
            return createObj;
          },
        ).toList(),
        update: recipe.ingredientGroups!.where((ingredient) => ingredient.relationId != null).mapIndexed(
          (index, group) {
            List<int?> deleteIngredients = [];
            if (editableRecipe != null) {
              List<IngredientModel> deleteIngredientsList = [...editableRecipe.ingredientGroups![index].ingredients];
              for (var newIngredient in recipe.ingredientGroups![index].ingredients) {
                if (newIngredient.relationId != null) {
                  final match = deleteIngredientsList.indexWhere(
                    (oldIngredient) => oldIngredient.relationId == newIngredient.relationId,
                  );
                  if (match != -1) {
                    deleteIngredientsList.removeAt(match);
                  }
                }
              }
              deleteIngredients = deleteIngredientsList.map((ingredient) => ingredient.relationId).toList();
            }

            final mofidyObj = {};
            final groupObj = {};
            groupObj["id"] = group.id;
            groupObj["name"] = group.name;
            groupObj["ingredients"] = RelationDetails(
              create: group.ingredients.where((ingredient) => ingredient.relationId == null).map(
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
              update: group.ingredients.where((ingredient) => ingredient.relationId != null).map(
                (ingredient) {
                  if (editableRecipe != null) {
                    try {
                      // final modifyRecipe = editableRecipe.ingredientGroups![index].ingredients
                      //     .firstWhere((editableingredient) => editableingredient.relationId == ingredient.relationId);
                      final mofidyObj = {};
                      final ingredientObj = {};
                      ingredientObj["name"] = ingredient.name;
                      ingredientObj["amount"] = ingredient.amount;
                      ingredientObj["unit"] = ingredient.unit;
                      ingredientObj["id"] = ingredient.id;
                      mofidyObj["id"] = ingredient.relationId;
                      mofidyObj["ingredient_id"] = ingredientObj;
                      return mofidyObj;
                    } catch (e) {
                      print(e);
                    }
                  }
                },
              ).toList(),
              delete: deleteIngredients,
            ).toJson();
            mofidyObj["id"] = group.relationId;
            mofidyObj["ingredient_group_id"] = groupObj;
            return mofidyObj;
          },
        ).toList(),
        delete: deleteIngredientGroups,
      ).toJson(),
    );
  }

  FavoriteDTO fromDomainToFavorite(RecipeModel recipe, String currentUser) {
    return FavoriteDTO(recipeId: recipe.id!, userId: currentUser);
  }
}
