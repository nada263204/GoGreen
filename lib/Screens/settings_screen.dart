import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Screens/edit_profile_screen.dart';
import 'package:graduation_project/features/community/feed/view/screens/community_screen.dart';
import 'package:graduation_project/Screens/home/location_view.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/features/auth/OTP/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/chatbot/ui/home.dart';
import 'package:graduation_project/features/payment/payment_screen.dart';

import '../Widgets/settings_header.dart';
import '../Widgets/settings_item.dart';
import '../Widgets/settings_user_info.dart';
import '../Widgets/text_scale.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();
    final double safeArea = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SettingsHeader(safeArea: safeArea),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: MediaQuery.sizeOf(context).height * 0.78,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1.0,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SettingUserInfo(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Divider(),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Account Settings',
                        style: TextStyle(
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 18.0),
                          fontWeight: FontWeight.w400,
                          color: AppTheme.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    SettingsItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const EditProfileScreen(),
                          ),
                        );
                      },
                      title: 'Edit profile',
                    ),
                    SettingsItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const CommunityScreen(),
                          ),
                        );
                      },
                      title: 'Community',
                    ),
                    SettingsItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const LocationView(),
                          ),
                        );
                      },
                      title: 'Location',
                    ),
                    SettingsItem(
                      title: 'My AI',
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                    ),
                    SettingsItem(
                      title: 'Add a payment method',
                      trailing: const Icon(Icons.add),
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const PaymentScreen(),
                          ),
                        );
                      },
                    ),
                    BlocBuilder<AppCubit, AppState>(
                      builder: (context, state) {
                        return SettingsItem(
                          title: 'Dark mode',
                          trailing: CupertinoSwitch(
                            value: state.themeMode == ThemeMode.dark,
                            onChanged: (val) {
                              appCubit.switchTheme();
                            },
                          ),
                        );
                      },
                    ),
                    const SettingsItem(
                      title: 'notifications',
                      trailing: SizedBox.shrink(),
                    ),
                    const SettingsItem(title: 'Help & Support'),
                    const SettingsItem(title: 'Privacy'),
                    const SettingsItem(title: 'About'),
                    SettingsItem(
                      title: 'Logout',
                      onTap: () {
                        // authCubit.logout();
                        _showLogoutConfirmationDialog(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    final authCubit = context.read<AuthCubit>();
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                authCubit.logout(context);
              },
            ),
          ],
        );
      },
    );
  }
}
