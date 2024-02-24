import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/app_spacings.dart';
import '../constants/text_styles.dart';

class ChallengeBanner extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onIconPressed;
  final String subTitle;

  const ChallengeBanner({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onIconPressed,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              child: Image.asset(
                imagePath,
                width: 99.0,
                height: 99.0,
              ),
            ),
            AppSpacing.bannerSpace,
            Text(
              title,
              style: AppTextStyles.welcome.copyWith(
                color: AppColors.titleColor.withOpacity(1),
              ),
            ),
            AppSpacing.small,
            Text(subTitle, style: AppTextStyles.body),
          ],
        ),
      ),
    );
  }
}
