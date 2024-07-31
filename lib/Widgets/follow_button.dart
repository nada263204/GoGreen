// import 'package:flutter/material.dart';

// import '../core/config/theme.dart';
// import 'text_scale.dart';

// class FollowButton extends StatelessWidget {
//   const FollowButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {},
//       style: ButtonStyle(
//         backgroundColor: MaterialStatePropertyAll(AppTheme.primaryLight),
//         shape: MaterialStatePropertyAll(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//         ),
//         minimumSize: const MaterialStatePropertyAll(Size(56.0, 22.0)),
//         padding: const MaterialStatePropertyAll(
//           EdgeInsets.symmetric(
//             horizontal: 10.0,
//             vertical: 4.0,
//           ),
//         ),
//       ),
//       child: Text(
//         'Follow',
//         style: TextStyle(
//           fontSize: getResponsiveFontSize(context, fontSize: 12.0),
//           fontWeight: FontWeight.w500,
//           color: AppTheme.white,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../core/config/theme.dart';
import 'text_scale.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isFollowed = false;

  void _toggleFollow() {
    setState(() {
      isFollowed = !isFollowed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _toggleFollow,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppTheme.primaryLight),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(56.0, 22.0)),
        padding:  MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 4.0,
          ),
        ),
      ),
      child: Text(
        isFollowed ? 'Followed' : 'Follow',
        style: TextStyle(
          fontSize: getResponsiveFontSize(context, fontSize: 12.0),
          fontWeight: FontWeight.w500,
          color: AppTheme.white,
        ),
      ),
    );
  }
}
