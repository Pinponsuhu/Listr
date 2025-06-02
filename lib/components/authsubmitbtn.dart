import 'package:flutter/material.dart';

class AuthSubmitBtn extends StatelessWidget {
  final Function onpressed;
  final String label;

  const AuthSubmitBtn({super.key, required this.onpressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onpressed(),
        style: TextButton.styleFrom(
            backgroundColor: Colors.yellow[400],
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 18),
            minimumSize: const Size(double.infinity, 28)),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
