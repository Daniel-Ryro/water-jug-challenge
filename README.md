
# Water Jug Challenge

This project implements a solution to the classic water jug challenge, where the goal is to measure out a specific amount of water using only two jugs of fixed capacities and an unlimited supply of water. The solution demonstrates the use of algorithmic problem solving to achieve the desired outcome.

# Algorithmic Approach

The solution is based on the Breadth-First Search (BFS) algorithm, which explores all possible states (combinations of water in each jug) starting from the initial state (both jugs empty). The key to the solution is understanding that the problem can be represented as a graph where each node represents a state (a specific amount of water in each jug), and each edge represents an action (fill, empty, transfer). The BFS algorithm is used to find the shortest path from the initial state to a state where one of the jugs or the sum of both jugs equals the target amount of water.

Mathematically, the solution is feasible if the target amount z is a multiple of the greatest common divisor (GCD) of the two jug capacities. This is derived from the Bezout's identity, which states that for any integers a and b, every integer combination of a and b can generate the GCD of a and b.

# Test Cases for Validation

Several test cases are provided to validate the solution:
- Test Case 1: xCapacity = 3, yCapacity = 5, z = 4
Expected Outcome: A sequence of actions leads to the solution.
- Test Case 2: xCapacity = 2, yCapacity = 6, z = 5
Expected Outcome: No Solution, as 5 isn't a multiple of the GCD of 2 and 6.
- Test Case 3: xCapacity = 5, yCapacity = 3, z = 0
Expected Outcome: Solved without action, since the initial state already meets the target.

# How to Run the Program
## Prerequisites 
- Make sure Flutter/Dart is installed on your computer. For installation guidance, check out [Dart's official installation guide](https://dart.dev/get-dart).
- Flutter SDK Version: Your system should have Flutter SDK version >=3.2.3 <4.0.0 installed to ensure compatibility. For Flutter installation and version management, visit [Flutter's official installation guide](https://docs.flutter.dev/get-started/install).

## Steps

0. ### Clone the Repository: Fetch the project from GitHub to your local machine with:
```git clone https://github.com/Daniel-Ryro/water-jug-challenge```

1. ### Navigate to the Project Directory:
```cd water_jug_challenge```

2. ### Run the Program:
```dart run```

3. ### Running Tests: Execute the test suite to verify the implementation:
```dart test```






