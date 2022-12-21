// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:ringtalk/models/usuario/usuario.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'login_response.freezed.dart';
// optional: Since our login_response class is serializable, we must add this line.
// But if login_response was not serializable, we could skip it.
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required bool ok,
    required Usuario usuario,
    required String token,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}
