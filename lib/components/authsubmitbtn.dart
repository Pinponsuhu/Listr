import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AuthSubmitBtn extends StatelessWidget {
  final Function onpressed;
  final String label;
  final bool isLoading;

  const AuthSubmitBtn(
      {super.key,
      required this.onpressed,
      required this.label,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onpressed(),
      style: TextButton.styleFrom(
          backgroundColor: Colors.yellow[400],
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 18),
          minimumSize: const Size(double.infinity, 28)),
      child: isLoading
          ? SpinKitWave(
              color: Colors.black,
              size: 22,
            )
          : Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
