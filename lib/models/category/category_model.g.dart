// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      picture: json['picture'] as String?,
      status: json['status'] as String?,
      icon: json['icon'] as String?,
      sort: json['sort'] as String?,
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
      'status': instance.status,
      'icon': instance.icon,
      'sort': instance.sort,
    };
