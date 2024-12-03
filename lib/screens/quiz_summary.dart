import 'package:flutter/material.dart';
import 'leaderboard.dart';
import 'quiz_setup.dart';
import '../services/storage_service.dart';
import '../models/leaderboard_entry.dart';

class QuizSummary extends StatelessWidget {
  final String playerName;
  final int score;
  final int totalQuestions;

  const QuizSummary({
    Key? key,
    required this.playerName,
    required this.score,
    required this.totalQuestions,
  }) : super(key: key);

  void _saveToLeaderboard(BuildContext context) async {
    final entry = LeaderboardEntry(playerName: playerName, score: score);
    await StorageService.saveLeaderboardEntry(entry);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Score saved to leaderboard!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Congratulations, $playerName!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Your Score: $score / $totalQuestions',
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _saveToLeaderboard(context);
              },
              child: const Text('Save to Leaderboard'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LeaderboardScreen(),
                  ),
                );
              },
              child: const Text('View Leaderboard'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizSetupScreen(),
                  ),
                );
              },
              child: const Text('Retake Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
