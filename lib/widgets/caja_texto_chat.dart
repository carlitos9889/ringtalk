import 'package:flutter/material.dart';

class CajaTextoChat extends StatelessWidget {
  const CajaTextoChat({
    Key? key,
    required this.controller,
    this.onSubmitted,
    this.onChanged,
    this.focusNode,
    this.onPressed,
  }) : super(key: key);

  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Flexible(
                child: TextFormField(
                  controller: controller,
                  onChanged: onChanged,
                  decoration: const InputDecoration.collapsed(
                    hintText: 'Send SMS',
                  ),
                  focusNode: focusNode,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: IconTheme(
                  data: IconThemeData(color: Colors.blue[400]),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: const Icon(Icons.send),
                    onPressed: onPressed,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
