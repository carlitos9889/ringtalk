import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    required this.icon,
    required this.placeholder,
    required this.ctrl,
    this.keyboardType = TextInputType.text,
    this.isObscure = false,
  }) : super(key: key);

  final IconData icon;
  final String placeholder;
  final TextEditingController ctrl;
  final TextInputType keyboardType;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      decoration: _decoration(),
      child: TextFormField(
        autocorrect: false,
        keyboardType: keyboardType,
        obscureText: isObscure,
        decoration: _inputDecoration(),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      prefixIcon: Icon(icon),
      focusedBorder: InputBorder.none,
      border: InputBorder.none,
      hintText: placeholder,
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadiusDirectional.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: const Offset(0, 5),
          blurRadius: 5,
        )
      ],
    );
  }
}
