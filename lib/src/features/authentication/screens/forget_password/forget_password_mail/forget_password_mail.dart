import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mess_management_system/src/constants/colors.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:mess_management_system/src/constants/sizes.dart';
import 'package:mess_management_system/src/constants/text_string.dart';
import 'package:mess_management_system/src/features/authentication/screens/forget_password/forget_password_otp/forget_password_otp_screen.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    var brightness = mediaQuery.platformBrightness;
    var isDarkMode = brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(MessDefaultSize),
            child: Column(
              children: [
                const SizedBox(
                  height: MessDefaultSize * 4,
                ),
                FormHeaderWidget(
                  size: size,
                  image: messForgetPasswordImage,
                  title: messForgetPassword,
                  subTitle: messForgetPasswordSubTitle,
                ),
                SizedBox(
                  height: messFormHeight,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: messEmail,
                        hintText: messEmail,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: messFormHeight,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Set your desired radius here
                            ),
                            foregroundColor: isDarkMode
                                ? messSecondaryColor
                                : messWhiteColor,
                            backgroundColor: isDarkMode
                                ? messWhiteColor
                                : messSecondaryColor,
                            padding: EdgeInsets.symmetric(
                                vertical: messButtonHeight),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        ForgetPassWordOtpScreen()));
                          },
                          child: Text(messNext.toUpperCase())),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.size,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final Size size;
  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image),
          height: size.height * 0.2,
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
