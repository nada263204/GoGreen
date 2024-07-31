import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Screens/home/nav_bar.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/features/auth/OTP/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/OTP/presentation/screens/login_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'Screens/Splash_screen.dart';
import 'core/config/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return MaterialApp(
          navigatorObservers: [
            FirebaseAnalyticsObserver(analytics: analytics),
          ],
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.themeMode,
          home: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              if (state.authState is LoginSuccess) {
                return const NavBar();
              } else if (state.authState is LogoutSuccess) {
                return const LoginScreen();
              } else {
                return const SplashScreen();
              }
            },
          ),
        );
      },
    );
  }
}

// MultiBlocProvider(
//           providers: [
//             BlocProvider(
//               create: (context) => ThemeCubit(
//                 themeRepository: context.read<ThemeRepository>(),
//               )..getCurrentTheme(),
//             ),
//             BlocProvider<UserCubit>(
//               create: (context) => UserCubit(),
//             ),
//             BlocProvider(
//               create: (context) => ScanCubit(),
//             ),
//             BlocProvider(
//               create: (context) => AuthCubit(),
//             ),
//           ],
