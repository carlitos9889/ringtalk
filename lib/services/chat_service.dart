import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ringtalk/global/enviroments.dart';
import 'package:ringtalk/helpers/storage.dart';
import 'package:ringtalk/models/chat_response/chat_response.dart';
import 'package:ringtalk/models/message/message.dart';
import 'package:ringtalk/models/usuario/usuario.dart';

class ChatService with ChangeNotifier {
  Usuario? usuarioPara;

  Future<List<Message>> getChat(String usuarioID) async {
    try {
      final resp = await Dio().get(
          '${Enviroments.apiUrl}/mensajes/${usuarioPara?.uid}',
          options: Options(headers: {'x-token': await Storage.getToken()}));
      final data = ChatResponse.fromJson(resp.data);
      return data.mensages;
    } on DioError catch (_) {
      return [];
    }
  }
}
