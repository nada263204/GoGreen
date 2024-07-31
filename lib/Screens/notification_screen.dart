import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Widgets/back_button.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/config/theme.dart';

import '../Widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                final bool isDark = state.themeMode == ThemeMode.dark;
                return Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w500,
                    color: isDark ? AppTheme.white : AppTheme.black,
                  ),
                );
              },
            ),
            const SizedBox(height: 40.0),
            const NotificationItem(),
            const NotificationItem(),
            const NotificationItem(),
            // Expanded(child: NotificationsList()),
          ],
        ),
      ),
    );
  }
}
