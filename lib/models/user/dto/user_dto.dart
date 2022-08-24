import 'package:flutter_e_commerce/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  factory UserDTO({
    required String id,
    required String email,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") String? lastName,
    String? password,
    String? location,
    String? title,
    String? description,
    List<String>? tags,
    String? avatar,
    String? language,
    String? theme,
    String? status,
    String? role,
  }) = _UserDTO;

  const UserDTO._();

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  UserModel toDomain() {
    return UserModel(id: id, username: firstName, email: email, avatar: avatar);
  }
}
