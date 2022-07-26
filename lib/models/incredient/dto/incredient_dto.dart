import 'package:flutter_e_commerce/models/incredient/dto/incredient_data_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'incredient_dto.freezed.dart';
part 'incredient_dto.g.dart';

@freezed
class IncredientDTO with _$IncredientDTO {
  const factory IncredientDTO({
    required List<IncredientDataDTO> data,
  }) = _IncredientDTO;

  factory IncredientDTO.fromJson(Map<String, dynamic> json) => _$IncredientDTOFromJson(json);
}
