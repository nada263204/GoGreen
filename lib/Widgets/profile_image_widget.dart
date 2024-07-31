// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
// // import 'package:graduation_project/core/widgets/loading_indicator.dart';
// // import 'package:graduation_project/features/auth/OTP/presentation/cubit/auth_cubit.dart';
// // import '../core/config/theme.dart';

// // class ProfileImageWidget extends StatelessWidget {
// //   final File? imageFile;
// //   const ProfileImageWidget({
// //     super.key,
// //     this.imageFile,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocBuilder<AppCubit, AppState>(
// //       builder: (context, state) {
// //         if (state.authState is LoginSuccess ||
// //             state.authState is RegisterSuccess) {
// //           return Container(
// //               width: 150.0,
// //               height: 150.0,
// //               padding: const EdgeInsets.all(5.0),
// //               clipBehavior: Clip.antiAlias,
// //               decoration: BoxDecoration(
// //                 shape: BoxShape.circle,
// //                 border: Border.all(
// //                   width: 1.0,
// //                   color: AppTheme.primary,
// //                 ),
// //               ),
// //               child: CircleAvatar(
// //                 radius: 50,
// //                 child: Container(
// //                   width: 200,
// //                   height: 200,
// //                   clipBehavior: Clip.antiAlias,
// //                   decoration: const BoxDecoration(
// //                     shape: BoxShape.circle,
// //                   ),
// //                   child: Image.network(
// //                     (state.authState as LoginSuccess).user.profilePicture!,
// //                     fit: BoxFit.cover,
// //                     errorBuilder: (context, error, stackTrace) {
// //                       return Image.asset(
// //                         'assets/images/avatar.jpeg',
// //                         fit: BoxFit.cover,
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ));
// //         } else if (state.authState is LoginLoading ||
// //             state.authState is RegisterLoading) {
// //           return const LoadingIndicator();
// //         } else if (state.authState is LoginError ||
// //             state.authState is RegisterError) {
// //           return const CircleAvatar(
// //             radius: 50,
// //             backgroundImage: AssetImage('assets/images/avatar.jpeg'),
// //             backgroundColor: Colors.transparent,
// //           );
// //         }
// //         return Image.asset('assets/images/avatar.jpeg');
// //       },
// //     );
// //   }
// // }
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:graduation_project/core/config/theme.dart';

// class ProfileImageWidget extends StatelessWidget {
//   final File? imageFile;
//   final String? imageUrl;

//   const ProfileImageWidget({Key? key, this.imageFile, this.imageUrl})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return
//      CircleAvatar(
//       radius: 50.0,
//       backgroundColor: AppTheme.primary,
//       backgroundImage: imageFile != null
//           ? FileImage(imageFile!)
//           : (imageUrl != null
//               ? NetworkImage(imageUrl!)
//               : AssetImage('assets/images/default_profile_image.png'))
//                   as ImageProvider,
//       child: imageFile == null && imageUrl == null
//           ? const Icon(
//               Icons.person,
//               size: 50.0,
//               color: Colors.white,
//             )
//           : null,
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/auth/OTP/presentation/cubit/auth_cubit.dart';

class ProfileImageWidget extends StatelessWidget {
  final File? imageFile;
  final String? imageUrl;

  const ProfileImageWidget({
    Key? key,
    this.imageFile,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (imageFile != null) {
          return CircleAvatar(
            radius: 75,
            backgroundImage: FileImage(imageFile!),
            backgroundColor: Colors.transparent,
          );
        }

        if (state.authState is LoginSuccess ||
            state.authState is RegisterSuccess) {
          return Container(
              width: 150.0,
              height: 150.0,
              padding: const EdgeInsets.all(5.0),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.0,
                  color: AppTheme.primary,
                ),
              ),
              child: CircleAvatar(
                radius: 75,
                backgroundImage: NetworkImage(
                  (state.authState as LoginSuccess).user.profilePicture!,
                ),
                // onBackgroundImageError: (error, stackTrace) {
                //   return  Image.asset('assets/images/avatar.jpeg');
                // },
                backgroundColor: Colors.transparent,
              ));
        } else if (state.authState is LoginLoading ||
            state.authState is RegisterLoading) {
          return const LoadingIndicator();
        } else if (state.authState is LoginError ||
            state.authState is RegisterError) {
          return const CircleAvatar(
            radius: 75,
            backgroundImage: AssetImage('assets/images/avatar.jpeg'),
            backgroundColor: Colors.transparent,
          );
        }
        return const CircleAvatar(
          radius: 75,
          backgroundImage: AssetImage('assets/images/avatar.jpeg'),
          backgroundColor: Colors.transparent,
        );
      },
    );
  }
}
