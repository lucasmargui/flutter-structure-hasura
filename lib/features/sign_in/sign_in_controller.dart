// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../services/auth_service.dart';

class SignInController extends ChangeNotifier {
  final AuthService _service;

  SignInController(this._service);

  //Função faça o login
  Future<void> signIn({required String email, required String password}) async {
    //

    try {
      await _service.signIn(email: email, password: password);
    } catch (e) {
      log(e.toString());
    }
  }
}
