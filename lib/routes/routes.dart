import 'package:flutter/cupertino.dart';
import 'package:ringtalk/screens/chat_screen.dart';
import 'package:ringtalk/screens/loading_screen.dart';
import 'package:ringtalk/screens/login_screen.dart';
import 'package:ringtalk/screens/register_screen.dart';
import 'package:ringtalk/screens/usuarios_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  'chat': (_) => const ChatScreen(),
  'loading': (_) => const LoadingScreen(),
  'login': (_) => const LoginScreen(),
  'register': (_) => const RegisterScreen(),
  'usuarios': (_) => const UsuarioScreen(),
};
