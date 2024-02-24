import 'package:flutter/material.dart';
import '../constants/app_spacings.dart';
import '../helpers/localization_helper.dart';
import '../widgets/app_bar.dart';
import '../widgets/jug_challenge_form.dart';
import '../widgets/banner.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChallengeAppBar(
        title: AppLocalization .get('app_title'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSpacing.bannerSpace,
            ChallengeBanner(
              title: AppLocalization .get('banner_title'),
              imagePath: 'assets/imgs/jarro-de-agua.png',
              onIconPressed: () {},
              subTitle: AppLocalization .get('fillFields'),
            ),
            AppSpacing.large,
            const WaterJugForm(),
            AppSpacing.large,
          ],
        ),
      ),
    );
  }
}
