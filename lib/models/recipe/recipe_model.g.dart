// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeModel _$$_RecipeModelFromJson(Map<String, dynamic> json) =>
    _$_RecipeModel(
      id: json['id'] as String,
      status: json['status'] as String,
      difficulty: json['difficulty'] as String,
      rating: (json['rating'] as num).toDouble(),
      picture: json['picture'] as String,
      instructions: json['instructions'] as String,
      name: json['name'] as String,
      featured: json['featured'] as bool,
      preparationTime: json['preparationTime'] as int,
      shortDescription: json['shortDescription'] as String,
      commentCount: json['commentCount'] as int,
      userCreated: json['userCreated'] as String,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      dateUpdated: json['dateUpdated'],
    );

Map<String, dynamic> _$$_RecipeModelToJson(_$_RecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'difficulty': instance.difficulty,
      'rating': instance.rating,
      'picture': instance.picture,
      'instructions': instance.instructions,
      'name': instance.name,
      'featured': instance.featured,
      'preparationTime': instance.preparationTime,
      'shortDescription': instance.shortDescription,
      'commentCount': instance.commentCount,
      'userCreated': instance.userCreated,
      'dateCreated': instance.dateCreated.toIso8601String(),
      'dateUpdated': instance.dateUpdated,
    };
