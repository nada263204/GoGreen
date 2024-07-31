import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/community/chat/get_all_users_response.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/config/theme.dart';

class FavChatItem extends StatelessWidget {
  final Data user;
  const FavChatItem({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 35.0,
          backgroundImage: user.profileImage != null &&
                  user.profileImage!.isNotEmpty
              ? NetworkImage(user.profileImage!)
              : const AssetImage('assets/images/avatar.jpeg') as ImageProvider,
        ),
        const SizedBox(height: 5.0),
        BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            final bool isDark = state.themeMode == ThemeMode.dark;
            return Text(
              user.name ?? 'No Name',
              style: TextStyle(
                color: isDark ? AppTheme.white : AppTheme.black,
              ),
            );
          },
        ),
      ],
    );
  }
}
