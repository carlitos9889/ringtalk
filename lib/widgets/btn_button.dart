import 'package:flutter/material.dart';

class BtnButton extends StatelessWidget {
  const BtnButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: const StadiumBorder(),
      ),
      child: const SizedBox(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            'Login',
            style: TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
