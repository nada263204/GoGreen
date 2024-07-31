import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/auth/data/models/api_service.dart';
import 'package:graduation_project/features/auth/data/models/forget_password_states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(InitialForgetPasswordState());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  void checkEmail({
    required String email,
  }) async {
    emit(CheckEmailLoadingState());

    try {
      await ApiService.postData(url: 'user/forgetpassword', data: {
        'email': email,
      }).then((value) {
        sendCode(email: email);
      });
    } on DioException catch (e) {
      // print('Error exists');
      if (e.response?.statusCode == 400) {
        debugPrint('Email not exists');
      }
      debugPrint(e.toString());

      emit(CheckEmailErrorState(message: "Email does't exist"));
    } catch (e) {
      debugPrint(e.toString());
      emit(CheckEmailErrorState(message: 'Error Exists'));
    }
  }

  void sendCode({
    required String email,
  }) async {
    try {
      await ApiService.postData(url: 'user/verifypassword', data: {
        'email': email,
      }).then((value) {
        emit(SendCodeSuccessState());
      });
    }
    // on DioException catch (e) {
    //   // print('Error exists');
    //   debugPrint(e.toString());

    //   emit(SigninErrorState());
    // }
    catch (e) {
      debugPrint(e.toString());
      emit(SendCodeErrorState());
    }
  }

  void verifyCode({
    required String email,
    required String code,
  }) async {
    emit(VerifyCodeLoadingState());
    try {
      await ApiService.postData(url: 'user/verifypassword', data: {
        'email': email,
        'code': code,
      }).then((value) {
        debugPrint('الكود صحيح');
        emit(VerifyCodeSuccessState());
      });
    }
    // on DioException catch (e) {
    //   // print('Error exists');
    //   debugPrint(e.toString());

    //   emit(SigninErrorState());
    // }
    catch (e) {
      debugPrint(e.toString());
      emit(VerifyCodeErrorState());
    }
  }

  void resetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    emit(ResetPasswordLoadingState());
    try {
      await ApiService.putData(
          url: 'user/setnewpassword',
          token:
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoiNjYyZTUyZGM4MjE2YjkxMjJhY2U4NDIxIiwiaWF0IjoxNzE0Njg3MjI2LCJleHAiOjE3MjI0NjMyMjZ9.bucpi38mYxFOh1of22cFlCRpL7yoA6U9OClfgRtWHaM',
          data: {
            'email': email,
            'newPassword': newPassword,
            'confirmPassword': newPassword
          }).then((value) {
        emit(ResetPasswordSuccessState());
      });
    } catch (e) {
      debugPrint(e.toString());
      emit(ResetPasswordErrorState());
    }
    // try {
    //   await ApiService.put(url: 'user/setnewpassword', data: {
    //     'email': email,
    //     'code': code,
    //     'newPassword': newPassword,
    //   }).then((value) {
    //     emit(ResetPasswordSuccessState());
    //   });
    // on DioException catch (e) {
    //   // print('Error exists');
    //   debugPrint(e.toString());

    //   emit(SigninErrorState());
    // }
    // catch (e) {
    //   debugPrint(e.toString());
    //   emit(ResetPasswordErrorState());
  }

  Icon passwordSuffixIcon = const Icon(Icons.visibility_outlined);
  Icon confirmPasswordSuffixIcon = const Icon(Icons.visibility_outlined);

  bool isPassword = true;
  bool isPasswordConfirm = true;

  void changePasswordVisability() {
    isPassword = !isPassword;
    passwordSuffixIcon = isPassword
        ? const Icon(Icons.visibility_outlined)
        : const Icon(Icons.visibility_off_outlined);
    emit(ChangePasswordIconState());
  }

  void changeConfirmPasswordVisability() {
    isPasswordConfirm = !isPasswordConfirm;
    confirmPasswordSuffixIcon = isPasswordConfirm
        ? const Icon(Icons.visibility_outlined)
        : const Icon(Icons.visibility_off_outlined);
    emit(ChangePasswordIconState());
  }
}
