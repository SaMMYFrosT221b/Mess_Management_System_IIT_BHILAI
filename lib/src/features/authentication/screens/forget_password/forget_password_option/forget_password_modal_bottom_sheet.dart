import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mess_management_system/src/constants/sizes.dart';
import 'package:mess_management_system/src/constants/text_string.dart';
import 'package:mess_management_system/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:mess_management_system/src/features/authentication/screens/forget_password/forget_password_option/forget_password_btn_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(MessDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              messForgetPasswordTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              messForgetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 30.0,
            ),
            ForgetPasswordButtonWidget(
              icon: Icons.email_outlined,
              title: messEmail,
              subTitle: messResetViaEMail,
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => ForgetPasswordMailScreen()));
              },
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
