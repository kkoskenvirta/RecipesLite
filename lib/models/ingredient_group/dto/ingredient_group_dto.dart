import 'package:flutter_e_commerce/models/ingredient_group/dto/ingredient_group_data_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_group_dto.freezed.dart';
part 'ingredient_group_dto.g.dart';

@freezed
class IngredientGroupDTO with _$IngredientGroupDTO {
  factory IngredientGroupDTO({
    @JsonKey(name: "data") required List<IngredientGroupDataDTO> data,
  }) = _IngredientGroupDTO;

  factory IngredientGroupDTO.fromJson(Map<String, dynamic> json) => _$IngredientGroupDTOFromJson(json);
}
