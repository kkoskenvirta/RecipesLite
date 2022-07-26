// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incredient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IncredientDTO _$$_IncredientDTOFromJson(Map<String, dynamic> json) =>
    _$_IncredientDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => IncredientDataDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_IncredientDTOToJson(_$_IncredientDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
