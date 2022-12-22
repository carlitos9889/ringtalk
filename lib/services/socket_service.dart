import 'package:flutter/material.dart';
import 'package:ringtalk/global/enviroments.dart';
import 'package:ringtalk/helpers/storage.dart';
import 'package:ringtalk/models/usuario/usuario.dart';

import 'package:socket_io_client/socket_io_client.dart';

// ignore: constant_identifier_names
enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  late Socket _socket;
  final List<Usuario> _usuarios = [];

  // Server status
  ServerStatus get serverStatus => _serverStatus;

  // socket
  Socket get socket => _socket;
  Function get emit => _socket.emit;

  // usuarios
  List<Usuario> get usuarios => _usuarios;

  void connectarClient() async {
    final token = await Storage.getToken();

    _socket = io(
      Enviroments.socketUrl,
      OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .enableForceNew()
          .setExtraHeaders({'x-token': token})
          .build(),
    );

    _socket.onConnect((_) {
      print('Cliente conectado');
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    _socket.onDisconnect((_) {
      print('Clinete desconectado');
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    _socket.on('usuarios', (data) {
      final usuarios = data['usuarios'] as List;
      for (var usuario in usuarios) {
        final newUsuario = Usuario.fromJson(usuario);
        _usuarios.add(newUsuario);
      }
      notifyListeners();
    });

    _socket.onConnectError((data) {
      print('ErrorConecting$data');
      _serverStatus = ServerStatus.Connecting;
      notifyListeners();
    });
  }

  void disconnectClient() {
    _socket.disconnect();
    _usuarios.clear();
  }
}
