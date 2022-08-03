import 'package:flutter_e_commerce/models/ingredient/dto/ingredient_data_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_dto.freezed.dart';
part 'ingredient_dto.g.dart';

@freezed
class IngredientDTO with _$IngredientDTO {
  const factory IngredientDTO({
    required List<IngredientDataDTO> data,
  }) = _IngredientDTO;

  factory IngredientDTO.fromJson(Map<String, dynamic> json) => _$IngredientDTOFromJson(json);
}
