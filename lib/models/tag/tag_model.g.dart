// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TagModel _$$_TagModelFromJson(Map<String, dynamic> json) => _$_TagModel(
      id: json['id'] as String,
      name: json['name'] as String,
      relationId: json['relationId'] as int?,
      status: json['status'] as String?,
      sort: json['sort'] as String?,
    );

Map<String, dynamic> _$$_TagModelToJson(_$_TagModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'relationId': instance.relationId,
      'status': instance.status,
      'sort': instance.sort,
    };
