
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
- Test Case 4: xCapacity = 7, yCapacity = 11, z = 2
Expected Outcome: Solution found with a sequence of actions, demonstrating the algorithm's ability to handle larger capacities.
- Test Case 5: xCapacity = 1, yCapacity = 3, z = 3
Expected Outcome: "Solved" by filling the 3-liter jug, showcasing the solver's efficiency with straightforward scenarios.
- Test Case 6: xCapacity = 8, yCapacity = 9, z = 1
Expected Outcome: A sequence of actions that results in exactly 1 liter, illustrating the solver's capability to deal with close-capacity jugs.

# How to Run the Program
## Prerequisites 
- Make sure Flutter/Dart is installed on your computer. For installation guidance, check out [Dart's official installation guide](https://dart.dev/get-dart).
- Flutter SDK Version: Your system should have Flutter SDK version >=3.2.3 <4.0.0 installed to ensure compatibility. For Flutter installation and version management, visit [Flutter's official installation guide](https://docs.flutter.dev/get-started/install).

## Steps

0. ### Clone the Repository: Fetch the project from GitHub to your local machine with:
```
git clone https://github.com/Daniel-Ryro/water-jug-challenge.git
```

1. ### Navigate to the Project Director:y change into the project directory:
```
cd water_jug_challenge
```
2. ### Run the Program: execute the program by running:
```
dart run
```
3. ### Running Tests Execute the test suite to verify the implementation:
```
dart test
```

## Developer's Notes

0. **Project Structure**:
 - I decided to go with the MVC pattern because it's simpler and works better with the project. I thought about using clean architecture, but it would add unnecessary complexity.
 - I used Flutter's native state management. Again, I could have added Riverpod or Provider, but for what was stipulated, Flutter's state management worked well.
 - I modularized the project following the principles of Flutter Modular, ideal for Scalability, with the exception of routes since the project currently consists of only one screen.
   However, it's designed to easily integrate a route management system.
- I used the following libraries and their versions: cupertino_icons, flutter_localization
- I used a PNG for the image of the jug in the banner. I attempted to use an SVG for its handling benefits, but I couldn't find a valid SVG for the challenge. Therefore, I applied the PNG instead.
- I wrote some units tests to achieve good code coverage. Perhaps with more time, I would write a few more.













