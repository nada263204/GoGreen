import 'package:flutter/material.dart';

import '../../../../Widgets/text_scale.dart';

class CatItem extends StatelessWidget {
  const CatItem({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 8.0,
          backgroundColor: color,
        ),
        const SizedBox(width: 5.0),
        Text(
          title,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 15.0),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
