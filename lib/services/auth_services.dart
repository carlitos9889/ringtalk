import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ringtalk/global/enviroments.dart';
import 'package:ringtalk/helpers/storage.dart';
import 'package:ringtalk/models/login_response/login_response.dart';
import 'package:ringtalk/models/usuario/usuario.dart';

class AuthService with ChangeNotifier {
  Usuario? usuario;
  bool _autenticando = false;
  final _dio = Dio(BaseOptions(baseUrl: Enviroments.apiUrl));

  bool get autenticando => _autenticando;
  set autenticando(bool valor) {
    _autenticando = valor;
    notifyListeners();
  }

  Future<bool> isLoggin() async {
    final token = await Storage.getToken();
    if (token != null) {
      try {
        final resp = await _dio.get(
          '/login/renew',
          options: Options(headers: {'x-token': token}),
        );
        final data = LoginResponse.fromJson(resp.data);
        usuario = data.usuario;
        // Guardar token en el storage
        await Storage.guardarToken(data.token);
        return data.ok;
      } on DioError catch (_) {
        await Storage.logout();
        return false;
      }
    }
    return false;
  }

  Future<bool> login(String email, String password) async {
    autenticando = true;
    try {
      final resp = await _dio.post('/login/', data: {
        'email': email,
        'password': password,
      });
      final data = LoginResponse.fromJson(resp.data);
      usuario = data.usuario;
      autenticando = false;
      // Guardar token en el storage
      await Storage.guardarToken(data.token);
      return data.ok;
    } on DioError catch (_) {
      autenticando = false;
      return false;
    }
  }

  Future<bool> register(String email, String password, String nombre) async {
    autenticando = true;
    try {
      final resp = await _dio.post('/login/new', data: {
        'email': email,
        'nombre': nombre,
        'password': password,
      });
      final data = LoginResponse.fromJson(resp.data);
      usuario = data.usuario;
      autenticando = false;
      // Guardar token en el storage
      await Storage.guardarToken(data.token);
      return data.ok;
    } on DioError catch (_) {
      autenticando = false;
      return false;
    }
  }
}
