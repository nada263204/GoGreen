import 'package:flutter/material.dart';
import 'package:graduation_project/Screens/OnboardingScreens/Onboarding.dart';
import 'package:graduation_project/core/widgets/widgets/wide_button.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/images/onboarding1.png'),
                ],
              ),
              Stack(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Ellipse 2.png',
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 262,
                      height: 348,
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(width: 2, color: Color(0xFFA5D6A7)),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/Ellipse 4.png',
                    width: 60,
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Text(
                'Find The Best Way To Recycle Your Waste ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.33),
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '❝ Recycling Turns Things into other Things. Which is Like ',
                      style: TextStyle(
                        color: Color(0xFF7A7979),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.33,
                      ),
                    ),
                    TextSpan(
                      text: 'MAGIC',
                      style: TextStyle(
                        color: Color(0xFFA5D6A7),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                        letterSpacing: -0.33,
                      ),
                    ),
                    TextSpan(
                      text:
                          '. become One of our Champions to save the Environment. ❞',
                      style: TextStyle(
                        color: Color(0xFF7A7979),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.33,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30.0,
              ),
              WideButton(
                  text: "Let's get started",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnboardingScreen(),
                      ),
                    );
                  }),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.16,
                  ),
                  const SizedBox(
                    width: 337,
                    height: 32,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an account ? ',
                            style: TextStyle(
                              color: Color(0xFF030303),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign in',
                            style: TextStyle(
                              color: Color(0xFFA5D6A7),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Color(0xFF030303),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
