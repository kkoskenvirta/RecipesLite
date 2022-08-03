// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_post_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ingredientPostRequestDTO _$$_ingredientPostRequestDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ingredientPostRequestDTO(
      name: json['name'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$$_ingredientPostRequestDTOToJson(
        _$_ingredientPostRequestDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'unit': instance.unit,
    };
