import 'package:flutter/material.dart';

import '../../../../Widgets/text_scale.dart';

class PACItemWidget extends StatelessWidget {
  const PACItemWidget({
    super.key,
    required this.imgPath,
    required this.number,
    required this.title,
  });

  final String imgPath;
  final int number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imgPath,
          height: 100.0,
        ),
        const SizedBox(height: 5.0),
        Text(
          number.toString(),
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 20.0),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          title,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 16.0),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
