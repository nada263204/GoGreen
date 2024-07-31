import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/config/theme.dart';

import 'chat_user_image.dart';
import 'text_scale.dart';

class ContactItemWidget extends StatelessWidget {
  const ContactItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final bool isDark = state.themeMode == ThemeMode.dark;
        return Row(
          children: [
            const ChatUserImage(img: 'assets/images/ahmed.png'),
            const SizedBox(width: 10.0),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mariam fawzy',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 16.0),
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppTheme.white : AppTheme.black,
                  ),
                ),
                const Text(
                  'online',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
