// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      recipesCount: json['recipesCount'] as String?,
      relationId: json['relationId'] as int?,
      picture: json['picture'] as String?,
      status: json['status'] as String?,
      blurhash: json['blurhash'] as String?,
      sort: json['sort'] as int?,
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'recipesCount': instance.recipesCount,
      'relationId': instance.relationId,
      'picture': instance.picture,
      'status': instance.status,
      'blurhash': instance.blurhash,
      'sort': instance.sort,
    };
