import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/auth/OTP/presentation/cubit/auth_cubit.dart';

import 'text_scale.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            final bool isDark = state.themeMode == ThemeMode.dark;
            print('Current state: ${state.authState}');
            if (state.authState is LoginSuccess ||
                state.authState is RegisterSuccess) {
              return Center(
                child: Text(
                  'Hi, ${(state.authState as LoginSuccess).user.name}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppTheme.white : AppTheme.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            } else if (state.authState is LoginLoading ||
                state.authState is RegisterLoading) {
              return const Center(child: LoadingIndicator());
            } else if (state.authState is LoginError ||
                state.authState is RegisterError) {
              return const Center(
                child: Text('Hi, Invalid User'),
              );
            }
            return const Center(child: Text('Welcome'));
          },
        ),
        Text(
          'Cairo, Egypt ',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: getResponsiveFontSize(context, fontSize: 20.0),
              ),
        ),
      ],
    );
  }
}
