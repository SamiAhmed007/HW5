import 'package:hive/hive.dart';
import 'package:customizable_quiz_app/models/leaderboard_entry.dart';

class StorageService {
  static const String leaderboardBoxName = 'leaderboard';

  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(LeaderboardEntryAdapter());
  }

  static Future<List<LeaderboardEntry>> getLeaderboard() async {
    final box = await Hive.openBox<LeaderboardEntry>(leaderboardBoxName);
    return box.values.toList();
  }

  static Future<void> saveLeaderboardEntry(LeaderboardEntry entry) async {
    final box = await Hive.openBox<LeaderboardEntry>(leaderboardBoxName);
    await box.add(entry);
  }
}
