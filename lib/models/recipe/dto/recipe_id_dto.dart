import 'package:flutter_e_commerce/models/recipe/dto/recipe_data_dto.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_id_dto.freezed.dart';
part 'recipe_id_dto.g.dart';

@freezed
class RecipeIdDTO with _$RecipeIdDTO {
  factory RecipeIdDTO({@JsonKey(name: "recipe_id") required RecipeDataDTO recipe}) = _RecipeIdDTO;

  const RecipeIdDTO._();

  factory RecipeIdDTO.fromJson(Map<String, dynamic> json) => _$RecipeIdDTOFromJson(json);

  RecipeModel toDomain() {
    return recipe.toDomain();
  }
}
