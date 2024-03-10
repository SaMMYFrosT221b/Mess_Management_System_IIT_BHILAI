import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mess_management_system/src/common_widgets/form/form_header_widget.dart';
import 'package:mess_management_system/src/constants/colors.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:mess_management_system/src/constants/sizes.dart';
import 'package:mess_management_system/src/constants/text_string.dart';
import 'package:mess_management_system/src/features/authentication/screens/login/login_footer_widget.dart';
import 'package:mess_management_system/src/features/authentication/screens/login/login_form_header.dart';
import 'package:mess_management_system/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:mess_management_system/src/features/authentication/screens/login/login_screen.dart';
import 'package:mess_management_system/src/features/authentication/screens/signup/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final size = mediaQuery.size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(MessDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                    size: size,
                    image: messWelcomeScreenImage,
                    title: messSignUpTitle,
                    subTitle: messSignUpSubTitle),
                SignupFormWidget(isDarkMode: isDarkMode),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(),
                        foregroundColor:
                            isDarkMode ? messSecondaryColor : messWhiteColor,
                        backgroundColor:
                            isDarkMode ? messWhiteColor : messSecondaryColor,
                        side: BorderSide(
                          color: messSecondaryColor,
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: messButtonHeight),
                      ),
                      onPressed: () {},
                      child: Text(messSignup.toUpperCase())),
                ),
                SizedBox(
                  height: messFormHeight - 20,
                ),
                LoginFooterWidget(
                  dontHaveAccount: messAlreadyHaveAnAccount,
                  signupLoginText: messLogin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
