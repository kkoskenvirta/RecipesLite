import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel with _$AuthModel {
  factory AuthModel({
    required int expires,
    required String accessToken,
    required String refreshToken,
  }) = _AuthModel;

  const AuthModel._();

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}
