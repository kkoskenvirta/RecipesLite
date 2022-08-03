// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IngredientDTO _$$_IngredientDTOFromJson(Map<String, dynamic> json) =>
    _$_IngredientDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => IngredientDataDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_IngredientDTOToJson(_$_IngredientDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
