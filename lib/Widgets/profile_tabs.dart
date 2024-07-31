import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';

import '../core/config/theme.dart';
import 'text_scale.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final bool isDark = state.themeMode == ThemeMode.dark;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Photos',
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 14.0),
                fontWeight: FontWeight.bold,
                color: AppTheme.primary,
              ),
            ),
            Text(
              'Photos',
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 14.0),
                fontWeight: FontWeight.bold,
                color: isDark ? AppTheme.white : AppTheme.black,
              ),
            ),
          ],
        );
      },
    );
  }
}
