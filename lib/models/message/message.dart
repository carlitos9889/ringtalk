// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'message.freezed.dart';
// optional: Since our message class is serializable, we must add this line.
// But if message was not serializable, we could skip it.
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String de,
    required String para,
    required String mensaje,
    required String createdAt,
    required String updatedAt,
  }) = _Message;

  factory Message.fromJson(Map<String, Object?> json) =>
      _$MessageFromJson(json);
}
