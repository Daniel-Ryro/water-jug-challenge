import 'package:flutter/material.dart';
import '../../models/jug_state.dart';
import 'no_solution_widget.dart';
import 'solution_available_widget.dart';

class SolutionDisplayWidget extends StatelessWidget {
  final List<JugState> solutionSteps;

  const SolutionDisplayWidget({Key? key, required this.solutionSteps})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return solutionSteps.isEmpty
        ? const NoSolutionWidget()
        : SolutionAvailableWidget(solutionSteps: solutionSteps);
  }
}
