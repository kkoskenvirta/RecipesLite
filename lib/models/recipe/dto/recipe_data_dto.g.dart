// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeDataDTO _$$_RecipeDataDTOFromJson(Map<String, dynamic> json) =>
    _$_RecipeDataDTO(
      id: json['id'] as String,
      status: json['status'] as String,
      difficulty: json['difficulty'] as String,
      rating: (json['rating'] as num).toDouble(),
      picture: json['picture'] as String,
      instructions: json['instructions'] as String? ?? '',
      name: json['Name'] as String,
      featured: json['Featured'] as bool,
      preparationTime: json['preparation_time'] as int,
      shortDescription: json['short_description'] as String,
      commentCount: json['comment_count'] as int,
      userCreated: json['user_created'] as String,
      dateCreated: DateTime.parse(json['date_created'] as String),
      dateUpdated: json['date_updated'],
    );

Map<String, dynamic> _$$_RecipeDataDTOToJson(_$_RecipeDataDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'difficulty': instance.difficulty,
      'rating': instance.rating,
      'picture': instance.picture,
      'instructions': instance.instructions,
      'Name': instance.name,
      'Featured': instance.featured,
      'preparation_time': instance.preparationTime,
      'short_description': instance.shortDescription,
      'comment_count': instance.commentCount,
      'user_created': instance.userCreated,
      'date_created': instance.dateCreated.toIso8601String(),
      'date_updated': instance.dateUpdated,
    };
