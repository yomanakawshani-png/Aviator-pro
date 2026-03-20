class SimulationResult {
  final double finalBalance;
  final double profitLoss;
  final double winRate;
  final int maxLossStreak;
  final double drawdown;

  SimulationResult({
    required this.finalBalance,
    required this.profitLoss,
    required this.winRate,
    required this.maxLossStreak,
    required this.drawdown,
  });
}

class SimulationService {
  double crashMultiplierGenerator() {
    // Generate a random crash multiplier
    return Random().nextDouble() * (xMax - xMin) + xMin; // Example logic
  }

  SimulationResult singleRoundSimulation(double initialBalance, double betAmount, String strategy) {
    // Implement single round simulation logic based on strategy
    // Return SimulationResult object
  }

  List<SimulationResult> multipleRoundSimulation(int rounds, double initialBalance, double betAmount, String strategy) {
    // Implement multiple rounds simulation logic based on strategy
    // Return a list of SimulationResult objects
  }

  // Implement fixed and Martingale strategy logic
}