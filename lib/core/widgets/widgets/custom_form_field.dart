import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';

import '../../../../core/config/theme.dart';
import '../../../../Widgets/text_scale.dart';

class CustomFormFiled extends StatelessWidget {
  const CustomFormFiled({
    super.key,
    required this.hint,
    required this.title,
    required TextEditingController controller,
  });
  final String hint;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            final bool isDark = state.themeMode == ThemeMode.dark;
            return Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 16.0),
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppTheme.white : AppTheme.black,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 10.0),
        TextFormField(
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 14.0),
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: getResponsiveFontSize(context, fontSize: 14.0),
              fontWeight: FontWeight.w600,
              color: AppTheme.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide(width: 1.0, color: AppTheme.primary),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
