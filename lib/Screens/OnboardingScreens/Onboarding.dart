import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Screens/OnboardingScreens/Onboarding_controller.dart';
import 'package:graduation_project/Screens/OnboardingScreens/Rich_Texts.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  final controller = Get.put(OnboardingController());
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            itemCount: 4,
            itemBuilder: (context, index) {
              return PageTransitionSwitcher(
                transitionBuilder: (
                  Widget child,
                  Animation<double> primaryAnimation,
                  Animation<double> secondaryAnimation,
                ) {
                  return FadeThroughTransition(
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                child: [
                  const OnboardingPage(
                    key: ValueKey('page1'),
                    image: 'assets/images/onboarding/1.png',
                    imageBorder: 'assets/images/onboarding/Ellipse 20.png',
                    title: 'Scan and Sort your Packages',
                    subtitle: OnboardingRich1(),
                  ),
                  const OnboardingPage(
                    key: ValueKey('page2'),
                    image: 'assets/images/onboarding/2.png',
                    imageBorder: 'assets/images/onboarding/Ellipse 20.png',
                    title: 'Find Nearby recycling centers',
                    subtitle: OnboardingRich_2(),
                  ),
                  const OnboardingPage(
                    key: ValueKey('page3'),
                    image: 'assets/images/onboarding/3.png',
                    imageBorder: 'assets/images/onboarding/Ellipse 20.png',
                    title: 'Share your progress to the Community',
                    subtitle: OnboardingRich_3(),
                  ),
                  const OnboardingPage(
                    key: ValueKey('page4'),
                    image: 'assets/images/onboarding/4.png',
                    imageBorder: 'assets/images/onboarding/Ellipse 20.png',
                    title: 'Create your own Magic recycle by AI',
                    subtitle: OnboardingRich_4(),
                  ),
                ][index],
              );
            },
          ),
          Positioned(
            top: 60,
            right: 10,
            child: TextButton(
              onPressed: () => OnboardingController.instance.skipPage(context),
              child: Text(
                'Skip',
                style: TextStyle(color: AppTheme.primaryLight),
              ),
            ),
          ),
          NavPageIndicator(),
          Positioned(
            bottom: 50,
            right: 20,
            child: IconButton(
              color: AppTheme.primaryLight,
              iconSize: 70,
              onPressed: () => OnboardingController.instance.nextPage(context),
              icon: const Icon(
                Icons.arrow_circle_right_rounded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavPageIndicator extends StatelessWidget {
  final controller = OnboardingController.instance;
  NavPageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 180,
      right: 150,
      child: SmoothPageIndicator(
        effect: ExpandingDotsEffect(
          activeDotColor: AppTheme.primaryLight,
          dotHeight: 8,
          dotWidth: 8,
          expansionFactor: 4,
        ),
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 4,
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String imageBorder;
  final String title;
  final Widget subtitle;
  const OnboardingPage({
    super.key,
    required this.image,
    required this.imageBorder,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(image),
            Image.asset(imageBorder),
          ],
        ),
        const SizedBox(
          height: 58,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.black,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        subtitle,
      ],
    );
  }
}
