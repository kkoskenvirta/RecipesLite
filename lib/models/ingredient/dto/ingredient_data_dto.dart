import 'package:flutter_e_commerce/models/ingredient/ingredient_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_data_dto.freezed.dart';
part 'ingredient_data_dto.g.dart';

@freezed
class IngredientDataDTO with _$IngredientDataDTO {
  factory IngredientDataDTO({
    @JsonKey(name: 'ingredient_id') String? id,
    @Default('') String name,
    double? amount,
    @Default('gram') String unit,
    String? sort,
  }) = _IngredientDataDTO;

  const IngredientDataDTO._();

  factory IngredientDataDTO.fromJson(Map<String, dynamic> json) => _$IngredientDataDTOFromJson(json);

  IngredientModel toDomain() {
    return IngredientModel(id: id, name: name, amount: amount, unit: unit);
  }
}
