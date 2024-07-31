import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/config/theme.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.bgColor,
  });

  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(left: 14.0),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(width: 2.0, color: const Color(0xffC5C5C5)),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/svg/ic_back.svg',
            colorFilter: ColorFilter.mode(
              bgColor == null ? AppTheme.primary : AppTheme.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
