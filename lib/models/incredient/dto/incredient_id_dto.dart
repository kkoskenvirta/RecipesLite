import 'package:flutter_e_commerce/models/incredient/dto/incredient_data_dto.dart';
import 'package:flutter_e_commerce/models/incredient/incredient_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'incredient_id_dto.freezed.dart';
part 'incredient_id_dto.g.dart';

@freezed
class IncredientIdDTO with _$IncredientIdDTO {
  factory IncredientIdDTO({@JsonKey(name: "incredient_id") required IncredientDataDTO incredient}) = _IncredientIdDTO;

  const IncredientIdDTO._();

  factory IncredientIdDTO.fromJson(Map<String, dynamic> json) => _$IncredientIdDTOFromJson(json);

  IncredientModel toDomain() {
    return incredient.toDomain();
  }
}
