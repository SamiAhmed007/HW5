import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import '../models/leaderboard_entry.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  Future<List<LeaderboardEntry>> _loadLeaderboard() async {
    final entries = await StorageService.getLeaderboard();
    entries.sort((a, b) => b.score.compareTo(a.score));
    return entries;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leaderboard')),
      body: FutureBuilder<List<LeaderboardEntry>>(
        future: _loadLeaderboard(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final leaderboard = snapshot.data!;
            if (leaderboard.isEmpty) {
              return const Center(child: Text('No scores available yet.'));
            }

            return ListView.builder(
              itemCount: leaderboard.length,
              itemBuilder: (context, index) {
                final entry = leaderboard[index];
                return ListTile(
                  leading: Text('${index + 1}'),
                  title: Text(entry.playerName),
                  trailing: Text('Score: ${entry.score}'),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
