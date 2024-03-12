import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mess_management_system/src/constants/colors.dart';
import 'package:mess_management_system/src/constants/sizes.dart';
import 'package:mess_management_system/src/constants/text_string.dart';
import 'package:mess_management_system/src/features/authentication/screens/login/login_screen.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({
    super.key,
    required this.isDarkMode,
  });
  final bool isDarkMode;

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController rollNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  void rat() {
    print("This is rat");
  }

  void createAccount() async {
    String email = emailController.text.trim();
    String rollNumber = rollNumberController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cPasswordController.text.trim();

    if (email == "" || rollNumber == "" || password == "" || cPassword == "") {
      log("Please fill all the credentials");
    } else if (password != cPassword) {
      log("Password do not match");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          Navigator.pop(context);
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => LoginScreen()));
        }
      } on FirebaseAuthException catch (ex) {
        log(ex.code.toString());
      }
    }
  }

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
                    color: widget.isDarkMode
                        ? messPrimaryColor
                        : messSecondaryColor,
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                      color: widget.isDarkMode
                          ? messPrimaryColor
                          : messSecondaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2.0,
                        color: widget.isDarkMode
                            ? messPrimaryColor
                            : messSecondaryColor),
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
                    color: widget.isDarkMode
                        ? messPrimaryColor
                        : messSecondaryColor,
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                      color: widget.isDarkMode
                          ? messPrimaryColor
                          : messSecondaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2.0,
                        color: widget.isDarkMode
                            ? messPrimaryColor
                            : messSecondaryColor),
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
                    color: widget.isDarkMode
                        ? messPrimaryColor
                        : messSecondaryColor,
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                      color: widget.isDarkMode
                          ? messPrimaryColor
                          : messSecondaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2.0,
                        color: widget.isDarkMode
                            ? messPrimaryColor
                            : messSecondaryColor),
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
                    color: widget.isDarkMode
                        ? messPrimaryColor
                        : messSecondaryColor,
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                      color: widget.isDarkMode
                          ? messPrimaryColor
                          : messSecondaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2.0,
                        color: widget.isDarkMode
                            ? messPrimaryColor
                            : messSecondaryColor),
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
