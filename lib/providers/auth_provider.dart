import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:listr/services/auth_service.dart';
import 'package:provider/provider.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  AuthService _authService = AuthService();

  Future<void> registerProvider(
      Map<String, String> body, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    print(isLoading);
    await _authService.register(body, context);
    isLoading = false;
    notifyListeners();
  }
}

final registerProvider = ChangeNotifierProvider<AuthProvider>(
  create: (context) => AuthProvider(),
);
