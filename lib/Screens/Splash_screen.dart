// // import 'package:animated_splash_screen/animated_splash_screen.dart';
// // import 'package:flutter/material.dart';
// // import 'package:graduation_project/Screens/OpeningScreen.dart';

// // class SplashScreen extends StatelessWidget {
// //   const SplashScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return AnimatedSplashScreen(
// //       splash: Center(
// //         child: Stack(
// //           children: [
// //             Center(child: Image.asset('assets/images/CirclesSplashScreen.png')),
// //             Center(child: Image.asset('assets/images/SplashScreen-skylum (1).png'))
// //           ],
// //         ),
// //       ),
// //       backgroundColor: const Color(0xFFA5D6A7),
// //       splashIconSize: 400.0,
// //       duration: 3000,
// //       nextScreen: const OpeningScreen(),
// //     );
// //   }
// // }
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:graduation_project/Screens/OpeningScreen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 4),
//       vsync: this,
//     )..repeat(reverse: true);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Center(
//         child: Stack(
//           children: [
//             Center(
//               child: AnimatedBuilder(
//                 animation: _controller,
//                 builder: (context, child) {
//                   return Transform.scale(
//                     scale: 1 + _controller.value * 0.1, // Scale animation
//                     child: Image.asset('assets/images/CirclesSplashScreen.png'),
//                   );
//                 },
//               ),
//             ),
//             Center(
//               child: Image.asset('assets/images/SplashScreen-skylum (1).png'),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: const Color(0xFFA5D6A7),
//       splashIconSize: 400.0,
//       duration: 3000,
//       nextScreen: const OpeningScreen(),
//     );
//   }
// }
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Screens/OpeningScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Adjusted duration for faster animation
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Stack(
          children: [
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1 + _controller.value * 0.1, // Scale animation
                    child: Image.asset('assets/images/CirclesSplashScreen.png'),
                  );
                },
              ),
            ),
            Center(
              child: Image.asset('assets/images/SplashScreen-skylum (1).png'),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFA5D6A7),
      splashIconSize: 400.0,
      duration: 1500, // Adjusted duration for faster splash screen display
      nextScreen: const OpeningScreen(),
    );
  }
}
