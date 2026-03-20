class AnalyticsService {
  List<double> multipliers;
  List<bool> results; // true for win, false for loss

  AnalyticsService({required this.multipliers, required this.results});

  double calculateAverageMultiplier() {
    if (multipliers.isEmpty) return 0.0;
    return multipliers.reduce((a, b) => a + b) / multipliers.length;
  }

  int calculateStreaks() {
    int currentStreak = 0;
    int maxStreak = 0;

    for (var result in results) {
      if (result) {
        currentStreak++;
        maxStreak = currentStreak > maxStreak ? currentStreak : maxStreak;
      } else {
        currentStreak = 0;
      }
    }
    return maxStreak;
  }

  double calculateWinRate() {
    if (results.isEmpty) return 0.0;
    int wins = results.where((result) => result).length;
    return wins / results.length * 100;
  }
}