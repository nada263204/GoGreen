import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/Widgets/back_button.dart';
import 'package:graduation_project/Widgets/text_scale.dart';
import 'package:graduation_project/core/config/theme.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double safeArea = MediaQuery.of(context).padding.top;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: const CustomBackButton(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(
              'assets/images/bg.jpeg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0)
                    .add(EdgeInsets.only(top: safeArea)),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                const CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('assets/images/bg.jpeg'),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Mariam fawzy',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 32.0),
                    fontWeight: FontWeight.w700,
                    color: AppTheme.white,
                  ),
                ),
                Text(
                  'Incoming call',
                  style: TextStyle(color: AppTheme.white),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/svg/ic_alarm.svg'),
                        const SizedBox(height: 5.0),
                        Text(
                          'Remind me',
                          style: TextStyle(color: AppTheme.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/svg/ic_message.svg'),
                        const SizedBox(height: 5.0),
                        Text(
                          'Message',
                          style: TextStyle(color: AppTheme.white),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
                Image.asset('assets/images/answer_button.png'),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
