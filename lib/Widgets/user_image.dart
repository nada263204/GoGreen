// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
// import 'package:graduation_project/core/widgets/loading_indicator.dart';
// import 'package:graduation_project/features/auth/OTP/presentation/cubit/auth_cubit.dart';
// import 'package:graduation_project/features/auth/data/models/user.dart';

// import '../Screens/profile_screen.dart';

// class UserImage extends StatelessWidget {
//   final User? user;
//   const UserImage({super.key, this.user});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const ProfileScreen(),
//           ),
//         );
//       },
//       child: BlocBuilder<AppCubit, AppState>(
//         builder: (context, state) {
//           if (state.authState is LoginSuccess) {
//             final user = (state.authState as LoginSuccess).user;
//             return Stack(
//               alignment: Alignment.center,
//               children: [
//                 SvgPicture.asset(
//                   'assets/svg/profile_image_border.svg',
//                   fit: BoxFit.cover,
//                 ),
//                   // Container(
//                   // width: 60.0,
//                   // height: 60.0,
//                   // clipBehavior: Clip.antiAlias,
//                   // decoration:const BoxDecoration(
//                   //   shape: BoxShape.circle,
//                   // ),
//                   // ),
//                 if (user.profilePicture != null)
//           Container(
//             width: 60.0,
//             height: 60.0,
//             clipBehavior: Clip.antiAlias,
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//             ),
//             child: Image.network(
//               user.profilePicture!,
//               fit: BoxFit.cover,
//             ),
//           ),
//               ],
//             );
//           } else if (state.authState is LoginLoading) {
//             return const LoadingIndicator();
//           } else if (state.authState is LoginError) {
//             return Stack(
//               alignment: Alignment.center,
//               children: [
//                 Container(
//                   width: 60.0,
//                   height: 60.0,
//                   clipBehavior: Clip.antiAlias,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: AssetImage('assets/images/avatar.jpeg'),
//                     ),
//                   ),
//                 ),
//                 SvgPicture.asset(
//                   'assets/svg/profile_image_border.svg',
//                   fit: BoxFit.cover,
//                 ),
//               ],
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/auth/OTP/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/data/models/user.dart';

import '../Screens/profile_screen.dart';

class UserImage extends StatelessWidget {
  final User? user;
  const UserImage({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(),
          ),
        );
      },
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state.authState is LoginSuccess) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/profile_image_border.svg',
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 60.0,
                  height: 60.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    (state.authState as LoginSuccess).user.profilePicture!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/avatar.jpeg',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state.authState is LoginLoading) {
            return const LoadingIndicator();
          } else if (state.authState is LoginError) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/avatar.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                SvgPicture.asset(
                  'assets/svg/profile_image_border.svg',
                  fit: BoxFit.cover,
                ),
              ],
            );
          }
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/avatar.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              SvgPicture.asset(
                'assets/svg/profile_image_border.svg',
                fit: BoxFit.cover,
              ),
            ],
          );
        },
      ),
    );
  }
}
