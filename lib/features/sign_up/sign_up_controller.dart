// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../services/auth_service.dart';
import '../../services/graphql_service.dart';

class SignUpController extends ChangeNotifier {
  final AuthService authService;
  final GraphQlService graphQLService;

  SignUpController({required this.authService, required this.graphQLService});

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final user = await authService.signUp(
          name: name, email: email, password: password);

      if (user.id != null) {
        await graphQLService.init();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
