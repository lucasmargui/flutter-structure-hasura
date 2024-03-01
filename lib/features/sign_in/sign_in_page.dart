import 'package:flutter/material.dart';

import '../../common/widgets/primary_button.dart';
import '../../locator/locator.dart';
import 'sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PrimaryButton(
        text: 'Sign in',
        onPressed: () {
          final controller = locator.get<SignInController>();

          controller.signIn(
            email: "teste@teste.com",
            password: "Lucas123456789",
          );
        },
      ),
    );
  }
}
