import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mess_management_system/src/constants/colors.dart';
import 'package:mess_management_system/src/constants/sizes.dart';
import 'package:mess_management_system/src/constants/text_string.dart';
import 'package:mess_management_system/src/features/authentication/screens/forget_password/forget_password_option/forget_password_modal_bottom_sheet.dart';
import 'package:mess_management_system/src/features/authentication/screens/home_screen/HomeScreen.dart';
import 'package:mess_management_system/src/vendor/home/bottom_navigation.dart';
import 'package:mess_management_system/src/vendor/home/home.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passColtroller = TextEditingController();
  bool _isLoading = false;

  Future<void> login() async {
    String email = _emailController.text.trim();
    String password = _passColtroller.text.trim();
    setState(() {
      _isLoading = true;
    });

    if (email == "" || password == "") {
      print("Please fill the user credentials");
    } else {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential != null) {
        print("User Login Successfull");
        setState(() {
          _isLoading = false;
        });
        if (email == 'kumar@iitbhilai.ac.in' ||
            email == 'galav@iitbhilai.ac.in' ||
            email == 'sreesai@iitbhilai.ac.in') {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                  builder: (context) => VendorBottomNavigationMenu()));
        } else {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
              context, CupertinoPageRoute(builder: (context) => HomeScreen()));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: messFormHeight - 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_2_outlined),
              labelText: messEmail,
              hintText: messEmail,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: messFormHeight,
          ),
          TextFormField(
            controller: _passColtroller,
            decoration: const InputDecoration(
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
          const SizedBox(
            height: messFormHeight,
          ),

          // Forget Password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const Text(messForgetPassword)),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: const RoundedRectangleBorder(),
                  foregroundColor:
                      widget.isDarkMode ? messSecondaryColor : messWhiteColor,
                  backgroundColor:
                      widget.isDarkMode ? messWhiteColor : messSecondaryColor,
                  side: BorderSide(
                    color: messSecondaryColor,
                  ),
                  padding: EdgeInsets.symmetric(vertical: messButtonHeight),
                ),
                onPressed: () {
                  login();
                },
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(messLogin.toUpperCase())),
          )
        ],
      ),
    ));
  }
}
