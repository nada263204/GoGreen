import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/Widgets/text_scale.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/features/community/feed/view/widgets/posts_list_view.dart';

import '../../../../../Widgets/user_image.dart';
import '../../../chat/chat_nav_bar.dart';
import '../../../../../Screens/notification_screen.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const UserImage(),
        leadingWidth: 100.0,
        title: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            final bool isDark = state.themeMode == ThemeMode.dark;
            return Text(
              'Feeds',
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 22.0),
                fontWeight: FontWeight.w600,
                color: isDark ? AppTheme.white : AppTheme.black,
              ),
            );
          },
        ),
        actions: [
          BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              final bool isDark = state.themeMode == ThemeMode.dark;
              return IconButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    CupertinoPageRoute(
                      builder: (context) => const ChatNavBar(),
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/svg/ic_chat.svg',
                  colorFilter: ColorFilter.mode(
                    isDark ? AppTheme.white : AppTheme.black,
                    BlendMode.srcIn,
                  ),
                ),
              );
            },
          ),
          BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              final bool isDark = state.themeMode == ThemeMode.dark;
              return IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/svg/ic_notify.svg',
                  colorFilter: ColorFilter.mode(
                    isDark ? AppTheme.white : AppTheme.black,
                    BlendMode.srcIn,
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Expanded(
              child: PostListView(),
            ),
          ],
        ),
      ),
    );
  }
}
