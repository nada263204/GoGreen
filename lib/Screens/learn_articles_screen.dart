import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';

import '../features/articles/view/widgets/articles_list_view.dart';
import '../Widgets/back_button.dart';
import '../Widgets/search_form_field.dart';
import '../Widgets/text_scale.dart';
import '../core/config/theme.dart';

class LearnArticlesScreen extends StatelessWidget {
  const LearnArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                final bool isDark = state.themeMode == ThemeMode.dark;
                return Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Learn',
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(context, fontSize: 24.0),
                      fontWeight: FontWeight.w600,
                      color: isDark ? AppTheme.white : AppTheme.black,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0),
            const SearchFormField(bgColor: Colors.transparent),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Good to know',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize:
                            getResponsiveFontSize(context, fontSize: 20.0),
                      ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Show All',
                    style: TextStyle(color: AppTheme.primaryLight),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Expanded(
              child: ArticlesListView(
                isWithImage: true,
                category: 'learn',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
