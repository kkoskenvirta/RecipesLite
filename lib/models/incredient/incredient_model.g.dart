// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IncredientModel _$$_IncredientModelFromJson(Map<String, dynamic> json) =>
    _$_IncredientModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$$_IncredientModelToJson(_$_IncredientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'unit': instance.unit,
    };
