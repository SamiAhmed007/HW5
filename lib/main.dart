import 'package:flutter/material.dart';
import 'screens/quiz_setup.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customizable Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizSetupScreen(),
      routes: {
        '/quiz': (context) => const QuizScreen(), // Correct navigation to QuizScreen
      },
    );
  }
}
