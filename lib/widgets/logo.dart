import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: const EdgeInsets.only(top: 50),
      width: 170,
      child: Column(
        children: [
          Image.asset('assets/tag-logo.png'),
          const Text('Messenger', style: TextStyle(fontSize: 30))
        ],
      ),
    ));
  }
}
