// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeDTO _$$_RecipeDTOFromJson(Map<String, dynamic> json) => _$_RecipeDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => RecipeDataDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecipeDTOToJson(_$_RecipeDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
