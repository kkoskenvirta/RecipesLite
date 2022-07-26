// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TagDTO _$$_TagDTOFromJson(Map<String, dynamic> json) => _$_TagDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => TagDataDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TagDTOToJson(_$_TagDTO instance) => <String, dynamic>{
      'data': instance.data,
    };
