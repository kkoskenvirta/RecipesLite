import 'package:flutter_e_commerce/models/incredient/incredient_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'incredient_data_dto.freezed.dart';
part 'incredient_data_dto.g.dart';

@freezed
class IncredientDataDTO with _$IncredientDataDTO {
  factory IncredientDataDTO({
    @JsonKey(name: 'incredient_id') String? id,
    @Default('') String name,
    double? amount,
    @Default('gram') String unit,
    String? sort,
  }) = _IncredientDataDTO;

  const IncredientDataDTO._();

  factory IncredientDataDTO.fromJson(Map<String, dynamic> json) => _$IncredientDataDTOFromJson(json);

  IncredientModel toDomain() {
    return IncredientModel(id: id, name: name, amount: amount, unit: unit);
  }
}
