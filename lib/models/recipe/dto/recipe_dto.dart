import 'package:flutter_e_commerce/models/recipe/dto/recipe_data_dto.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_dto.freezed.dart';
part 'recipe_dto.g.dart';

@freezed
class RecipeDTO with _$RecipeDTO {
  factory RecipeDTO({
    @JsonKey(name: "data") required List<RecipeDataDTO> data,
  }) = _RecipeDTO;

  factory RecipeDTO.fromJson(Map<String, dynamic> json) => _$RecipeDTOFromJson(json);
}
