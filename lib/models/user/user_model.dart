import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String id,
    required String username,
    required String email,
    String? role,
    String? avatar,
  }) = _UserModel;
}
