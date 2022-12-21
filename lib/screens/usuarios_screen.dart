import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ringtalk/helpers/storage.dart';
import 'package:ringtalk/models/usuario/usuario.dart';
import 'package:ringtalk/services/auth_services.dart';

class UsuarioScreen extends StatelessWidget {
  const UsuarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    final List<Usuario> usuarios = [
      const Usuario(
          online: true, email: 'email1', nombre: 'nombre 1', uid: '1'),
      const Usuario(
          online: false, email: 'email2', nombre: 'nombre 2', uid: '2'),
      const Usuario(
          online: true, email: 'email3', nombre: 'nombre 3', uid: '3'),
      const Usuario(
          online: true, email: 'email4', nombre: 'nombre 4', uid: '4'),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          auth.usuario?.nombre ?? 'No hay usuario',
          style: TextStyle(color: Colors.black54),
        ),
        leading: IconButton(
          onPressed: () async {
            // TODO: Desconectar del socket
            Navigator.pushReplacementNamed(context, 'login');
            await Storage.logout();
          },
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.black87,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue[400]),
            // child: Icon(Icons.offline_bolt, color: Colors.red[400]),
          ),
        ],
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) => ListTile(
          title: Text(usuarios[i].nombre),
          leading: CircleAvatar(
            backgroundColor: Colors.blue[300],
            child: Text(usuarios[i].nombre.substring(0, 2)),
          ),
          trailing: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: usuarios[i].online ? Colors.green[300] : Colors.red,
            ),
          ),
        ),
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemCount: usuarios.length,
      ),
    );
  }
}
