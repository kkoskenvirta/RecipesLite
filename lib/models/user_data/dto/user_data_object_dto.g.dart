// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_object_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDataObjectDTO _$$_UserDataObjectDTOFromJson(Map<String, dynamic> json) =>
    _$_UserDataObjectDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => UserDataDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserDataObjectDTOToJson(
        _$_UserDataObjectDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
