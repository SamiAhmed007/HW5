// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LeaderboardEntryAdapter extends TypeAdapter<LeaderboardEntry> {
  @override
  final int typeId = 0;

  @override
  LeaderboardEntry read(BinaryReader reader) {
    return LeaderboardEntry(
      playerName: reader.readString(),
      score: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, LeaderboardEntry obj) {
    writer.writeString(obj.playerName);
    writer.writeInt(obj.score);
  }
}
