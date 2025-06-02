import 'package:flutter/material.dart';
import 'package:listr/components/authinputfield.dart';
import 'package:listr/components/authsubmitbtn.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              textAlign: TextAlign.center,
              "Forgot Password",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Enter email address to receive recovery mail",
              style: TextStyle(color: Colors.grey[300]),
            ),
            const SizedBox(
              height: 36,
            ),
            Form(
                child: Column(
              children: [
                AuthInputField(
                    fieldController: _emailController,
                    hintText: "Email Address",
                    isObscured: false,
                    type: "email"),
                const SizedBox(
                  height: 20,
                ),
                AuthSubmitBtn(
                    onpressed: () => Navigator.pushNamed(context, "/success"),
                    label: "Send")
              ],
            ))
          ],
        ),
      )),
    );
  }
}
