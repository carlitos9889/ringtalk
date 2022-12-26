// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:ringtalk/screens/login_screen.dart';
import 'package:ringtalk/screens/usuarios_screen.dart';
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
    final autenticado = await auth.isLoggin();
    if (autenticado) {
      // TODO: Animar navegacion
      Navigator.pushReplacement(
        context,
        PageTransition(
          child: const UsuarioScreen(),
          type: PageTransitionType.rightToLeft,
        ),
      );
      socket.connectarClient(auth.usuario?.uid ?? 'No id');
    } else {
      // TODO: Animar navegacion
      Navigator.pushReplacement(
        context,
        PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.rightToLeft,
        ),
      );
      socket.disconnectClient();
    }
  }
}
