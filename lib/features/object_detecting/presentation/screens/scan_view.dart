import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Widgets/text_scale.dart';
import '../../../../core/config/theme.dart';
import 'scan_view_body.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    final double safeArea = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0)
            .add(EdgeInsets.only(top: safeArea)),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset('assets/svg/cam_frame.svg'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScanViewBody(),
                    ),
                  );
                },
                child: Text(
                  'use the camera to scan ',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 24.0),
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primaryLight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
