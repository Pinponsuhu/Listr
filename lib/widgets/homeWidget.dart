import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  SafeArea build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
          child: Column(
            children: [
              Text(
                "Home",
                style: TextStyle(
                  color: Colors.grey[200],
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
            ],
          )),
    );
  }
}
