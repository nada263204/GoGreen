// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:graduation_project/features/auth/OTP/presentation/screens/login_screen.dart';
// import 'package:graduation_project/features/auth/data/data_sources/auth_api_data_source.dart';
// import 'package:graduation_project/features/auth/data/models/login_data.dart';
// import 'package:graduation_project/features/auth/data/models/register_data.dart';
// import 'package:graduation_project/features/auth/data/models/user.dart';
// import 'package:graduation_project/features/auth/data/repository/auth_repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// part 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(AuthInitial());

//   final _authRepository = AuthRepository(AuthAPIRemoteDataSource());

//   Future<void> register(RegisterData requestData) async {
//     emit(RegisterLoading());
//     try {
//       final registerResponse = await _authRepository.register(requestData);
//       final user = registerResponse.user;
//       if (user != null) {
//         print('Register Success: $user');
//         emit(RegisterSuccess(user: user));
//       } else {
//         print('Register Error: User is null');
//         emit(const RegisterError(message: 'there is an error'));
//       }
//     } catch (e) {
//       print('Register Error: $e');
//       emit(const RegisterError(message: 'there is an error'));
//     }
//   }

//   Future<void> login(LoginData requestData) async {
//     emit(LoginLoading());
//     try {
//       final loginResponse = await _authRepository.login(requestData);
//       final user = loginResponse.user;
//       if (user != null) {
//         final SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setBool('isLoggedIn', true);
//         await prefs.setString('email', user.email ?? '');
//         print(user.name);
//         print('update Success: $user');
//         emit(LoginSuccess(user: user));
//       } else {
//         print('Login Error: User is null');
//         emit(const LoginError(message: 'error'));
//       }
//     } catch (e) {
//       print('Login Error: $e');
//       emit(const LoginError(message: 'error'));
//     }
//   }

//   Future<void> updateUserProfile(User user) async {
//     emit(EditProfileLoading());
//     try {
//       final response = await _authRepository.updateUser(user);
//       final updatedUser = response.user;
//       emit(EditProfileSuccess(user: updatedUser));
//       print(updatedUser.toString());
//     } catch (e) {
//       emit(EditProfileFailure(message: e.toString()));
//     }
//   }

//   Future<void> checkLoggedInUser() async {
//     try {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//       final username = prefs.getString('username') ?? '';

//       if (isLoggedIn && username.isNotEmpty) {
//         // Assuming you have a way to reconstruct the user object
//         final user = User(name: username);
//         print('User already logged in: $user');
//         emit(LoginSuccess(user: user));
//       } else {
//         print('No user logged in');
//       }
//     } catch (e) {
//       print('Error checking logged in user: $e');
//     }
//   }

//   Future<void> logout(BuildContext context) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//     Navigator.pushAndRemoveUntil(
//       // ignore: use_build_context_synchronously
//       context,
//       MaterialPageRoute(builder: (context) => const LoginScreen()),
//       (route) => false,
//     );
//     emit(LogoutSuccess());
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/auth/OTP/presentation/screens/login_screen.dart';
import 'package:graduation_project/features/auth/data/data_sources/auth_api_data_source.dart';
import 'package:graduation_project/features/auth/data/models/login_data.dart';
import 'package:graduation_project/features/auth/data/models/register_data.dart';
import 'package:graduation_project/features/auth/data/models/user.dart';
import 'package:graduation_project/features/auth/data/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final _authRepository = AuthRepository(AuthAPIRemoteDataSource());

  Future<void> register(RegisterData requestData) async {
    emit(RegisterLoading());
    try {
      final registerResponse = await _authRepository.register(requestData);
      final user = registerResponse.user;
      if (user != null) {
        print('Register Success: $user');
        emit(RegisterSuccess(user: user));
      } else {
        print('Register Error: User is null');
        emit(const RegisterError(message: 'there is an error'));
      }
    } catch (e) {
      print('Register Error: $e');
      emit(const RegisterError(message: 'there is an error'));
    }
  }

  Future<void> login(LoginData requestData) async {
    emit(LoginLoading());
    try {
      final loginResponse = await _authRepository.login(requestData);
      final user = loginResponse.user;
      if (user != null) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('email', user.email ?? '');
        print(user.name);
        print('update Success: $user');
        emit(LoginSuccess(user: user));
      } else {
        print('Login Error: User is null');
        emit(const LoginError(message: 'error'));
      }
    } catch (e) {
      print('Login Error: $e');
      emit(const LoginError(message: 'error'));
    }
  }

  Future<void> checkLoggedInUser() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      final username = prefs.getString('username') ?? '';

      if (isLoggedIn && username.isNotEmpty) {
        final user = User(name: username);
        print('User already logged in: $user');
        emit(LoginSuccess(user: user));
      } else {
        print('No user logged in');
      }
    } catch (e) {
      print('Error checking logged in user: $e');
    }
  }

  Future<void> logout(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
    emit(LogoutSuccess());
  }
}
