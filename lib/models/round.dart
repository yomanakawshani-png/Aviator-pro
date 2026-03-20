class Round {
  double multiplier;
  double betAmount;
  double cashoutTarget;
  bool result;
  DateTime timestamp;

  Round({
    required this.multiplier,
    required this.betAmount,
    required this.cashoutTarget,
    required this.result,
    required this.timestamp,
  });

  bool hasWon() {
    return result;
  }

  String getFormattedTimestamp() {
    return timestamp.toUtc().toIso8601String();
  }
}