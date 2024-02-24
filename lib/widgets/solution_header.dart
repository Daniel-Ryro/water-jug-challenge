import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/pading.dart';
import '../constants/text_styles.dart';

class SolutionHeader extends StatelessWidget {
  const SolutionHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.solutionHeaderPadding,
      child: Text(
        'Resultado',
        style: AppTextStyles.welcome.copyWith(
          color: AppColors.textColor,
        ),
      ),
    );
  }
}
