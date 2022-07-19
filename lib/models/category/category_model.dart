import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';

@freezed
class CategoryModel with _$CategoryModel {
  factory CategoryModel({
    required String id,
    required String name,
    String? picture,
    String? status,
    String? icon,
    String? sort,
  }) = _CategoryModel;
}
