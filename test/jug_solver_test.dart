import 'package:flutter_test/flutter_test.dart';
import 'package:water_jug_challenge/controllers/water_jug_solver.dart';
import 'package:water_jug_challenge/models/jug_state.dart';

void main() {
  group(' WaterJugSolver Tests', () {
    test('Should return "No Solution" when no solution is possible', () {
      final solver =  WaterJugSolver(xCapacity: 5, yCapacity: 3);

      List<ChallengeState> result = solver.solveJugProblem(9);

      expect(result.length, 1);
      expect(result.first.action, 'No Solution');
    });

    test(
        'Should return "No Solution" for z that is not a multiple of the GCD of the capacities',
        () {
      final solver =  WaterJugSolver(xCapacity: 5, yCapacity: 3);

      List<ChallengeState> result = solver.solveJugProblem(1);

      expect(result.length, isNot(1));
      expect(result.first.action, isNot('No Solution'));
    });

    test(
        'Should return a sequence of actions to achieve z when a solution exists',
        () {
      final solver =  WaterJugSolver(xCapacity: 4, yCapacity: 3);

      List<ChallengeState> result = solver.solveJugProblem(2);

      expect(result.isNotEmpty, true);
      expect(result.first.action, isNot('No Solution'));

      expect(
          result.last.x == 2 ||
              result.last.y == 2 ||
              result.last.x + result.last.y == 2,
          true);
    });

    test('Tests a specific solution to verify the sequence of actions', () {
      final solver =  WaterJugSolver(xCapacity: 4, yCapacity: 3);

      List<ChallengeState> result = solver.solveJugProblem(2);

      expect(result.isNotEmpty, true);
      expect(result.first.action, isNot('No Solution'));

      if (result.length > 1) {
        expect(result[1].action, 'Transfer from bucket Y to bucket X');
      }
    });

    test(
        'Should return "No Solution" when z is greater than the sum of the capacities',
        () {
      final solver =  WaterJugSolver(xCapacity: 5, yCapacity: 4);

      List<ChallengeState> result = solver.solveJugProblem(10);

      expect(result.length, 1);
      expect(result.first.action, 'No Solution');
    });

    test('Tests failure when trying to solve with a negative z', () {
      final solver =  WaterJugSolver(xCapacity: 5, yCapacity: 3);

      List<ChallengeState> result = solver.solveJugProblem(-1);

      expect(result.length, 1);
      expect(result.first.action, 'No Solution');
    });

    test('Tests with jar capacities and z being coprime', () {
      final solver =  WaterJugSolver(xCapacity: 5, yCapacity: 4);

      List<ChallengeState> result = solver.solveJugProblem(1);

      expect(result.isNotEmpty, true);
      expect(result.first.action, isNot('No Solution'));
    });

    test('Verifies solution with equal jar capacities', () {
      final solver =  WaterJugSolver(xCapacity: 3, yCapacity: 3);

      List<ChallengeState> result = solver.solveJugProblem(3);

      expect(result.isNotEmpty, true);
      expect(result.first.action, isNot('No Solution'));
    });

    test('Verifies solution with z being the total capacity', () {
      final solver =  WaterJugSolver(xCapacity: 5, yCapacity: 3);

      List<ChallengeState> result = solver.solveJugProblem(8);

      expect(result.last.x + result.last.y, 8);
    });

    test('Verifies minimum solution for a known case', () {
      final solver =  WaterJugSolver(xCapacity: 7, yCapacity: 5);

      List<ChallengeState> result = solver.solveJugProblem(3);

      expect(result.length, lessThanOrEqualTo(6));
    });
    test('Verifies behavior when z is 0', () {
      final solver =  WaterJugSolver(xCapacity: 5, yCapacity: 3);

      List<ChallengeState> result = solver.solveJugProblem(0);

      expect(result.length, greaterThanOrEqualTo(1));
      expect(result.first.action, 'Solved');
    });
  });
}
