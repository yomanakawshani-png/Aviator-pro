class Session {
  double startingBalance;
  double currentBalance;
  List<int> rounds;
  double totalProfit;
  double winRate;
  int maxLossStreak;
  DateTime createdAt;

  Session({
    required this.startingBalance,
    required this.currentBalance,
    required this.rounds,
    required this.totalProfit,
    required this.winRate,
    required this.maxLossStreak,
    required this.createdAt,
  });

  // Method to analyze profit
  double profitAnalysis() {
    return currentBalance - startingBalance;
  }

  // Method to calculate win rate
  double calculateWinRate() {
    int wins = rounds.where((result) => result > 0).length;
    return (wins / rounds.length) * 100;
  }

  // Method to get analytics summary
  String analyticsSummary() {
    return 'Starting Balance: \\${startingBalance}\nCurrent Balance: \\$currentBalance\nTotal Profit: \\$totalProfit\nWin Rate: \\$winRate%\nMax Loss Streak: \\$maxLossStreak';
  }
}