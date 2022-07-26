import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/category/dto/category_data_dto.dart';
import 'package:flutter_e_commerce/models/category/dto/category_id_dto.dart';
import 'package:flutter_e_commerce/models/incredient/dto/incredient_data_dto.dart';
import 'package:flutter_e_commerce/models/incredient/dto/incredient_id_dto.dart';
import 'package:flutter_e_commerce/models/incredient/incredient_model.dart';
import 'package:flutter_e_commerce/models/recipe/dto/recipe_data_dto.dart';
import 'package:flutter_e_commerce/models/tag/dto/tag_data_dto.dart';
import 'package:flutter_e_commerce/models/tag/dto/tag_id_dto.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_model.freezed.dart';
// part 'recipe_model.g.dart';

@freezed
class RecipeModel with _$RecipeModel {
  factory RecipeModel({
    String? id,
    String? difficulty,
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

  // factory RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);

  RecipeDataDTO fromDomain(RecipeModel recipe) {
    return RecipeDataDTO(
      dateCreated: DateTime.now().toUtc(),
      dateUpdated: DateTime.now().toUtc(),
      commentCount: 0,
      difficulty: recipe.difficulty,
      featured: false,
      name: recipe.name!,
      picture: "",
      preparationTime: recipe.preparationTime,
      rating: 0,
      shortDescription: recipe.shortDescription,
      status: "draft",
      instructions: recipe.instructions!,
      categories:
          recipe.categories!.map((category) => CategoryIdDTO(category: CategoryDataDTO(id: category.id))).toList(),
      tags: recipe.tags!.map((tag) => TagIdDTO(tag: TagDataDTO(id: tag.id))).toList(),
      incredients: recipe.incredients!
          .map(
            (incredient) => IncredientIdDTO(
              incredient: IncredientDataDTO(
                name: incredient.name!,
                amount: incredient.amount,
                unit: incredient.unit!,
              ),
            ),
          )
          .toList(),
    );
  }
}
