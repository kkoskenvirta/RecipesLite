import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_model.freezed.dart';

@freezed
class TagModel with _$TagModel {
  factory TagModel({
    required String id,
    required String name,
    String? status,
    String? sort,
  }) = _TagModel;
}
