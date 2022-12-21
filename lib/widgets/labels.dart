import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.routes,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String routes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, routes),
          child: Text(
            subtitle,
            style: TextStyle(
              color: Colors.blue[600],
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
