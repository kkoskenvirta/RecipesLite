// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TagDataDTO _$$_TagDataDTOFromJson(Map<String, dynamic> json) =>
    _$_TagDataDTO(
      id: json['id'] as String,
      name: json['tag_name'] as String? ?? '',
      status: json['status'] as String?,
      sort: json['sort'] as String?,
    );

Map<String, dynamic> _$$_TagDataDTOToJson(_$_TagDataDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tag_name': instance.name,
      'status': instance.status,
      'sort': instance.sort,
    };
