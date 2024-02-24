import 'package:flutter/material.dart';
import 'package:water_jug_challenge/widgets/solution_header.dart';
import 'package:water_jug_challenge/widgets/solution_table.dart';

import '../../models/jug_state.dart';
import '../constants/app_spacings.dart';

class SolutionAvailableIndicator extends StatelessWidget {
  final List<ChallengeState> solutionSteps;

  const SolutionAvailableIndicator({Key? key, required this.solutionSteps})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double tableMaxWidth =
        MediaQuery.of(context).size.width > 600 ? 600 : screenWidth;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpacing.bannerSpace,
        const Center(
          child: SolutionHeader(),
        ),
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: tableMaxWidth),
            child: SolutionTable(solutionSteps: solutionSteps),
          ),
        ),
      ],
    );
  }
}
