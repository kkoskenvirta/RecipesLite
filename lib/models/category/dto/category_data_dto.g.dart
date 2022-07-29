// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryDataDTO _$$_CategoryDataDTOFromJson(Map<String, dynamic> json) =>
    _$_CategoryDataDTO(
      id: json['category_id'] as String,
      name: json['category_name'] as String? ?? '',
      picture: json['category_picture'] as String? ?? '',
      icon: json['category_icon'] as String? ?? '',
      blurhash: json['blurhash'] as String?,
      status: json['status'] as String?,
      sort: json['sort'] as String?,
    );

Map<String, dynamic> _$$_CategoryDataDTOToJson(_$_CategoryDataDTO instance) =>
    <String, dynamic>{
      'category_id': instance.id,
      'category_name': instance.name,
      'category_picture': instance.picture,
      'category_icon': instance.icon,
      'blurhash': instance.blurhash,
      'status': instance.status,
      'sort': instance.sort,
    };
