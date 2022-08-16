// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IngredientDataDTO _$$_IngredientDataDTOFromJson(Map<String, dynamic> json) =>
    _$_IngredientDataDTO(
      id: json['ingredient_id'] as String?,
      name: json['name'] as String? ?? '',
      amount: json['amount'] as String,
      unit: json['unit'] as String? ?? 'gram',
      sort: json['sort'] as String?,
    );

Map<String, dynamic> _$$_IngredientDataDTOToJson(
        _$_IngredientDataDTO instance) =>
    <String, dynamic>{
      'ingredient_id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'unit': instance.unit,
      'sort': instance.sort,
    };
