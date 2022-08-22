import 'package:flutter_e_commerce/models/ingredient/dto/ingredient_data_dto.dart';
import 'package:flutter_e_commerce/models/ingredient/ingredient_model.dart';
import 'package:flutter_e_commerce/models/ingredient_group/dto/ingredient_group_data_dto.dart';
import 'package:flutter_e_commerce/models/ingredient_group/ingredient_group_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_group_id_dto.freezed.dart';
part 'ingredient_group_id_dto.g.dart';

@freezed
class IngredientGroupIdDTO with _$IngredientGroupIdDTO {
  factory IngredientGroupIdDTO({
    @JsonKey(name: "id") required int relationId,
    @JsonKey(name: "ingredient_group_id") required IngredientGroupDataDTO ingredientGroup,
  }) = _IngredientGroupIdDTO;

  const IngredientGroupIdDTO._();

  factory IngredientGroupIdDTO.fromJson(Map<String, dynamic> json) => _$IngredientGroupIdDTOFromJson(json);

  IngredientGroupModel toDomain() {
    return IngredientGroupModel(
      id: ingredientGroup.id,
      relationId: relationId,
      name: ingredientGroup.name,
      ingredients: ingredientGroup.ingredients != null
          ? ingredientGroup.ingredients!.map((ingredient) => ingredient.toDomain()).toList()
          : [],
    );
  }
}
