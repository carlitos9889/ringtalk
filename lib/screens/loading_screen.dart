// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ringtalk/services/auth_services.dart';
import 'package:ringtalk/services/socket_service.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context, listen: false);
    final socket = Provider.of<SocketService>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: _checkLoginState(auth, context, socket),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return const Center(
            child: Text('Espere...'),
          );
        },
      ),
    );
  }

  Future _checkLoginState(
      AuthService auth, BuildContext context, SocketService socket) async {
    socket.connectarClient(auth.usuario?.uid ?? 'No id');
    final autenticado = await auth.isLoggin();
    if (autenticado) {
      // TODO: Animar navegacion
      Navigator.pushReplacementNamed(context, 'usuarios');
    } else {
      // TODO: Animar navegacion
      socket.disconnectClient();
      Navigator.pushReplacementNamed(context, 'login');
    }
    // await auth.isLoggin().then(
    //   (isAutenticado) {
    //     if (isAutenticado) {
    //       socket.connectarClient(auth.usuario?.uid ?? "no id");
    //       Navigator.pushReplacementNamed(context, 'usuarios');
    //     } else {
    //       socket.disconnectClient();
    //       Navigator.pushReplacementNamed(context, 'login');
    //     }
    //   },
    // );
  }
}
