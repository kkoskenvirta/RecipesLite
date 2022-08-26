// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IngredientGroupDTO _$$_IngredientGroupDTOFromJson(
        Map<String, dynamic> json) =>
    _$_IngredientGroupDTO(
      data: (json['data'] as List<dynamic>)
          .map(
              (e) => IngredientGroupDataDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_IngredientGroupDTOToJson(
        _$_IngredientGroupDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
