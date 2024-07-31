import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';

import '../core/config/theme.dart';

class PinFavChatWidget extends StatelessWidget {
  const PinFavChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final bool isDark = state.themeMode == ThemeMode.dark;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.grey, width: 1.0),
              ),
              child: Icon(
                Icons.add,
                color: isDark ? AppTheme.white : AppTheme.black,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              'Pin favorite',
              style: TextStyle(
                color: isDark ? AppTheme.white : AppTheme.black,
              ),
            ),
          ],
        );
      },
    );
  }
}
