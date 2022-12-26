import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ringtalk/models/message/message.dart';
import 'package:ringtalk/services/auth_services.dart';
import 'package:ringtalk/services/chat_service.dart';
import 'package:ringtalk/services/socket_service.dart';
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

  late AuthService authService;
  late ChatService chatService;
  late SocketService socketService;

  @override
  void initState() {
    _ctrl = TextEditingController();
    _focus = FocusNode();

    authService = Provider.of<AuthService>(context, listen: false);
    chatService = Provider.of<ChatService>(context, listen: false);
    socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket?.on('mensaje-personal', _listenMensaje);
    _cargarHistorial(chatService.usuarioPara?.uid ?? 'No id');
    super.initState();
  }

  Future _cargarHistorial(String uid) async {
    List<Message> chat = await chatService.getChat(uid);
    final historial = chat
        .map(
          (m) => ChatMessage(
            texto: m.mensaje,
            uid: m.de,
            animationController: AnimationController(
              vsync: this,
              duration: const Duration(milliseconds: 300),
            )..forward(),
          ),
        )
        .toList();
    setState(() {
      _messages.insertAll(0, historial);
    });
  }

  void _listenMensaje(dynamic data) {
    final message = ChatMessage(
      texto: data['mensaje'],
      uid: data['de'],
      animationController: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      ),
    )..animationController.forward();
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  void dispose() {
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
        title: Text(
          chatService.usuarioPara?.nombre ?? 'Sin nombre',
          style: const TextStyle(color: Colors.black54),
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
          uid: authService.usuario?.uid ?? "no uid",
          animationController: AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 400),
          ),
        )..animationController.forward(),
      );

      socketService.emit('mensaje-personal', {
        'de': authService.usuario?.uid ?? 'no-uid',
        'para': chatService.usuarioPara?.uid ?? 'no uid',
        'mensaje': texto
      });
    });
  }
}
