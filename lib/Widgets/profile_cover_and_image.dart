import 'package:flutter/material.dart';
import 'package:graduation_project/Widgets/back_button.dart';
import 'package:graduation_project/core/config/theme.dart';

import 'profile_image_widget.dart';

class ProfileCoverAndImage extends StatelessWidget {
  const ProfileCoverAndImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double safeArea = MediaQuery.of(context).padding.top;
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Image.asset('assets/images/profile_cover.png'),
        Positioned(
          top: safeArea,
          left: 0.0,
          child: CustomBackButton(bgColor: AppTheme.primary),
        ),
        const Positioned(
          bottom: -85.0,
          child: ProfileImageWidget(),
        ),
      ],
    );
  }
}
