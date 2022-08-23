// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_post_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipePostRequestDTO _$$_RecipePostRequestDTOFromJson(
        Map<String, dynamic> json) =>
    _$_RecipePostRequestDTO(
      difficulty: json['difficulty'] as String?,
      blurhash: json['blurhash'] as String?,
      picture: json['picture'] as String?,
      instructions: json['instructions'] as String,
      categories: json['categories'] as Map<String, dynamic>,
      tags: json['tags'] as Map<String, dynamic>,
      name: json['name'] as String,
      ingredientGroups: json['ingredient_groups'] as Map<String, dynamic>,
      preparationTime: json['preparation_time'] as int?,
      shortDescription: json['short_description'] as String?,
    );

Map<String, dynamic> _$$_RecipePostRequestDTOToJson(
        _$_RecipePostRequestDTO instance) =>
    <String, dynamic>{
      'difficulty': instance.difficulty,
      'blurhash': instance.blurhash,
      'picture': instance.picture,
      'instructions': instance.instructions,
      'categories': instance.categories,
      'tags': instance.tags,
      'name': instance.name,
      'ingredient_groups': instance.ingredientGroups,
      'preparation_time': instance.preparationTime,
      'short_description': instance.shortDescription,
    };
