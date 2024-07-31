import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/features/auth/OTP/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/chatbot/ui/consts.dart';
import 'package:graduation_project/features/community/chat/chat_cubit.dart';
import 'package:graduation_project/features/community/posts/view%20model/cubit/post_cubit.dart';
import 'package:graduation_project/features/notifications/firebase_api.dart';
import 'package:graduation_project/features/object_detecting/presentation/screens/scan_cubit.dart';
import 'package:graduation_project/features/payment/payment_cubit.dart';
import 'package:graduation_project/features/profile/edit_user_profile/cubit/edit_profile_cubit.dart';
import 'package:graduation_project/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/config/theme_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  final sharedPreferences = await SharedPreferences.getInstance();
  final themeRepository = ThemeRepository(sharedPreferences: sharedPreferences);
  final authCubit = AuthCubit();
  final postCubit = PostCubit();
  final editProfileCubit = EditProfileCubit();
  await authCubit.checkLoggedInUser();
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print("FCM: $fcmToken");
  final appCubit = AppCubit(
      themeRepository: themeRepository,
      authCubit: authCubit,
      postCubit: postCubit,
      editProfileCubit: editProfileCubit,
      );
  Gemini.init(
    apiKey: GEMINI_API_KEY,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => appCubit,
      ),
      BlocProvider(
        create: (context) => authCubit,
      ),
      BlocProvider(
        create: (context) => postCubit,
      ),
      BlocProvider(
        create: (context) => ScanCubit(),
      ),
      BlocProvider(
        create: (context) => PaymentCubit(),
      ),
      BlocProvider(
        create: (context) => ChatCubit(FirebaseFirestore.instance, 'users'),
      ),
      BlocProvider(
        create: (context) => editProfileCubit,
      ),
    ],
    child: const MyApp(),
  ));
}
