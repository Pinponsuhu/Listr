import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:listr/components/serviceMessage.dart';
import 'package:listr/models/user.dart';
import 'package:listr/models/errors.dart';
import 'dart:convert';

import 'package:listr/preferences/auth-token.dart';

class AuthService {
  final baseURL = "http://10.0.2.2:8000/api";
  AuthPreference _authToken = AuthPreference();

  Future<void> register(Map<String, String> body, BuildContext context) async {
    try {
      final response = await http.post(Uri.parse('$baseURL/register'),
          headers: {
            'Content-Type': 'application/vnd.api+json',
            'Accept': 'application/vnd.api+json'
          },
          body: json.encode(body));

      if (response.statusCode == 200) {
        User user = userFromJson(response.body);
        _authToken.setToken(user.data.token);
        _authToken.setName(user.data.user.name);
        _authToken.setEmail(user.data.user.email);
        serviceMessage(context, "Success", "User Registered successfully");

        Future.delayed(Duration(seconds: 2),
            () => Navigator.pushReplacementNamed(context, '/home'));
      } else {
        ErrorMessage _errors = errorMessageFromJson(response.body);
        throw new Exception(_errors.errors!.email.toString());
      }
    } catch (e) {
      serviceMessage(context, "Error", "${e.toString()}");
    }
  }

  Future<void> login(Map<String, String> body, BuildContext context) async {
    try {
      final response = await http.post(Uri.parse('$baseURL/login'),
          headers: {
            'Content-Type': 'application/vnd.api+json',
            'Accept': 'application/vnd.api+json'
          },
          body: json.encode(body));

      if (response.statusCode == 200) {
        User user = userFromJson(response.body);

        _authToken.setToken(user.data.token);
        _authToken.setName(user.data.user.name);
        _authToken.setEmail(user.data.user.email);
        serviceMessage(context, "Success", "User Logged in successfully");

        Future.delayed(Duration(seconds: 2),
            () => Navigator.pushReplacementNamed(context, '/home'));
      }
      throw new Exception(response.reasonPhrase);
    } catch (e) {
      serviceMessage(context, "Error", "${e.toString()}");
    }
  }
}
