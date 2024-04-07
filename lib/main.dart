import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mess_management_system/firebase_options.dart';
import 'package:mess_management_system/src/features/authentication/screens/bottom_navigation_bar/BottomNavigationMenu.dart';
import 'package:mess_management_system/src/features/authentication/screens/home_screen/HomeScreen.dart';
import 'package:mess_management_system/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:mess_management_system/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:mess_management_system/src/utils/theme/theme.dart';
import 'package:mess_management_system/src/vendor/home/bottom_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    String? userEmail = FirebaseAuth.instance.currentUser?.email;
    return MaterialApp(
      theme: MessAppTheme.lightTheme,
      darkTheme: MessAppTheme.darkTheme,
      home: (userEmail == "kumar@iitbhilai.ac.in" ||
              userEmail == "sreesai@iitbhilai.ac.in" ||
              userEmail == "galav@iitbhilai.ac.in")
          ? VendorBottomNavigationMenu()
          : (userEmail != null)
              ? BottomNavigationMenu()
              : OnBoardingScreen(),
    );
  }
}

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(".appable/"),
        leading: const Icon(Icons.ondemand_video),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_shopping_cart),
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              "Hello",
            ),
            const Text("Hello"),
            const Text("Hello"),
            const Text("Hello"),
            ElevatedButton(
              onPressed: () {},
              child: Text("Elevated Button"),
            )
          ],
        ),
      ),
    );
  }
}
