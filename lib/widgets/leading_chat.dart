import 'package:flutter/material.dart';
import 'package:ringtalk/models/usuario/usuario.dart';

class LeadingChat extends StatelessWidget {
  const LeadingChat({Key? key, required this.usuario}) : super(key: key);

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            usuario.nombre.substring(0, 2).toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Positioned(
          bottom: 1,
          right: 5,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: usuario.online ? Colors.green[300] : Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
