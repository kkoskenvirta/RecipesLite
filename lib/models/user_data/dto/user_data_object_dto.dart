import 'package:flutter_e_commerce/models/user_data/dto/user_data_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_object_dto.freezed.dart';
part 'user_data_object_dto.g.dart';

@freezed
class UserDataObjectDTO with _$UserDataObjectDTO {
  const factory UserDataObjectDTO({
    required UserDataDTO data,
  }) = _UserDataObjectDTO;

  factory UserDataObjectDTO.fromJson(Map<String, dynamic> json) => _$UserDataObjectDTOFromJson(json);
}
