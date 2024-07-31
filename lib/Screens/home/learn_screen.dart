import 'package:flutter/material.dart';
import 'package:graduation_project/Screens/learn_articles_screen.dart';
import 'package:graduation_project/Widgets/text_scale.dart';

import '../../core/config/theme.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double safeArea = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: safeArea),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/learn.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.2,
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: AppTheme.primary,
                border: Border.all(
                  width: 3.0,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ways to reduce waste',
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(context, fontSize: 24.0),
                      fontWeight: FontWeight.bold,
                      color: AppTheme.black,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    child: Text(
                      'learn how you can make changes that are Eco-friendly and will have a lasting impact',
                      style: TextStyle(
                        fontSize:
                            getResponsiveFontSize(context, fontSize: 16.0),
                        fontWeight: FontWeight.w500,
                        color: AppTheme.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LearnArticlesScreen(),
                          ),
                        );
                      },
                      icon: CircleAvatar(
                        backgroundColor: AppTheme.white,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: AppTheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
