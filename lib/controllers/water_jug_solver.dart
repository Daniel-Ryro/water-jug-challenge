import 'dart:collection';
import 'dart:math';

import '../models/jug_state.dart';

int gcd(int a, int b) {
  if (b == 0) {
    return a;
  }
  return gcd(b, a % b);
}

class WaterJugSolver {
  int xCapacity, yCapacity;

  WaterJugSolver({required this.xCapacity, required this.yCapacity});

  List<ChallengeState> solveJugProblem(int z) {
    if (z > xCapacity + yCapacity || z % gcd(xCapacity, yCapacity) != 0) {
      return [ChallengeState(0, 0, 'No Solution')];
    }

    Set<String> visited = {};
    Queue<List<dynamic>> queue = Queue();

    queue.add([
      [0, 0],
      <ChallengeState>[]
    ]);

    while (queue.isNotEmpty) {
      var current = queue.removeFirst();
      List<int> state = current[0] as List<int>; // Cast para List<int>
      List<ChallengeState> path =
          current[1] as List<ChallengeState>; // Cast para List<ChallengeState>

      String stateKey = "${state[0]},${state[1]}";

      if (visited.contains(stateKey)) continue;
      visited.add(stateKey);

      int x = state[0], y = state[1];

      if (x == z || y == z) {
        path.add(ChallengeState(x, y, 'Solved'));
        return path;
      }

      var possibleStates = [
        [xCapacity, y, 'Fill bucket X'],
        [x, yCapacity, 'Fill bucket Y'],
        [0, y, 'Empty bucket X'],
        [x, 0, 'Empty bucket Y'],
        [
          x - min(x, yCapacity - y),
          y + min(x, yCapacity - y),
          'Transfer from bucket X to bucket Y'
        ],
        [
          x + min(y, xCapacity - x),
          y - min(y, xCapacity - x),
          'Transfer from bucket Y to bucket X'
        ]
      ];

      for (var nextState in possibleStates) {
        int nextX = nextState[0] as int;
        int nextY = nextState[1] as int;
        String action = nextState[2] as String;

        String nextStateKey = "$nextX,$nextY";

        if (!visited.contains(nextStateKey)) {
          List<ChallengeState> newPath = List.from(path)
            ..add(ChallengeState(nextX, nextY, action));
          queue.add([
            [nextX, nextY],
            newPath
          ]);
        }
      }
    }

    return [ChallengeState(0, 0, 'No Solution')];
  }
}
