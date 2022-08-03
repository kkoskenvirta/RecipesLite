// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IngredientModel _$$_IngredientModelFromJson(Map<String, dynamic> json) =>
    _$_IngredientModel(
      id: json['id'] as String?,
      relationId: json['relationId'] as int?,
      name: json['name'] as String,
      amount: (json['amount'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$$_IngredientModelToJson(_$_IngredientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'relationId': instance.relationId,
      'name': instance.name,
      'amount': instance.amount,
      'unit': instance.unit,
    };
