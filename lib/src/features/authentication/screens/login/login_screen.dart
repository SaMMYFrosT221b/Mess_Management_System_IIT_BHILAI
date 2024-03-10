import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mess_management_system/src/common_widgets/form/form_header_widget.dart';
import 'package:mess_management_system/src/constants/colors.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:mess_management_system/src/constants/sizes.dart';
import 'package:mess_management_system/src/constants/text_string.dart';
import 'package:mess_management_system/src/features/authentication/screens/login/login_footer_widget.dart';
import 'package:mess_management_system/src/features/authentication/screens/login/login_form_header.dart';
import 'package:mess_management_system/src/features/authentication/screens/login/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            padding: EdgeInsets.all(MessDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section 1
                FormHeaderWidget(
                    size: size,
                    image: messWelcomeScreenImage,
                    title: messLoginTitle,
                    subTitle: messLoginSubTitle),
                //   Section 1 end

                //   Section 2  (Form)
                LoginForm(isDarkMode: isDarkMode),
                LoginFooterWidget(
                  dontHaveAccount: messDontHaveAnAccount,
                  signupLoginText: messSignup,
                )
                //   Section 2 ends
              ],
            ),
          ),
        ),
      ),
    );
  }
}
