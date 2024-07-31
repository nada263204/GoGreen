import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Widgets/back_button.dart';
import 'package:graduation_project/Widgets/text_scale.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/features/articles/models/datum.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Datum article;

  const ArticleDetailsScreen({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        article.photoLink ?? 'assets/images/article_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  final bool isDark = state.themeMode == ThemeMode.dark;
                  return Column(
                    children: [
                      Text(
                        article.title ?? 'No Title',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 24.0),
                          fontWeight: FontWeight.bold,
                          color: isDark ? AppTheme.white : AppTheme.black,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        article.description ?? 'No Content',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 20.0),
                          fontWeight: FontWeight.w400,
                          color: isDark ? AppTheme.white : AppTheme.black,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

// class ArticleDetailsScreen extends StatelessWidget {
//   const ArticleDetailsScreen({super.key, required Datum article});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const CustomBackButton(),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: MediaQuery.sizeOf(context).height * 0.3,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50.0),
//                   image: const DecorationImage(
//                     image: AssetImage('assets/images/article_image.png'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20.0),
//               BlocBuilder<AppCubit, AppState>(
//                 builder: (context, state) {
//                   final bool isDark = state.themeMode == ThemeMode.dark;
//                   return Text(
//                     'This article is about the type of container (Glass) A post-medieval wine bottle dating from 1690-1700, found in England circa 2018 Glass bottles and glass jars are found in many households worldwide. The first glass bottles were produced in Mesopotamia around 1500 B.C., and in the Roman Empire in around 1 AD.[1] America\'s glass bottle and glass jar industry was born in the early 1600s, when settlers in Jamestown built the first glass-melting furnace. The invention of the automatic glass bottle-blowing machine in 1903 industrialized the process of making bottles The earliest bottles or vessels were made by ancient man. Ingredients were melted to make glass and then clay forms were dipped into the molten liquid. When the glass cooled off, the clay was chipped out of the inside leaving just the hollow glass vessel.[3] This glass was very thin as the fire was not as hot as modern-day furnaces. The blowpipe was invented around 1 B.C. This allowed molten glass to be gathered on the end of the blow pipe and blown into the other end to create a hollow vessel. Eventually, the use of a mold was introduced, followed by the invention of a semi-automatic machine, called the Press and Blow, by Yorkshire Iron founder, Howard Matravers Ashley, in 1886.[4][5] In 1904 Michael Owens invented the automatic bottle machine, after working on the production of Electric lightbulbs, in Ohio, for Edison.[6]',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: getResponsiveFontSize(context, fontSize: 24.0),
//                       fontWeight: FontWeight.w500,
//                       color: isDark ? AppTheme.white : AppTheme.black,
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 20.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
}
