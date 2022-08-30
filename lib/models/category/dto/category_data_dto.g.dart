// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryDataDTO _$$_CategoryDataDTOFromJson(Map<String, dynamic> json) =>
    _$_CategoryDataDTO(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      picture: json['picture'] as String? ?? '',
      recipesCount: json['recipes_count'] as String?,
      blurhash: json['blurhash'] as String?,
      status: json['status'] as String?,
      sort: json['sort'] as int?,
    );

Map<String, dynamic> _$$_CategoryDataDTOToJson(_$_CategoryDataDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
      'recipes_count': instance.recipesCount,
      'blurhash': instance.blurhash,
      'status': instance.status,
      'sort': instance.sort,
    };
