import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Screen'),
      ),
      body: const Center(
        child: Text('Quiz Questions Go Here'),
      ),
    );
  }
}
