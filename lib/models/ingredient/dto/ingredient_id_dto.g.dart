// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_id_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IngredientIdDTO _$$_IngredientIdDTOFromJson(Map<String, dynamic> json) =>
    _$_IngredientIdDTO(
      relationId: json['id'] as int?,
      ingredient: IngredientDataDTO.fromJson(
          json['ingredient_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_IngredientIdDTOToJson(_$_IngredientIdDTO instance) =>
    <String, dynamic>{
      'id': instance.relationId,
      'ingredient_id': instance.ingredient,
    };
