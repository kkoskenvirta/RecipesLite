import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/favorite/dto/favorite_dto.dart';
import 'package:flutter_e_commerce/models/incredient/incredient_model.dart';
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
    bool? featured,
    int? preparationTime,
    String? shortDescription,
    int? commentCount,
    String? status,
    double? rating,
    String? userCreated,
    List<IncredientModel>? incredients,
    List<TagModel>? tags,
    List<CategoryModel>? categories,
    DateTime? dateCreated,
    dynamic dateUpdated,
  }) = _RecipeModel;

  const RecipeModel._();

  factory RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);

  RecipePostRequestDTO fromDomain(RecipeModel recipe) {
    return RecipePostRequestDTO(
      difficulty: recipe.difficulty,
      name: recipe.name!,
      blurhash: recipe.blurhash,
      picture: recipe.picture,
      preparationTime: recipe.preparationTime,
      shortDescription: recipe.shortDescription,
      instructions: recipe.instructions!,
      categories: RelationDetails(
        create: recipe.categories!.map((category) {
          final createObj = {};
          final categoryObj = {};
          categoryObj["category_id"] = category.id;
          createObj["recipe_id"] = "+";
          createObj["category_category_id"] = categoryObj;
          return createObj;
        }).toList(),
      ).toJson(),
      tags: RelationDetails(
        create: recipe.tags!.map((tag) {
          final createObj = {};
          final tagObj = {};
          tagObj["id"] = tag.id;
          createObj["recipe_id"] = "+";
          createObj["tag_id"] = tagObj;
          return createObj;
        }).toList(),
      ).toJson(),
      incredients: RelationDetails(
        create: recipe.incredients!.map(
          (incredient) {
            final createObj = {};
            final incredientObj = {};
            incredientObj["name"] = incredient.name;
            incredientObj["amount"] = incredient.amount;
            incredientObj["unit"] = incredient.unit;
            createObj["incredient_id"] = incredientObj;
            return createObj;
          },
        ).toList(),
      ).toJson(),
    );
  }

  FavoriteDTO fromDomainToFavorite(RecipeModel recipe, String currentUser) {
    return FavoriteDTO(recipeId: recipe.id!, userId: currentUser);
  }
}
