import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:mess_management_system/src/common_widgets/form/form_header_widget.dart';
import 'package:mess_management_system/src/constants/colors.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:mess_management_system/src/constants/sizes.dart';
import 'package:mess_management_system/src/constants/text_string.dart';
import 'package:mess_management_system/src/features/authentication/screens/login/login_footer_widget.dart';
import 'package:mess_management_system/src/features/authentication/screens/login/login_screen.dart';
import 'package:mess_management_system/src/features/authentication/screens/signup/signup_form_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final size = mediaQuery.size;

    TextEditingController emailController = TextEditingController();
    TextEditingController rollNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController cPasswordController = TextEditingController();

    Future<void> createAccount() async {
      String email = emailController.text.trim();
      String rollNumber = rollNumberController.text.trim();
      String password = passwordController.text.trim();
      String cPassword = cPasswordController.text.trim();

      setState(() {
        _isLoading = true;
      });

      print(email);
      print(rollNumber);
      print(password);
      print(cPassword);

      if (email == "" ||
          rollNumber == "" ||
          password == "" ||
          cPassword == "") {
        log("Please fill all the credentials");
      } else if (password != cPassword) {
        log("Password do not match");
      } else {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          if (userCredential.user != null) {
            setState(() {
              _isLoading = false;
            });
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => LoginScreen()));
            Map<String, dynamic> newUser = {
              "email": email,
              "rollNumber": rollNumber,
              "password": password,
              "cPassword": cPassword
            };
            await FirebaseFirestore.instance.collection("users").add(newUser);
            print("New User craeted successfully");
          }
        } on FirebaseAuthException catch (ex) {
          log(ex.code.toString());
        }
      }
    }

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
                Container(
                  padding: EdgeInsets.symmetric(vertical: messFormHeight - 10),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              label: Text(messEmail),
                              prefixIcon: Icon(
                                Icons.person_2_outlined,
                                color: isDarkMode
                                    ? messPrimaryColor
                                    : messSecondaryColor,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  color: isDarkMode
                                      ? messPrimaryColor
                                      : messSecondaryColor),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2.0,
                                    color: isDarkMode
                                        ? messPrimaryColor
                                        : messSecondaryColor),
                              )),
                        ),
                        SizedBox(
                          height: messFormHeight - 20,
                        ),
                        TextFormField(
                          controller: rollNumberController,
                          decoration: InputDecoration(
                              label: Text(messRollNumber),
                              prefixIcon: Icon(
                                Icons.numbers,
                                color: isDarkMode
                                    ? messPrimaryColor
                                    : messSecondaryColor,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  color: isDarkMode
                                      ? messPrimaryColor
                                      : messSecondaryColor),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2.0,
                                    color: isDarkMode
                                        ? messPrimaryColor
                                        : messSecondaryColor),
                              )),
                        ),
                        SizedBox(
                          height: messFormHeight - 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              label: Text(messPassword),
                              prefixIcon: Icon(
                                Icons.password_rounded,
                                color: isDarkMode
                                    ? messPrimaryColor
                                    : messSecondaryColor,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  color: isDarkMode
                                      ? messPrimaryColor
                                      : messSecondaryColor),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2.0,
                                    color: isDarkMode
                                        ? messPrimaryColor
                                        : messSecondaryColor),
                              )),
                        ),
                        SizedBox(
                          height: messFormHeight - 20,
                        ),
                        TextFormField(
                          controller: cPasswordController,
                          decoration: InputDecoration(
                              label: Text(messConfirmPassword),
                              prefixIcon: Icon(
                                Icons.password_outlined,
                                color: isDarkMode
                                    ? messPrimaryColor
                                    : messSecondaryColor,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  color: isDarkMode
                                      ? messPrimaryColor
                                      : messSecondaryColor),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2.0,
                                    color: isDarkMode
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
                        padding:
                            EdgeInsets.symmetric(vertical: messButtonHeight),
                      ),
                      onPressed: () {
                        createAccount();
                      },
                      child: _isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(messSignup.toUpperCase())),
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
