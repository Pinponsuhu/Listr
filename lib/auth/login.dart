import 'package:flutter/material.dart';
import 'package:listr/components/authinputfield.dart';
import 'package:listr/components/authsubmitbtn.dart';
import 'package:listr/components/serviceMessage.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                textAlign: TextAlign.center,
                "Welcome back\nto Listr",
                style: TextStyle(
                    fontFamily: "IndieFlower",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.yellow[300],
                        padding: EdgeInsets.zero),
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 14),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 26,
              ),
              Form(
                  child: Column(
                children: [
                  AuthInputField(
                      fieldController: _emailController,
                      hintText: "Email Address",
                      isObscured: false,
                      type: "pwd"),
                  const SizedBox(
                    height: 18,
                  ),
                  AuthInputField(
                      fieldController: _passwordController,
                      hintText: "Password",
                      isObscured: true,
                      type: "pwd"),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: rememberMe,
                              checkColor: Colors.yellow[300],
                              activeColor: Colors.yellow[300],
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = !rememberMe;
                                });
                              }),
                          Text(
                            "Remember me",
                            style: TextStyle(color: Colors.grey[300]),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/forgot-password'),
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.yellow[300]),
                        child: Text("Forgot Password?"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Consumer(
                    builder: (context, auth, child) {
                      return AuthSubmitBtn(
                          label: "Continue",
                          onpressed: () => serviceMessage(context, "Success",
                              "User Registered successfully"));
                    },
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
