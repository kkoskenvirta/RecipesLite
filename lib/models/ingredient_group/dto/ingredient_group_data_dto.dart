import 'package:flutter_e_commerce/models/ingredient/dto/ingredient_id_dto.dart';
import 'package:flutter_e_commerce/models/ingredient_group/ingredient_group_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_group_data_dto.freezed.dart';
part 'ingredient_group_data_dto.g.dart';

@freezed
class IngredientGroupDataDTO with _$IngredientGroupDataDTO {
  factory IngredientGroupDataDTO({
    String? id,
    List<IngredientIdDTO>? ingredients,
    @Default('') String name,
    String? sort,
  }) = _IngredientGroupDataDTO;

  const IngredientGroupDataDTO._();

  factory IngredientGroupDataDTO.fromJson(Map<String, dynamic> json) => _$IngredientGroupDataDTOFromJson(json);

  IngredientGroupModel toDomain() {
    return IngredientGroupModel(
      id: id,
      name: name,
      ingredients: ingredients != null ? ingredients!.map((ingredient) => ingredient.toDomain()).toList() : [],
    );
  }
}
