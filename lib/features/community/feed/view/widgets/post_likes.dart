// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/Widgets/text_scale.dart';
// import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
// import 'package:graduation_project/core/config/theme.dart';

// class PostLikes extends StatelessWidget {
//   const PostLikes({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const CircleAvatar(
//           backgroundImage: AssetImage('assets/images/profile_image.png'),
//           radius: 15.0,
//         ),
//         const SizedBox(width: 10.0),
//         BlocBuilder<AppCubit, AppState>(
//           builder: (context, state) {
//             final bool isDark = state.themeMode == ThemeMode.dark;
//             return Text(
//               'Liked by Nada and 1,500',
//               style: TextStyle(
//                 fontSize: getResponsiveFontSize(context, fontSize: 15.0),
//                 fontWeight: FontWeight.w600,
//                 color: isDark ? AppTheme.white : AppTheme.black,
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
