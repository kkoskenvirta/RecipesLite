import 'package:flutter_e_commerce/models/tag/dto/tag_data_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_dto.freezed.dart';
part 'tag_dto.g.dart';

@freezed
class TagDTO with _$TagDTO {
  const factory TagDTO({
    required List<TagDataDTO> data,
  }) = _TagDTO;

  factory TagDTO.fromJson(Map<String, dynamic> json) => _$TagDTOFromJson(json);
}
