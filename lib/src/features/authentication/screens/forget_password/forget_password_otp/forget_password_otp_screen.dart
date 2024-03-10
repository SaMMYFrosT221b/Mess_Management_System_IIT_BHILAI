import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mess_management_system/main.dart';
import 'package:mess_management_system/src/constants/colors.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:mess_management_system/src/constants/sizes.dart';
import 'package:mess_management_system/src/constants/text_string.dart';

import '../forget_password_mail/forget_password_mail.dart';

class ForgetPassWordOtpScreen extends StatelessWidget {
  const ForgetPassWordOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    var brightness = mediaQuery.platformBrightness;
    var isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(MessDefaultSize),
          child: Column(
            children: [
              const SizedBox(
                height: MessDefaultSize * 2,
              ),
              FormHeaderWidget(
                size: size,
                image: messVerificationOtp,
                title: "Verification",
                subTitle:
                    "Enter the verification code send to ratnakarg@iitbhilai.ac.in",
              ),
              SizedBox(
                height: messFormHeight,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.numbers),
                      labelText: "Code",
                      hintText: "Code",
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
                          foregroundColor:
                              isDarkMode ? messSecondaryColor : messWhiteColor,
                          backgroundColor:
                              isDarkMode ? messWhiteColor : messSecondaryColor,
                          padding:
                              EdgeInsets.symmetric(vertical: messButtonHeight),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      ForgetPassWordOtpScreen()));
                        },
                        child: Text("Verify".toUpperCase())),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
