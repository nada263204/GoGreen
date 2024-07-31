import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/QR%20code/QRcode_reader_screen.dart';
import 'package:graduation_project/features/auth/OTP/presentation/cubit/auth_cubit.dart';

import '../core/config/theme.dart';
import '../features/object_detecting/presentation/widgets/p_a_c_item_widget.dart';

class PointsAndRecWidget extends StatelessWidget {
  const PointsAndRecWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final bool isDark = state.themeMode == ThemeMode.dark;
        if (state.authState is LoginSuccess ||
            state.authState is RegisterSuccess) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QRscanner()),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: isDark ? AppTheme.primary : null,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: AppTheme.primary, width: 3.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PACItemWidget(
                    imgPath: 'assets/images/points.png',
                    number: (state.authState as LoginSuccess).user.points ?? 0,
                    title: 'Points',
                  ),
                  Container(
                    width: 4.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color:
                          isDark ? const Color(0xffA5D6A7) : AppTheme.primary,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  PACItemWidget(
                    imgPath: 'assets/images/recycles.png',
                    number:
                        (state.authState as LoginSuccess).user.recycles ?? 0,
                    title: 'Recycles',
                  ),
                ],
              ),
            ),
          );
        } else if (state.authState is LoginLoading ||
            state.authState is RegisterLoading) {
          return const Center(child: LoadingIndicator());
        } else if (state.authState is LoginError ||
            state.authState is RegisterError) {
          return const Center(
            child: Text('zero'),
          );
        }
        return const Center(child: Text('Welcome'));
      },
    );
  }
}
