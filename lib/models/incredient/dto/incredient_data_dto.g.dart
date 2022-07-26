// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incredient_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IncredientDataDTO _$$_IncredientDataDTOFromJson(Map<String, dynamic> json) =>
    _$_IncredientDataDTO(
      id: json['incredient_id'] as String?,
      name: json['name'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble(),
      unit: json['unit'] as String? ?? 'gram',
      status: json['status'] as String?,
      sort: json['sort'] as String?,
    );

Map<String, dynamic> _$$_IncredientDataDTOToJson(
        _$_IncredientDataDTO instance) =>
    <String, dynamic>{
      'incredient_id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'unit': instance.unit,
      'status': instance.status,
      'sort': instance.sort,
    };
