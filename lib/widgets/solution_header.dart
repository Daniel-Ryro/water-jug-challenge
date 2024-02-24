import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/app_paddings.dart';
import '../constants/text_styles.dart';
import '../helpers/localization_helper.dart';

class SolutionHeader extends StatelessWidget {
  const SolutionHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.solutionHeaderPadding,
      child: Text(
       AppLocalization .get('response'),
        style: AppTextStyles.welcome.copyWith(
          color: AppColors.textColor,
        ),
      ),
    );
  }
}
