import 'package:flutter/material.dart';

import '../../common/widgets/primary_button.dart';
import '../../locator/locator.dart';
import '../../services/graphql_service.dart';
import 'sign_up_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PrimaryButton(
        text: 'Sign Up',
        onPressed: () {
          final controller = locator.get<SignUpController>();

          controller.signUp(
            name: 'Lucas Martins',
            email: "teste@teste.com",
            password: "Lucas123456789",
          );
        },
      ),
    );
  }
}
