import 'package:flutter/material.dart';

import '../../common/widgets/primary_button.dart';
import '../../locator/locator.dart';
import 'sign_up_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
