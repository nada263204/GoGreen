import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/community/chat/get_all_users_response.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';

import '../core/config/theme.dart';
import 'text_scale.dart';

class ChatItem extends StatelessWidget {
  final Data user;
  const ChatItem({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 20.0),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 35.0,
                backgroundImage:
                    user.profileImage != null && user.profileImage!.isNotEmpty
                        ? NetworkImage(user.profileImage!)
                        : const AssetImage('assets/images/avatar.jpeg')
                            as ImageProvider,
              ),
              const Positioned(
                right: 5.0,
                bottom: 3.0,
                child: CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Color(0xff0FE16D),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                final bool isDark = state.themeMode == ThemeMode.dark;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          user.name ?? 'No Name',
                          style: TextStyle(
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 16.0),
                            fontWeight: FontWeight.w600,
                            color: isDark ? AppTheme.white : AppTheme.black,
                          ),
                        ),
                        Text(
                          '2 min ago',
                          style: TextStyle(
                            color: isDark ? AppTheme.grey : AppTheme.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'How are you today?',
                      style: TextStyle(
                        color: isDark ? AppTheme.grey : AppTheme.black,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
