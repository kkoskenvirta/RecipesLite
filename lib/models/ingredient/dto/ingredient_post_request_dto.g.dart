// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_post_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IngredientPostRequestDTO _$$_IngredientPostRequestDTOFromJson(
        Map<String, dynamic> json) =>
    _$_IngredientPostRequestDTO(
      name: json['name'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$$_IngredientPostRequestDTOToJson(
        _$_IngredientPostRequestDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'unit': instance.unit,
    };
