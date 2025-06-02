import 'package:flutter/material.dart';
import 'package:listr/auth/forgot-password.dart';
import 'package:listr/auth/login.dart';
import 'package:listr/auth/register.dart';
import 'package:listr/auth/success.dart';
import 'package:listr/edit-profile.dart';
import 'package:listr/onboarding.dart';
import 'package:listr/pages/home.dart';
import 'package:listr/providers/auth_provider.dart';
import 'package:listr/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider())
      ],
      child: MaterialApp(
    routes: {
      '/': (context) => const Splash(),
      '/onboarding': (context) => const Onboarding(),
      '/home': (context) => const Home(),
      '/login': (context) => const Login(),
      '/success': (context) => const Success(),
      '/register': (context) => const Register(),
      '/forgot-password': (context) => const ForgotPassword(),
      '/edit-profile': (context) => const EditProfile(),
    },
  )));
}
