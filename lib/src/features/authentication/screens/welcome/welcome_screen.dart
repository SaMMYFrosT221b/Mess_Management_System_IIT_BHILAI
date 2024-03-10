import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mess_management_system/src/constants/colors.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:mess_management_system/src/constants/sizes.dart';
import 'package:mess_management_system/src/constants/text_string.dart';
import 'package:mess_management_system/src/features/authentication/screens/login/login_screen.dart';
import 'package:mess_management_system/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:mess_management_system/src/utils/theme/theme.dart';
import 'package:mess_management_system/src/utils/theme/widget_theme.dart/outline_button_theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? messSecondaryColor : messPrimaryColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(MessDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage(messWelcomeScreenImage),
                height: height * 0.6,
              ),
              Column(
                children: [
                  Text(
                    messWelcomeTitle,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    messWelcomeSubTitle,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          foregroundColor:
                              isDarkMode ? messWhiteColor : messSecondaryColor,
                          side: BorderSide(
                            color: messDarkColor,
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: messButtonHeight),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(messLogin.toUpperCase())),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: Text(messSignup.toUpperCase())),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
