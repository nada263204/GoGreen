import 'package:bloc/bloc.dart';
import 'package:graduation_project/features/auth/data/models/user.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> registerUser(String userName, String phoneNumber, String email,
      String password, String token) async {
    emit(UserLoading());
    try {
      final response = await http.post(
        Uri.parse('https://go-green-3w65.onrender.com/api/user/register'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'userName': userName,
          'phoneNumber': phoneNumber,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final user = User.fromJson(data);
        emit(UserLoaded(user));
        await saveUserAction('registered');
      } else {
        emit(UserError('Failed to register user'));
      }
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> saveUserAction(String action) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_action', action);
  }

  Future<void> loginUser(String email, String password, String token) async {
    emit(UserLoading());
    try {
      final response = await http.post(
        Uri.parse('https://go-green-3w65.onrender.com/api/user/login'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final user = User.fromJson(data);
        emit(UserLoaded(user));
        await saveUserAction('logged_in');
      } else {
        emit(UserError('Failed to login user'));
      }
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  void updateUserImage(String profilePicture) {
    if (state is UserLoaded) {
      final user = (state as UserLoaded).user;
      user.profilePicture = profilePicture;
      emit(UserLoaded(user));
    }
  }
}

// // cubit/user_cubit.dart
// import 'package:bloc/bloc.dart';
// import 'package:graduation_project/features/auth/data/models/user.dart';
// import 'package:meta/meta.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class UserCubit extends Cubit<UserState> {
//   UserCubit() : super(UserInitial());

//   Future<void> registerUser(String userName, String phoneNumber, String email, String password , String token) async {
//     emit(UserLoading());
//     try {
//       final response = await http.post(
//         Uri.parse('https://go-green-3w65.onrender.com/api/user/register'),
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//         body: {
//           'userName': userName,
//           'phoneNumber': phoneNumber,
//           'email': email,
//           'password': password,
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final user = User.fromJson(data);
//         await Future.delayed(const Duration(seconds: 5));
//         emit(UserLoaded(user));
//       } else {
//         emit(UserError('Failed to register user'));
//       }
//     } catch (e) {
//       emit(UserError(e.toString()));
//     }
//   }

//   Future<void> loginUser(String email, String password, String token) async {
//     emit(UserLoading());
//     try {
//       final response = await http.post(
//         Uri.parse('https://go-green-3w65.onrender.com/api/user/login'),
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//         body: {
//           'email': email,
//           'password': password,
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final user = User.fromJson(data);
//         await Future.delayed(const Duration(seconds: 5));
//         emit(UserLoaded(user));
//       } else {
//         emit(UserError('Failed to login user'));
//       }
//     } catch (e) {
//       emit(UserError(e.toString()));
//     }
//   }

//    void updateUserImage(String imagePath) {
//     if (state is UserLoaded) {
//       final user = (state as UserLoaded).user;
//       user.imagePath = imagePath;
//       emit(UserLoaded(user));
//     }
//   }
// }

// class UserCubit extends Cubit<UserState> {
//   UserCubit() : super(UserInitial());

//   Future<void> loginUserData(String token) async {
//     emit(UserLoading());
//     try {
//       emit(UserLoading());
//       final response = await http.get(
//         Uri.parse('https://go-green-3w65.onrender.com/api/user/login'),
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//       );

//       if (response.statusCode == 200) {
//         final user = User.fromJson(json.decode(response.body));
//         emit(UserLoaded(user));
//       } else {
//         emit(UserError('Failed to load user data'));
//       }
//     } catch (e) {
//       emit(UserError(e.toString()));
//     }
//   }
// }

// cubit/user_state.dart

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final User user;
  UserLoaded(this.user);
}

class UserError extends UserState {
  final String message;
  UserError(this.message);
}
