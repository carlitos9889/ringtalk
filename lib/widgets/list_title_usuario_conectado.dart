import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:ringtalk/models/usuario/usuario.dart';
import 'package:ringtalk/screens/chat_screen.dart';
import 'package:ringtalk/services/chat_service.dart';
import 'package:ringtalk/widgets/leading_chat.dart';

class ListTitleUsuarioConectado extends StatelessWidget {
  const ListTitleUsuarioConectado(this.usuario, {Key? key}) : super(key: key);

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    final chatService = Provider.of<ChatService>(context, listen: false);

    return ListTile(
      title: Text(usuario.nombre),
      leading: LeadingChat(usuario: usuario),
      trailing: Container(
        width: 30,
        height: 30,
        decoration: _decoration(),
        child: const Align(
          alignment: Alignment.center,
          child: Text('10', style: TextStyle(color: Colors.white)),
        ),
      ),
      onTap: () {
        chatService.usuarioPara = usuario;
        Navigator.push(
          context,
          PageTransition(
            child: const ChatScreen(),
            type: PageTransitionType.leftToRight,
          ),
        );
      },
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: Colors.deepOrangeAccent,
    );
  }
}
