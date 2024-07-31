import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';

import '../core/config/theme.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    this.trailing,
    this.onTap,
  });
  final Widget? trailing;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final bool isDark = state.themeMode == ThemeMode.dark;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListTile(
            onTap: onTap,
            title: Text(
              title,
              style: TextStyle(
                color: isDark ? AppTheme.white : AppTheme.black,
              ),
            ),
            trailing: trailing ??
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20.0,
                  color: AppTheme.grey,
                ),
          ),
        );
      },
    );
  }
}
