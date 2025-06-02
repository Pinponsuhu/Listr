import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future nextPage() async {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, "/onboarding");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Icon(
              Icons.checklist_rtl_rounded,
              color: Colors.yellow,
              size: 68,
            ),
          )
        ],
      ),
    );
  }
}
