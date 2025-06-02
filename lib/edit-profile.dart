import 'package:flutter/material.dart';
import 'package:listr/components/authinputfield.dart';
import 'package:listr/components/authsubmitbtn.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Edit Profile",
                style: TextStyle(
                  color: Colors.grey[200],
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Form(
                child: Column(
                  children: [
                    AuthInputField(
                        fieldController: _nameController,
                        hintText: "Full name",
                        isObscured: false,
                        type: "name"),
                    const SizedBox(
                      height: 12,
                    ),
                    AuthInputField(
                        fieldController: _emailController,
                        hintText: "Email Address",
                        isObscured: false,
                        type: "email"),
                    const SizedBox(
                      height: 12,
                    ),
                    AuthInputField(
                        fieldController: _passwordController,
                        hintText: "Password",
                        isObscured: true,
                        type: "pwd"),
                    const SizedBox(
                      height: 26,
                    ),
                    AuthSubmitBtn(
                        onpressed: () => print("hello"), label: "Update")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
