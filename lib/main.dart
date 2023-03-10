import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ringtalk/routes/routes.dart';
import 'package:ringtalk/screens/loading_screen.dart';
import 'package:ringtalk/services/auth_services.dart';
import 'package:ringtalk/services/chat_service.dart';
import 'package:ringtalk/services/socket_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => SocketService()),
        ChangeNotifierProvider(create: (_) => ChatService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        initialRoute: 'loading',
        routes: appRoutes,
        // onGenerateRoute: onGenerateRoute,
        // routes: appRoutes,
      ),
    );
  }
}
