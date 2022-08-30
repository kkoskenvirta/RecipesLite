// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_id_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryIdDTO _$$_CategoryIdDTOFromJson(Map<String, dynamic> json) =>
    _$_CategoryIdDTO(
      relationId: json['id'] as int?,
      category:
          CategoryDataDTO.fromJson(json['category_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CategoryIdDTOToJson(_$_CategoryIdDTO instance) =>
    <String, dynamic>{
      'id': instance.relationId,
      'category_id': instance.category,
    };
