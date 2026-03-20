// Simulation Service Implementation

class SimulationService {
    // Generates a crash multiplier based on the input parameters
    double generateCrashMultiplier(double baseValue, double variance) {
        return baseValue + (variance * _random.nextDouble());
    }

    // Runs a simulation for a specified number of rounds
    List<double> runSimulation(int rounds) {
        List<double> results = [];
        for (int i = 0; i < rounds; i++) {
            results.add(_simulateRound());
        }
        return results;
    }

    // Simulates a single round and returns the result
    double _simulateRound() {
        double crashMultiplier = generateCrashMultiplier(1.0, 0.2);
        return crashMultiplier; // Placeholder for actual simulation logic
    }

    // Compares different strategies and returns the results
    Map<String, List<double>> compareStrategies(List<String> strategies, int rounds) {
        Map<String, List<double>> comparisonResults = {};
        for (String strategy in strategies) {
            comparisonResults[strategy] = runSimulation(rounds);
        }
        return comparisonResults;
    }

    // Returns detailed simulation results
    Map<String, dynamic> getDetailedResults(List<double> simulationResults) {
        double average = simulationResults.reduce((a, b) => a + b) / simulationResults.length;
        return {
            'average': average,
            'total': simulationResults.length,
            'max': simulationResults.reduce((a, b) => a > b ? a : b),
            'min': simulationResults.reduce((a, b) => a < b ? a : b),
        };
    }
}

// Note: Implement random generator as needed.

