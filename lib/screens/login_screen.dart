import 'package:flutter/material.dart';
import 'package:ringtalk/widgets/exportaciones.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  routes: 'register',
                  title: 'No tienes cuenta?',
                  subtitle: 'Crea una ahora',
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
  final ctrlPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        child: Column(
          children: [
            CustomInput(
              ctrl: ctrlEmail,
              icon: Icons.mail_outline,
              placeholder: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            CustomInput(
              ctrl: ctrlPassword,
              icon: Icons.lock_outlined,
              isObscure: true,
              placeholder: 'Password',
            ),

            // TextFormField(),
            // TODO: Funcion para  hacer el login
            BtnButton(
                text: 'Login',
                onPressed: () {
                  print(ctrlEmail.text);
                  print(ctrlPassword.text);
                })
          ],
        ),
      ),
    );
  }
}
