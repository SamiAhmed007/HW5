import 'package:flutter/material.dart';

class QuizSetupScreen extends StatelessWidget {
  const QuizSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Setup'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to QuizScreen (replace with actual logic)
            Navigator.pushNamed(context, '/quiz');
          },
          child: const Text('Start Quiz'),
        ),
      ),
    );
  }
}
