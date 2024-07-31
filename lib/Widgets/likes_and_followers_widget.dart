import 'package:flutter/material.dart';
import 'package:graduation_project/Widgets/text_scale.dart';
import 'package:graduation_project/core/config/theme.dart';

class LikesAndFollowersWidget extends StatelessWidget {
  const LikesAndFollowersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildItem(context, number: '122', title: 'followers'),
        _buildItem(context, number: '67', title: 'following'),
        _buildItem(context, number: '37K', title: 'likes'),
      ],
    );
  }

  Column _buildItem(BuildContext context,
      {required String number, required String title}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          number,
          style: TextStyle(
            color: AppTheme.primary,
            fontSize: getResponsiveFontSize(context, fontSize: 24.0),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: AppTheme.black,
            fontSize: getResponsiveFontSize(context, fontSize: 14.0),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
