import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ringtalk/models/usuario/usuario.dart';
import 'package:ringtalk/services/chat_service.dart';

class ListTitleUsuarioConectado extends StatelessWidget {
  const ListTitleUsuarioConectado(this.usuario, {Key? key}) : super(key: key);

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    final chatService = Provider.of<ChatService>(context, listen: false);

    return ListTile(
      title: Text(usuario.nombre),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[300],
        child: Text(usuario.nombre.substring(0, 2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: usuario.online ? Colors.green[300] : Colors.red,
        ),
      ),
      onTap: () {
        chatService.usuarioPara = usuario;
        Navigator.pushNamed(context, 'chat');
      },
    );
  }
}