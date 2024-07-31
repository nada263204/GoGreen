// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/features/object_detecting/presentation/screens/scan_cubit.dart';

// import '../../../../core/config/theme.dart';
// import '../../../../Widgets/scan_item_info_bottom_sheet.dart';
// import '../../../../Widgets/text_scale.dart';

// class ScanTypeDialog extends StatelessWidget {
//   const ScanTypeDialog({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         width: MediaQuery.sizeOf(context).width * 0.8,
//         margin: const EdgeInsets.only(bottom: 100.0),
//         padding: const EdgeInsets.all(20.0),
//         decoration: BoxDecoration(
//           color: AppTheme.primary.withOpacity(0.9),
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         clipBehavior: Clip.antiAlias,
//         child: SizedBox(
//           height: MediaQuery.sizeOf(context).height * 0.17,
//           child: Scaffold(
//             backgroundColor: Colors.transparent,
//             body: BlocBuilder<ScanCubit, String>(
//               builder: (context, recognition) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       recognition.isEmpty ? 'No recognition yet' : recognition,
//                       style: TextStyle(
//                         fontSize: getResponsiveFontSize(
//                           context,
//                           fontSize: 24.0,
//                         ),
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const SizedBox(height: 5.0),
//                     Text(
//                       'This material can be recycled ',
//                       style: TextStyle(
//                         fontSize: getResponsiveFontSize(
//                           context,
//                           fontSize: 20.0,
//                         ),
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                           showModalBottomSheet(
//                             context: context,
//                             builder: (context) {
//                               return const ScanItemInfoBottomSheet();
//                             },
//                           );
//                         },
//                         icon: CircleAvatar(
//                           backgroundColor: AppTheme.white,
//                           child: Icon(
//                             Icons.arrow_forward_ios,
//                             color: AppTheme.primary,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/object_detecting/presentation/screens/scan_cubit.dart';

import '../../../../core/config/theme.dart';
import '../../../../Widgets/scan_item_info_bottom_sheet.dart';
import '../../../../Widgets/text_scale.dart';

class ScanTypeDialog extends StatelessWidget {
  const ScanTypeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        margin: const EdgeInsets.only(bottom: 100.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: AppTheme.primary.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.17,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: BlocBuilder<ScanCubit, ScanState>(
              builder: (context, state) {
                if (state is ScanLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ScanLoaded) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.recognition.isEmpty
                            ? 'No recognition yet'
                            : state.recognition,
                        style: TextStyle(
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 24.0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        'This material can be recycled ',
                        style: TextStyle(
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 20.0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const ScanItemInfoBottomSheet();
                              },
                            );
                          },
                          icon: CircleAvatar(
                            backgroundColor: AppTheme.white,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppTheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is ScanError) {
                  return Text(
                    state.error,
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
