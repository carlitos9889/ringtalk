import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ringtalk/helpers/storage.dart';

import 'package:ringtalk/services/auth_services.dart';
import 'package:ringtalk/services/socket_service.dart';

import 'package:ringtalk/widgets/exportaciones.dart';

class UsuarioScreen extends StatelessWidget {
  const UsuarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    final socket = Provider.of<SocketService>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          auth.usuario?.nombre ?? 'No hay usuario',
          style: const TextStyle(color: Colors.black54),
        ),
        leading: IconButton(
          onPressed: () {
            socket.disconnectClient();
            Navigator.pushReplacementNamed(context, 'login');
            Storage.logout();
          },
          icon: const Icon(Icons.exit_to_app, color: Colors.black87),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: socket.serverStatus == ServerStatus.Online
                ? Icon(Icons.check_circle, color: Colors.blue[400])
                : Icon(Icons.offline_bolt, color: Colors.red[400]),
            // child: Icon(Icons.offline_bolt, color: Colors.red[400]),
          ),
        ],
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) => ListTitleUsuarioConectado(socket.usuarios[i]),
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemCount: socket.usuarios.length,
      ),
    );
  }
}
