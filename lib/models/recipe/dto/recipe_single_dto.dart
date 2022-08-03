import 'package:flutter_e_commerce/models/recipe/dto/recipe_data_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_single_dto.freezed.dart';
part 'recipe_single_dto.g.dart';

@freezed
class RecipeSingleDTO with _$RecipeSingleDTO {
  factory RecipeSingleDTO({
    @JsonKey(name: "data") required RecipeDataDTO data,
  }) = _RecipeSingleDTO;

  factory RecipeSingleDTO.fromJson(Map<String, dynamic> json) => _$RecipeSingleDTOFromJson(json);
}
