import 'package:flutter/material.dart';
import 'package:mess_management_system/src/constants/colors.dart';
import 'package:mess_management_system/src/constants/sizes.dart';
import 'package:mess_management_system/src/constants/text_string.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: messFormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  label: Text(messEmail),
                  prefixIcon: Icon(
                    Icons.person_2_outlined,
                    color: isDarkMode ? messPrimaryColor : messSecondaryColor,
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                      color:
                          isDarkMode ? messPrimaryColor : messSecondaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2.0,
                        color:
                            isDarkMode ? messPrimaryColor : messSecondaryColor),
                  )),
            ),
            SizedBox(
              height: messFormHeight - 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  label: Text(messRollNumber),
                  prefixIcon: Icon(
                    Icons.numbers,
                    color: isDarkMode ? messPrimaryColor : messSecondaryColor,
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                      color:
                          isDarkMode ? messPrimaryColor : messSecondaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2.0,
                        color:
                            isDarkMode ? messPrimaryColor : messSecondaryColor),
                  )),
            ),
            SizedBox(
              height: messFormHeight - 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  label: Text(messPassword),
                  prefixIcon: Icon(
                    Icons.password_rounded,
                    color: isDarkMode ? messPrimaryColor : messSecondaryColor,
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                      color:
                          isDarkMode ? messPrimaryColor : messSecondaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2.0,
                        color:
                            isDarkMode ? messPrimaryColor : messSecondaryColor),
                  )),
            ),
            SizedBox(
              height: messFormHeight - 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  label: Text(messConfirmPassword),
                  prefixIcon: Icon(
                    Icons.password_outlined,
                    color: isDarkMode ? messPrimaryColor : messSecondaryColor,
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                      color:
                          isDarkMode ? messPrimaryColor : messSecondaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2.0,
                        color:
                            isDarkMode ? messPrimaryColor : messSecondaryColor),
                  )),
            ),
            SizedBox(
              height: messFormHeight - 20,
            ),
          ],
        ),
      ),
    );
  }
}
