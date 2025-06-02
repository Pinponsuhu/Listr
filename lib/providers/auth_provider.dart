import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:listr/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  AuthService _authService = AuthService();

  Future<void> registerProvider(
      Map<String, String> body, BuildContext context) async {
    isLoading = true;
    log(isLoading.toString());
    _authService.register(body, context);
    isLoading = false;
    log(isLoading.toString());
    ChangeNotifier();
  }
}
