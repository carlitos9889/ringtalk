import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static FlutterSecureStorage storage = const FlutterSecureStorage();
  static Future<void> guardarToken(String token) async {
    return const FlutterSecureStorage().write(key: 'token', value: token);
  }

  static Future<void> logout() async {
    return const FlutterSecureStorage().delete(key: 'token');
  }

  static Future<String?> getToken() async {
    return const FlutterSecureStorage().read(key: 'token');
  }
}
