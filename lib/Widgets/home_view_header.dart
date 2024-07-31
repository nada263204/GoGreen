import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/Screens/notification_screen.dart';
import 'package:graduation_project/Screens/settings_screen.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/features/QR%20code/QRcode_reader_screen.dart';
import 'package:graduation_project/features/auth/OTP/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/data/models/user.dart';

import 'user_image.dart';
import 'user_info_widget.dart';

class HomeViewHeader extends StatefulWidget {
  final User? user;

  const HomeViewHeader({super.key, this.user});

  @override
  State<HomeViewHeader> createState() => _HomeViewHeaderState();
}

class _HomeViewHeaderState extends State<HomeViewHeader> {
  @override
  Widget build(BuildContext context) {
    final double safeArea = MediaQuery.of(context).padding.top;

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final bool isDark = state.themeMode == ThemeMode.dark;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0)
              .add(EdgeInsets.only(top: safeArea)),
          child: Row(
            children: [
              UserImage(
                  user: (state.authState is LoginSuccess)
                      ? (state.authState as LoginSuccess).user
                      : null),
              const UserInfoWidget(),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QRscanner(),
                    ),
                  );
                },
                icon: Image.asset('assets/icons/Qr Code.png'),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/svg/ic_settings.svg',
                  colorFilter: ColorFilter.mode(
                    isDark ? AppTheme.white : AppTheme.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/svg/ic_notification.svg',
                  colorFilter: ColorFilter.mode(
                    isDark ? AppTheme.white : AppTheme.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
