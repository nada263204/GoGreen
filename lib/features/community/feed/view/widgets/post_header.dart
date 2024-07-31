import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/features/community/feed/model/publisher.dart';

import '../../../../../core/config/theme.dart';
import '../../../../../Widgets/follow_button.dart';
import '../../../../../Widgets/text_scale.dart';

class PostHeader extends StatelessWidget {
  final Publisher? publisher;

  const PostHeader({
    super.key,
    this.publisher,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (publisher != null && publisher!.profileImage != null)
          Container(
            width: 60.0,
            height: 60.0,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              publisher!.profileImage!,
              fit: BoxFit.cover,
            ),
          )
        else
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.jpeg'),
            radius: 20.0,
          ),
        const SizedBox(width: 10.0),
        BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            final bool isDark = state.themeMode == ThemeMode.dark;
            return Expanded(
              child: Text(
                publisher?.name ?? 'Unknown',
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 24.0),
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppTheme.white : AppTheme.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ),
        const FollowButton(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
