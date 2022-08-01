import 'package:flutter_e_commerce/models/file/dto/directus_file_data_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'directus_file_dto.freezed.dart';
part 'directus_file_dto.g.dart';

@freezed
class DirectusFileDTO with _$DirectusFileDTO {
  const factory DirectusFileDTO({
    required DirectusFileDataDTO data,
  }) = _DirectusFileDTO;

  factory DirectusFileDTO.fromJson(Map<String, dynamic> json) => _$DirectusFileDTOFromJson(json);
}
