import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/articles/models/datum.dart';
import '../screens/article_details_screen.dart';
import '../../../../core/config/theme.dart';
import '../../../../Widgets/text_scale.dart';

class ArticlesListItem extends StatelessWidget {
  final Datum article;
  final bool isWithImage;

  const ArticlesListItem({
    super.key,
    required this.article,
    this.isWithImage = false,
  });

  @override
  Widget build(BuildContext context) {
    print('Image URL: ${article.photoLink}'); // Debugging print

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailsScreen(article: article),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.2,
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          color: AppTheme.primary.withOpacity(0.1),
          border: isWithImage
              ? null
              : Border.all(
                  width: 2.0,
                  color: AppTheme.primary,
                ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: CachedNetworkImage(
                imageUrl: article.photoLink!,
                placeholder: (context, url) => const LoadingIndicator(),
                errorWidget: (context, url, error) {
                  print('Error loading image: $error'); // Additional logging
                  return const Center(
                    child: Icon(
                      Icons.error_outline_outlined,
                      size: 40,
                    ),
                  );
                },
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.grey.withOpacity(0.7)),
            ),
            Center(
              child: BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  final bool isDark = state.themeMode == ThemeMode.dark;
                  return Text(
                    article.title ?? 'No Title',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(context, fontSize: 24.0),
                      fontWeight: FontWeight.bold,
                      color:
                          isWithImage || isDark ? Colors.white : Colors.black,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
