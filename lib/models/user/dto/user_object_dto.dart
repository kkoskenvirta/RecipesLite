import 'package:flutter_e_commerce/models/user/dto/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_object_dto.freezed.dart';
part 'user_object_dto.g.dart';

@freezed
class UserObjectDTO with _$UserObjectDTO {
  const factory UserObjectDTO({
    required UserDTO data,
  }) = _UserObjectDTO;

  factory UserObjectDTO.fromJson(Map<String, dynamic> json) => _$UserObjectDTOFromJson(json);
}
