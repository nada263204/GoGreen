import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/features/community/feed/model/feed_post_response.dart';
import 'package:graduation_project/features/community/feed/view/widgets/post_buttons.dart';
import 'package:graduation_project/features/community/feed/view/widgets/post_header.dart';

import '../../../../../core/config/theme.dart';
import '../../../../../Widgets/text_scale.dart';

class PostItemWidget extends StatelessWidget {
  final FeedPostResponse post;

  const PostItemWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(publisher: post.publisher),
          const SizedBox(height: 10.0),
          BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              final bool isDark = state.themeMode == ThemeMode.dark;
              return Text(
                post.caption ?? '',
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 14.0),
                  fontWeight: FontWeight.w400,
                  color: isDark ? AppTheme.white : AppTheme.black,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              );
            },
          ),
          const SizedBox(height: 10.0),
          if (post.images != null && post.images!.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                post.images!.first,
                width: double.infinity,
                height: 310.0,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 10.0),
          const PostButtons(),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                radius: 15.0,
              ),
              const SizedBox(width: 10.0),
              BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  final bool isDark = state.themeMode == ThemeMode.dark;
                  return Text(
                    'Liked by Nada and ${post.likes} others',
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(context, fontSize: 15.0),
                      fontWeight: FontWeight.w600,
                      color: isDark ? AppTheme.white : AppTheme.black,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
