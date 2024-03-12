import 'package:flutter/material.dart';

class FutureBuilderLoading extends StatelessWidget {
  const FutureBuilderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyButton(),
        ),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isLoading = false;

  Future<void> longRunningTask() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate a long-running task (e.g., network request)
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: longRunningTask,
      child: _isLoading
          ? CircularProgressIndicator(color: Colors.white)
          : Text('Press me'),
    );
  }
}
