import 'package:flutter/material.dart';
import 'package:ringtalk/global/enviroments.dart';
import 'package:ringtalk/helpers/storage.dart';
import 'package:ringtalk/models/usuario/usuario.dart';

import 'package:socket_io_client/socket_io_client.dart';

// ignore: constant_identifier_names
enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  Socket? _socket;
  List<Usuario> _usuarios = [];

  // Server status
  ServerStatus get serverStatus => _serverStatus;

  // socket
  Socket? get socket => _socket;
  Function get emit => _socket?.emit ?? () {};

  // usuarios
  List<Usuario> get usuarios => _usuarios;

  void connectarClient(String uid) async {
    // final token = await Storage.getToken();
    // final auth = Provider.of<AuthService>(context, listen: false);

    _socket = io(
      Enviroments.socketUrl,
      OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .enableForceNew()
          .setExtraHeaders({'x-token': await Storage.getToken()})
          .build(),
    );

    _socket?.onConnect((_) {
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    _socket?.onDisconnect((_) {
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    _socket?.on('usuarios', (data) {
      final usuarios = data['usuarios'] as List;
      _usuarios = usuarios
          .map((json) => Usuario.fromJson(json))
          .where((user) => user.uid != uid)
          .toList();
      notifyListeners();
    });

    _socket?.onConnectError((data) {
      _serverStatus = ServerStatus.Connecting;
      notifyListeners();
    });
  }

  void disconnectClient() {
    _socket?.disconnect();
    _usuarios.clear();
  }
}
