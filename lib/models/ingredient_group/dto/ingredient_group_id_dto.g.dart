// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_group_id_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IngredientGroupIdDTO _$$_IngredientGroupIdDTOFromJson(
        Map<String, dynamic> json) =>
    _$_IngredientGroupIdDTO(
      relationId: json['id'] as int,
      ingredientGroup: IngredientGroupDataDTO.fromJson(
          json['ingredient_group_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_IngredientGroupIdDTOToJson(
        _$_IngredientGroupIdDTO instance) =>
    <String, dynamic>{
      'id': instance.relationId,
      'ingredient_group_id': instance.ingredientGroup,
    };
