import 'package:flutter/material.dart';
import 'package:ringtalk/widgets/exportaciones.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  late TextEditingController _ctrl;
  late FocusNode _focus;
  bool _isWriting = false;

  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    _ctrl = TextEditingController();
    _focus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: off socket
    _ctrl.dispose();
    _focus.dispose();
    for (var message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Mi nombre',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, i) => _messages[i],
              itemCount: _messages.length,
            ),
          ),
          const Divider(height: 1),
          // TODO: Caja de texto
          CajaTextoChat(
            controller: _ctrl,
            focusNode: _focus,
            onChanged: _onChanged,
            onSubmitted: _onSubmitted,
            onPressed:
                _isWriting ? () => _onSubmitted(_ctrl.text.trim()) : null,
          ),
        ],
      ),
    );
  }

  _onChanged(String texto) {
    setState(() {
      _isWriting = texto.trim().isNotEmpty;
    });
  }

  _onSubmitted(String texto) {
    if (texto.trim().isEmpty) return;
    setState(() {
      _isWriting = false;
      _ctrl.clear();
      _focus.requestFocus();

      _messages.insert(
        0,
        ChatMessage(
          texto: texto,
          uid: '123',
          animationController: AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 400),
          ),
        )..animationController.forward(),
      );
    });
  }
}
