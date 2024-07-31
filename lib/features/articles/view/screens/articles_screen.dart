import 'package:flutter/material.dart';

import 'package:graduation_project/Widgets/back_button.dart';
import 'package:graduation_project/Widgets/text_scale.dart';
import 'package:graduation_project/core/config/theme.dart';

import '../../../../Widgets/search_form_field.dart';
import '../widgets/articles_list_view.dart';

class ArticlesScreen extends StatelessWidget {
  final String category;
  const ArticlesScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Articles about $category',
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 20.0),
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchFormField(),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All you need to know',
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
            Expanded(
              child: ArticlesListView(category: category),
            ),
          ],
        ),
      ),
    );
  }
}
