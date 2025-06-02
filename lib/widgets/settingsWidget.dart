import 'package:flutter/material.dart';
import 'package:listr/components/authinputfield.dart';
import 'package:listr/components/authsubmitbtn.dart';
import 'package:listr/components/lightInputField.dart';
import 'package:listr/components/settingsTile.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  @override
  SafeArea build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyle(
                  color: Colors.grey[200],
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SettingsTile(
                      icon: Icons.person_2_outlined,
                      label: "Edit Profile",
                      onTap: () =>
                          Navigator.pushNamed(context, '/edit-profile'),
                    ),
                    SettingsTile(
                      icon: Icons.lock_outline_sharp,
                      label: "Change Password",
                      onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "Update Password",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Form(
                                    child: Column(
                                      children: [
                                        LightInputField(
                                          fieldController:
                                              _oldPasswordController,
                                          hintText: "Old Password",
                                          isObscured: true,
                                          type: "pwd",
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        LightInputField(
                                          fieldController:
                                              _newPasswordController,
                                          hintText: "New Password",
                                          isObscured: true,
                                          type: "pwd",
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        LightInputField(
                                          fieldController:
                                              _confirmPasswordController,
                                          hintText: "Confirm new Password",
                                          isObscured: true,
                                          type: "pwd",
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        AuthSubmitBtn(
                                            onpressed: () => print("doe"),
                                            label: "Update Password")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    SettingsTile(
                      icon: Icons.info_outline,
                      label: "About App",
                      onTap: () => print("hello"),
                    ),
                    SettingsTile(
                      icon: Icons.logout_outlined,
                      label: "Logout",
                      onTap: () => print("hello"),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
