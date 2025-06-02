import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 128,
                    color: Colors.green[400],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Recovery mail has been sent",
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/login'),
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.yellow[300]),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
