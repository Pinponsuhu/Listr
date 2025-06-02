import 'package:flutter/material.dart';

class LightInputField extends StatefulWidget {
  final TextEditingController fieldController;
  final String hintText;
  final String type;
  bool isObscured;
  LightInputField(
      {super.key, required this.fieldController,
      required this.hintText,
      required this.isObscured,
      required this.type});

  @override
  State<LightInputField> createState() => _LightInputFieldState();
}

class _LightInputFieldState extends State<LightInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.fieldController,
      cursorColor: Colors.green[300],
      keyboardType: TextInputType.emailAddress,
      obscureText: widget.isObscured,
      maxLines: widget.type == "desc" ? 4 : 1,
      decoration: InputDecoration(
          suffixIcon: Visibility(
            visible: widget.isObscured,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.isObscured = !widget.isObscured;
                  });
                },
                icon: Icon(
                  widget.isObscured
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.grey[500],
                )),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
          fillColor: Colors.black),
    );
  }
}
