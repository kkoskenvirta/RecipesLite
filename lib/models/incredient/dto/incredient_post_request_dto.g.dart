// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incredient_post_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IncredientPostRequestDTO _$$_IncredientPostRequestDTOFromJson(
        Map<String, dynamic> json) =>
    _$_IncredientPostRequestDTO(
      name: json['name'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$$_IncredientPostRequestDTOToJson(
        _$_IncredientPostRequestDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'unit': instance.unit,
    };
