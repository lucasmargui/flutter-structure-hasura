// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../services/auth_service.dart';

class SignUpController extends ChangeNotifier {
  final AuthService _service;
  SignUpController(this._service);

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await _service.signUp(name: name, email: email, password: password);
    } catch (e) {
      log(e.toString());
    }
  }
}
