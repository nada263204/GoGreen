// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/Screens/home/home_view.dart';
// import 'package:graduation_project/features/object_detecting/presentation/screens/scan_cubit.dart';
// import 'package:graduation_project/features/object_detecting/presentation/screens/scan_view_body.dart';

// import '../core/config/theme.dart';
// import '../features/object_detecting/presentation/widgets/scan_item_info.dart';
// import 'text_scale.dart';

// class ScanItemInfoBottomSheet extends StatelessWidget {
//   const ScanItemInfoBottomSheet({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20.0),
//       height: MediaQuery.sizeOf(context).height * 0.45,
//       decoration: BoxDecoration(
//         color: AppTheme.white,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(40.0),
//           topRight: Radius.circular(40.0),
//         ),
//       ),
//       child: BlocBuilder<ScanCubit, ScanState>(
//         builder: (context, state) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 state.recognition.isEmpty ? 'No recognition yet' : state.recognition,
//                 style: TextStyle(
//                   fontSize: getResponsiveFontSize(context, fontSize: 24.0),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const SizedBox(height: 20.0),
//               const ScanItemInfo(),
//               const SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const ScanViewBody(),
//                             ),
//                           );
//                         },
//                         child: const Text('Scan again?'),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const HomeView(),
//                             ),
//                           );
//                         },
//                         child: const Text('How to recycle?'),
//                       ),
//                     ],
//                   ),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         backgroundColor: AppTheme.primary,
//                         surfaceTintColor: Colors.transparent,
//                         minimumSize:
//                             Size(MediaQuery.sizeOf(context).width * 0.3, 50.0)),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           'Find nearby station',
//                           style: TextStyle(
//                             color: AppTheme.white,
//                             fontSize:
//                                 getResponsiveFontSize(context, fontSize: 15.0),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const SizedBox(width: 10.0),
//                         CircleAvatar(
//                           backgroundColor: AppTheme.white,
//                           backgroundImage: const AssetImage(
//                               'assets/images/Waste Sorting.png'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Screens/map_screen.dart';
import 'package:graduation_project/features/articles/view/screens/articles_screen.dart';
import 'package:graduation_project/features/object_detecting/presentation/screens/scan_cubit.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/features/object_detecting/presentation/widgets/scan_item_info.dart';
import 'package:graduation_project/features/object_detecting/presentation/screens/scan_view_body.dart';
import 'package:graduation_project/Widgets/text_scale.dart';

class ScanItemInfoBottomSheet extends StatelessWidget {
  const ScanItemInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      height: MediaQuery.sizeOf(context).height * 0.45,
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: BlocBuilder<ScanCubit, ScanState>(
        builder: (context, state) {
          String recognitionText = '';
          if (state is ScanLoaded) {
            recognitionText = state.recognition;
          } else if (state is ScanError) {
            recognitionText = 'Error: ${state.error}';
          } else if (state is ScanLoading) {
            recognitionText = 'Loading...';
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recognitionText.isEmpty
                    ? 'No recognition yet'
                    : recognitionText,
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 24.0),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20.0),
              const ScanItemInfo(),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScanViewBody(),
                            ),
                          );
                        },
                        child: const Text('Scan again?'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ArticlesScreen(category: recognitionText),
                            ),
                          );
                        },
                        child: const Text('How to recycle?'),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      backgroundColor: AppTheme.primary,
                      surfaceTintColor: Colors.transparent,
                      minimumSize:
                          Size(MediaQuery.sizeOf(context).width * 0.3, 50.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Find nearby station',
                          style: TextStyle(
                            color: AppTheme.white,
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 15.0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        CircleAvatar(
                          backgroundColor: AppTheme.white,
                          backgroundImage: const AssetImage(
                              'assets/images/Waste Sorting.png'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
