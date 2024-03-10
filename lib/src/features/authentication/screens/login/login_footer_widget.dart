import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:mess_management_system/src/constants/sizes.dart';
import 'package:mess_management_system/src/constants/text_string.dart';
import 'package:mess_management_system/src/features/authentication/screens/login/login_screen.dart';
import 'package:mess_management_system/src/features/authentication/screens/signup/signup_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget(
      {super.key,
      required this.signupLoginText,
      required this.dontHaveAccount});

  final String signupLoginText;
  final String dontHaveAccount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        const SizedBox(
          height: messFormHeight - 10.0,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: const Image(
                image: AssetImage(
                  messGoogleLogoImage,
                ),
                width: 20.0,
              ),
              onPressed: () {},
              label: const Text(messSignInWithGoogle)),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (signupLoginText == "Login") {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const LoginScreen()));
            } else {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const SignupScreen()));
            }
          },
          child: Text.rich(
            TextSpan(
              text: dontHaveAccount,
              children: [
                TextSpan(
                    text: signupLoginText,
                    style: const TextStyle(color: Colors.blue))
              ],
            ),
          ),
        )
      ],
    );
  }
}
