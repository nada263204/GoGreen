import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/config/theme.dart';

class PostButtons extends StatefulWidget {
  const PostButtons({super.key});

  @override
  _PostButtonsState createState() => _PostButtonsState();
}

class _PostButtonsState extends State<PostButtons> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final bool isDark = state.themeMode == ThemeMode.dark;
        return Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
              icon: SvgPicture.asset(
                'assets/svg/ic_support.svg',
                colorFilter: ColorFilter.mode(
                  isLiked
                      ? Colors.red
                      : (isDark ? AppTheme.white : AppTheme.black),
                  BlendMode.srcIn,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svg/ic_comment.svg',
                colorFilter: ColorFilter.mode(
                  isDark ? AppTheme.white : AppTheme.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svg/ic_share.svg',
                colorFilter: ColorFilter.mode(
                  isDark ? AppTheme.white : AppTheme.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
