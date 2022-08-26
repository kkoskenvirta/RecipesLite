// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthDataDTO _$$_AuthDataDTOFromJson(Map<String, dynamic> json) =>
    _$_AuthDataDTO(
      expires: json['expires'] as int,
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$$_AuthDataDTOToJson(_$_AuthDataDTO instance) =>
    <String, dynamic>{
      'expires': instance.expires,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
