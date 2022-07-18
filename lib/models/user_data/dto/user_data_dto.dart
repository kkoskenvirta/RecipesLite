import 'package:flutter_e_commerce/models/recipe/dto/recipe_id_dto.dart';
import 'package:flutter_e_commerce/models/user_data/user_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_dto.freezed.dart';
part 'user_data_dto.g.dart';

@freezed
class UserDataDTO with _$UserDataDTO {
  factory UserDataDTO({
    required String id,
    @JsonKey(name: 'user') required String userId,
    @JsonKey(name: 'favorites') required List<RecipeIdDTO> favorites,
  }) = _UserDataDTO;

  const UserDataDTO._();

  factory UserDataDTO.fromJson(Map<String, dynamic> json) => _$UserDataDTOFromJson(json);

  UserDataModel toDomain() {
    return UserDataModel(
      id: id,
      userId: userId,
      favorites: favorites.map((favorite) => favorite.toDomain()).toList(),
    );
  }
}
