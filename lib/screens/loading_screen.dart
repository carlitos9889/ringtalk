// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ringtalk/services/auth_services.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: _checkLoginState(auth, context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return const Center(
            child: Text('Espere...'),
          );
        },
      ),
    );
  }

  Future _checkLoginState(AuthService auth, BuildContext context) async {
    final autenticado = await auth.isLoggin();
    if (autenticado) {
      // TODO: Animar navegacion
      Navigator.pushReplacementNamed(context, 'usuarios');
    } else {
      // TODO: Animar navegacion
      Navigator.pushReplacementNamed(context, 'login');
    }
  }
}
