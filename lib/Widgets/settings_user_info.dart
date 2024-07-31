import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/auth/OTP/presentation/cubit/auth_cubit.dart';

import 'text_scale.dart';
import 'user_image.dart';

class SettingUserInfo extends StatelessWidget {
  const SettingUserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const UserImage(),
          BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              final bool isDark = state.themeMode == ThemeMode.dark;
              return BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  if (state.authState is LoginSuccess ||
                      state.authState is RegisterSuccess) {
                    return Text(
                      '${(state.authState as LoginSuccess).user.name}',
                      style: TextStyle(
                        fontSize:
                            getResponsiveFontSize(context, fontSize: 30.0),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Rubik',
                        color: isDark ? AppTheme.white : AppTheme.black,
                      ),
                    );
                  } else if (state.authState is LoginLoading ||
                      state.authState is RegisterLoading) {
                    return const LoadingIndicator();
                  } else if (state.authState is LoginError ||
                      state.authState is RegisterError) {
                    return Text(
                      'Invalid User',
                      style: TextStyle(
                        fontSize:
                            getResponsiveFontSize(context, fontSize: 18.0),
                        fontWeight: FontWeight.w400,
                        color: isDark ? AppTheme.white : AppTheme.black,
                      ),
                    );
                  }
                  return Text(
                    'Invalid User',
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(context, fontSize: 18.0),
                      fontWeight: FontWeight.w400,
                      color: isDark ? AppTheme.white : AppTheme.black,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
