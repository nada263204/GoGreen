import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';

import '../core/config/theme.dart';
import 'text_scale.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    super.key,
    this.hint,
    this.bgColor,
  });

  final String? hint;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final bool isDark = state.themeMode == ThemeMode.dark;
        return TextFormField(
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 14.0),
            fontWeight: FontWeight.w600,
            color: AppTheme.grey,
          ),
          decoration: InputDecoration(
            hintText: hint ?? 'Search',
            hintStyle: TextStyle(
              fontSize: getResponsiveFontSize(context, fontSize: 14.0),
              fontWeight: FontWeight.w600,
              color: isDark ? AppTheme.white : AppTheme.black,
            ),
            filled: true,
            fillColor: isDark ? AppTheme.black : bgColor,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide(width: 1.0, color: AppTheme.primary),
            ),
          ),
        );
      },
    );
  }
}
