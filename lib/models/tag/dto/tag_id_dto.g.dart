// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_id_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TagIdDTO _$$_TagIdDTOFromJson(Map<String, dynamic> json) => _$_TagIdDTO(
      relationId: json['id'] as int?,
      tag: TagDataDTO.fromJson(json['tag_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TagIdDTOToJson(_$_TagIdDTO instance) =>
    <String, dynamic>{
      'id': instance.relationId,
      'tag_id': instance.tag,
    };
