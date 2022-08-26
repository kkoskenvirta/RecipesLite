// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDataDTO _$$_UserDataDTOFromJson(Map<String, dynamic> json) =>
    _$_UserDataDTO(
      id: json['id'] as String,
      userId: json['user'] as String,
      favorites: (json['favorites'] as List<dynamic>?)
          ?.map((e) => RecipeIdDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserDataDTOToJson(_$_UserDataDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.userId,
      'favorites': instance.favorites,
    };
