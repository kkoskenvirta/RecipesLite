import 'package:flutter_e_commerce/models/favorite/dto/favorite_data_dto.dart';
import 'package:flutter_e_commerce/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_dto.freezed.dart';
part 'user_data_dto.g.dart';

@freezed
class UserDataDTO with _$UserDataDTO {
  factory UserDataDTO({
    required String id,
    @JsonKey(name: 'user') required String userId,
    @JsonKey(name: 'favorites') required List<FavoriteDataDTO> favorites,
  }) = _UserDataDTO;

  const UserDataDTO._();

  factory UserDataDTO.fromJson(Map<String, dynamic> json) => _$UserDataDTOFromJson(json);

  UserModel toDomain() {
    return UserModel(
      id: id,
      userId: userId,
      favorites: favorites.map((favoriteDTO) => favoriteDTO.toDomain()).toList(),
    );
  }
}
