import 'package:flutter/material.dart';
import 'package:mess_management_system/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:mess_management_system/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:mess_management_system/src/utils/theme/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MessAppTheme.lightTheme,
      darkTheme: MessAppTheme.darkTheme,
      home: OnBoardingScreen(),
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
