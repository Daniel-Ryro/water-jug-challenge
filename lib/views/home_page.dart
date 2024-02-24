import 'package:flutter/material.dart';
import '../constants/spacing.dart';
import '../helpers/localization.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/jug_form_widget.dart';
import '../widgets/banner_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Localization.get('app_title'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSpacing.bannerSpace,
            BannerWidget(
              title: Localization.get('banner_title'),
              imagePath: 'assets/imgs/jarro-de-agua.png',
              onIconPressed: () {},
              subTitle: Localization.get('fillFields'),
            ),
            AppSpacing.large,
            const JugFormWidget(),
            AppSpacing.large,
          ],
        ),
      ),
    );
  }
}
