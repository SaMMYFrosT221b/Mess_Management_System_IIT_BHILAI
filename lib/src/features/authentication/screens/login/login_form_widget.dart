import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mess_management_system/src/constants/colors.dart';
import 'package:mess_management_system/src/constants/sizes.dart';
import 'package:mess_management_system/src/constants/text_string.dart';
import 'package:mess_management_system/src/features/authentication/screens/forget_password/forget_password_option/forget_password_btn_widget.dart';
import 'package:mess_management_system/src/features/authentication/screens/forget_password/forget_password_option/forget_password_modal_bottom_sheet.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: messFormHeight - 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_2_outlined),
              labelText: messEmail,
              hintText: messEmail,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: messFormHeight,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.fingerprint),
              labelText: messPassword,
              hintText: messPassword,
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: null,
                icon: Icon(Icons.remove_red_eye),
              ),
            ),
          ),
          SizedBox(
            height: messFormHeight,
          ),

          // Forget Password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: Text(messForgetPassword)),
          ),
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
                  padding: EdgeInsets.symmetric(vertical: messButtonHeight),
                ),
                onPressed: () {},
                child: Text(messLogin.toUpperCase())),
          )
        ],
      ),
    ));
  }
}
