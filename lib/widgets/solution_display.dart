import 'package:flutter/material.dart';
import '../../models/jug_state.dart';
import 'no_solution_message.dart';
import 'solution_indicator.dart';

class SolutionDisplayWidget extends StatelessWidget {
  final List<ChallengeState> solutionSteps;

  const SolutionDisplayWidget({Key? key, required this.solutionSteps})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return solutionSteps.isEmpty
        ? const NoSolutionIndicator()
        : SolutionAvailableIndicator(solutionSteps: solutionSteps);
  }
}
