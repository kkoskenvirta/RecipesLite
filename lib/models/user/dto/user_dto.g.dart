// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDTO _$$_UserDTOFromJson(Map<String, dynamic> json) => _$_UserDTO(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      password: json['password'] as String?,
      location: json['location'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      avatar: json['avatar'] as String?,
      language: json['language'] as String?,
      theme: json['theme'] as String?,
      status: json['status'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$_UserDTOToJson(_$_UserDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'password': instance.password,
      'location': instance.location,
      'title': instance.title,
      'description': instance.description,
      'tags': instance.tags,
      'avatar': instance.avatar,
      'language': instance.language,
      'theme': instance.theme,
      'status': instance.status,
      'role': instance.role,
    };
