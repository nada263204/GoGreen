import 'package:flutter/material.dart';

import '../core/config/theme.dart';
import 'text_scale.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({
    super.key,
    required this.safeArea,
  });

  final double safeArea;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.33,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0)
          .add(EdgeInsets.only(top: safeArea)),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20.0),
        ),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.settings,
              color: AppTheme.white,
              size: 40.0,
            ),
            Text(
              'Settings',
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 24.0),
                color: AppTheme.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
