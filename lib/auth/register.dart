import 'package:flutter/material.dart';
import 'package:listr/components/authinputfield.dart';
import 'package:listr/components/authsubmitbtn.dart';
import 'package:listr/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                "Create an Account\non Listr",
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
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.yellow[300],
                        padding: EdgeInsets.zero),
                    child: const Text(
                      "login",
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
                        fieldController: nameController,
                        hintText: "Fullname",
                        isObscured: false,
                        type: "name"),
                    const SizedBox(
                      height: 14,
                    ),
                    AuthInputField(
                        fieldController: emailController,
                        hintText: "Email Address",
                        isObscured: false,
                        type: "email"),
                    const SizedBox(
                      height: 14,
                    ),
                    AuthInputField(
                        fieldController: passwordController,
                        hintText: "Password",
                        isObscured: true,
                        type: "pwd"),
                    const SizedBox(
                      height: 32,
                    ),
                    Consumer<AuthProvider>(
                      builder: (context, register, child) {
                        return AuthSubmitBtn(
                          onpressed: () async {
                            await register.registerProvider({
                              'name': nameController.text,
                              'email': emailController.text,
                              'password': passwordController.text,
                            }, context);
                          },
                          label: register.isLoading == true
                              ? "Loading"
                              : "Register",
                          isLoading: register.isLoading,
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
