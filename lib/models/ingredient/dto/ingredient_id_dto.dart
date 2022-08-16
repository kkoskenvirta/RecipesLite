import 'package:flutter_e_commerce/models/ingredient/dto/ingredient_data_dto.dart';
import 'package:flutter_e_commerce/models/ingredient/ingredient_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_id_dto.freezed.dart';
part 'ingredient_id_dto.g.dart';

@freezed
class IngredientIdDTO with _$IngredientIdDTO {
  factory IngredientIdDTO({
    @JsonKey(name: "id") required int relationId,
    @JsonKey(name: "ingredient_id") required IngredientDataDTO ingredient,
  }) = _IngredientIdDTO;

  const IngredientIdDTO._();

  factory IngredientIdDTO.fromJson(Map<String, dynamic> json) => _$IngredientIdDTOFromJson(json);

  IngredientModel toDomain() {
    return IngredientModel(
      id: ingredient.id,
      relationId: relationId,
      name: ingredient.name,
      amount: double.parse(ingredient.amount),
      unit: ingredient.unit,
    );
  }
}
