// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_group_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IngredientGroupDataDTO _$$_IngredientGroupDataDTOFromJson(
        Map<String, dynamic> json) =>
    _$_IngredientGroupDataDTO(
      id: json['id'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => IngredientIdDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String? ?? '',
      sort: json['sort'] as String?,
    );

Map<String, dynamic> _$$_IngredientGroupDataDTOToJson(
        _$_IngredientGroupDataDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ingredients': instance.ingredients,
      'name': instance.name,
      'sort': instance.sort,
    };
