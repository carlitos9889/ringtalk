// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ringtalk/services/auth_services.dart';
import 'package:ringtalk/services/socket_service.dart';
import 'package:ringtalk/widgets/exportaciones.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Logo(),
                _Form(),
                const Labels(
                  routes: 'login',
                  title: 'Ya tienes cuenta?',
                  subtitle: 'Ingrese ahora',
                ),
                const Text(
                  'Terminos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  _Form({Key? key}) : super(key: key);

  final ctrlEmail = TextEditingController();
  final ctrlName = TextEditingController();
  final ctrlPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    final socket = Provider.of<SocketService>(context);
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        child: Column(
          children: [
            CustomInput(
              ctrl: ctrlName,
              icon: Icons.account_box_outlined,
              placeholder: 'Name',
            ),
            CustomInput(
              ctrl: ctrlEmail,
              icon: Icons.mail_outline,
              keyboardType: TextInputType.emailAddress,
              placeholder: 'Email',
            ),
            CustomInput(
              ctrl: ctrlPassword,
              icon: Icons.lock_outlined,
              isObscure: true,
              placeholder: 'Password',
            ),
            // TextFormField(),
            BtnButton(
              text: 'Register',
              onPressed: auth.autenticando
                  ? null
                  : () async {
                      final ok = await auth.register(
                        ctrlEmail.text.trim(),
                        ctrlPassword.text.trim(),
                        ctrlName.text.trim(),
                      );
                      if (!ok) {
                        ctrlEmail.clear();
                        ctrlPassword.clear();
                        ctrlName.clear();
                      } else {
                        socket.connectarClient(auth.usuario?.uid ?? "no uid");
                        Navigator.pushReplacementNamed(context, 'usuarios');
                      }
                    },
            )
          ],
        ),
      ),
    );
  }
}
