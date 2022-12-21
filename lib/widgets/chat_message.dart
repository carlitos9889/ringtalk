import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
    required this.texto,
    required this.uid,
    required this.animationController,
  });

  final String texto;
  final String uid;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut,
        ),
        child: _burbuja(),
      ),
    );
  }

  Align _burbuja() {
    return Align(
      alignment: uid == '123' ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: uid == '123'
            ? const EdgeInsets.only(bottom: 5, left: 50, right: 10)
            : const EdgeInsets.only(bottom: 5, left: 10, right: 50),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:
              uid == '123' ? const Color(0xff4D9Ef6) : const Color(0xffE4E5E8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(texto,
            style: uid == '123'
                ? const TextStyle(color: Colors.white)
                : const TextStyle(color: Colors.black87)),
      ),
    );
  }
}
