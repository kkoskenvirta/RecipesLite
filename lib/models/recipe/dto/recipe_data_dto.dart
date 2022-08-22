import 'package:flutter_e_commerce/models/category/dto/category_id_dto.dart';
import 'package:flutter_e_commerce/models/ingredient/dto/ingredient_id_dto.dart';
import 'package:flutter_e_commerce/models/ingredient_group/dto/ingredient_group_id_dto.dart';

import 'package:flutter_e_commerce/models/tag/dto/tag_id_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../recipe_model.dart';

part 'recipe_data_dto.freezed.dart';
part 'recipe_data_dto.g.dart';

@freezed
class RecipeDataDTO with _$RecipeDataDTO {
  factory RecipeDataDTO({
    String? id,
    String? status,
    String? difficulty,
    double? rating,
    String? blurhash,
    String? picture,
    @Default('') String instructions,
    List<CategoryIdDTO>? categories,
    List<TagIdDTO>? tags,
    List<IngredientIdDTO>? ingredients,
    String? name,
    bool? featured,
    @JsonKey(name: 'ingredient_groups') List<IngredientGroupIdDTO>? ingredientGroups,
    @JsonKey(name: 'favorites_count') String? favoritesCount,
    @JsonKey(name: 'preparation_time') int? preparationTime,
    @JsonKey(name: 'short_description') String? shortDescription,
    @JsonKey(name: 'comment_count') int? commentCount,
    @JsonKey(name: 'user_created') String? userCreated,
    @JsonKey(name: 'date_created') DateTime? dateCreated,
    @JsonKey(name: 'date_updated') dynamic dateUpdated,
  }) = _RecipeDataDTO;

  const RecipeDataDTO._();

  factory RecipeDataDTO.fromJson(Map<String, dynamic> json) => _$RecipeDataDTOFromJson(json);

  RecipeModel toDomain() {
    return RecipeModel(
      id: id,
      dateCreated: dateCreated,
      dateUpdated: dateUpdated,
      commentCount: commentCount,
      favoritesCount: favoritesCount,
      difficulty: difficulty,
      featured: featured,
      name: name,
      blurhash: blurhash,
      picture: picture,
      preparationTime: preparationTime,
      rating: rating,
      shortDescription: shortDescription,
      status: status,
      userCreated: userCreated,
      instructions: instructions,
      categories: categories != null ? categories!.map((category) => category.toDomain()).toList() : [],
      tags: tags != null ? tags!.map((tag) => tag.toDomain()).toList() : [],
      ingredients: ingredients != null ? ingredients!.map((ingredient) => ingredient.toDomain()).toList() : [],
      ingredientGroups: ingredientGroups != null
          ? ingredientGroups!.map((ingredientGroup) => ingredientGroup.toDomain()).toList()
          : [],
    );
  }
}
