// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeModel _$$_RecipeModelFromJson(Map<String, dynamic> json) =>
    _$_RecipeModel(
      id: json['id'] as String?,
      difficulty: json['difficulty'] as String?,
      blurhash: json['blurhash'] as String?,
      picture: json['picture'] as String?,
      instructions: json['instructions'] as String?,
      name: json['name'] as String?,
      favoritesCount: json['favoritesCount'] as String?,
      featured: json['featured'] as bool?,
      preparationTime: json['preparationTime'] as int?,
      shortDescription: json['shortDescription'] as String?,
      commentCount: json['commentCount'] as int?,
      status: json['status'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      userCreated: json['userCreated'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => TagModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateCreated: json['dateCreated'] == null
          ? null
          : DateTime.parse(json['dateCreated'] as String),
      dateUpdated: json['dateUpdated'],
    );

Map<String, dynamic> _$$_RecipeModelToJson(_$_RecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'difficulty': instance.difficulty,
      'blurhash': instance.blurhash,
      'picture': instance.picture,
      'instructions': instance.instructions,
      'name': instance.name,
      'favoritesCount': instance.favoritesCount,
      'featured': instance.featured,
      'preparationTime': instance.preparationTime,
      'shortDescription': instance.shortDescription,
      'commentCount': instance.commentCount,
      'status': instance.status,
      'rating': instance.rating,
      'userCreated': instance.userCreated,
      'ingredients': instance.ingredients,
      'tags': instance.tags,
      'categories': instance.categories,
      'dateCreated': instance.dateCreated?.toIso8601String(),
      'dateUpdated': instance.dateUpdated,
    };
