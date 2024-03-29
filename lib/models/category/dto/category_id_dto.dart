import 'package:flutter_e_commerce/models/category/dto/category_data_dto.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_id_dto.freezed.dart';
part 'category_id_dto.g.dart';

@freezed
class CategoryIdDTO with _$CategoryIdDTO {
  factory CategoryIdDTO({
    @JsonKey(name: "id") int? relationId,
    @JsonKey(name: "category_id") required CategoryDataDTO category,
  }) = _CategoryIdDTO;

  const CategoryIdDTO._();

  factory CategoryIdDTO.fromJson(Map<String, dynamic> json) => _$CategoryIdDTOFromJson(json);

  CategoryModel toDomain() {
    return CategoryModel(
      id: category.id,
      relationId: relationId,
      name: category.name,
      blurhash: category.blurhash,
      picture: category.picture,
      status: category.status,
      sort: category.sort,
    );
  }
}
