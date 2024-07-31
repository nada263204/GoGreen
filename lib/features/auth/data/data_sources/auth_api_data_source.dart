import 'package:dio/dio.dart';
import 'package:graduation_project/core/api_constanats.dart';
import 'package:graduation_project/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:graduation_project/features/auth/data/models/edit_profile_data.dart';
import 'package:graduation_project/features/auth/data/models/edit_profile_response.dart';
import 'package:graduation_project/features/auth/data/models/forget_data.dart';
import 'package:graduation_project/features/auth/data/models/login_data.dart';
import 'package:graduation_project/features/auth/data/models/login_response/login_response.dart';
import 'package:graduation_project/features/auth/data/models/register_data.dart';
import 'package:graduation_project/features/auth/data/models/register_response/register_response.dart';

class AuthAPIRemoteDataSource extends AuthRemoteataSource {
  final _dio = Dio(BaseOptions(
    receiveDataWhenStatusError: true,
    baseUrl: APIconstanats.baseURL,
    validateStatus: (status) {
      return status! < 500;
    },
  )); //private

  @override
  Future<LoginResponse> login(LoginData requestBody) async {
    final response = await _dio.post(
      APIconstanats.loginEndPoint,
      data: requestBody.toJson(),
    );
    print('Login Response: ${response.data}');
    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<RegisterResponse> register(RegisterData requestBody) async {
    final response = await _dio.post(
      APIconstanats.registerEndPoint,
      data: requestBody.toJson(),
    );
    print('Register Response: ${response.data}');
    return RegisterResponse.fromJson(response.data);
  }

  Future<RegisterResponse> forgetPassword(ForgetData requestBody) async {
    final response = await _dio.post(
      APIconstanats.registerEndPoint,
      data: requestBody.toJson(),
    );
    return RegisterResponse.fromJson(response.data);
  }

  @override
  Future<EditProfileResponse> updateUser(EditProfileData requestBody) async {
    final response = await _dio.patch(
      APIconstanats.updateUserProfileEndPoint,
      data: requestBody.toJson(),
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RuYWRhMUBnbWFpbC5jb20iLCJyb2xlIjoidXNlciIsImlkIjoiNjY4MWQ2ZjljMWJjZWY2NDU0NWM5OTQwIiwibmFtZSI6Ik5hZGEiLCJpYXQiOjE3MTk4NDI0NDQsImV4cCI6MTcyNzYxODQ0NH0.bOyaKlopZ8VLwmNpalEjCcjun563zrYFP1t1MNwB2Uw',
        },
      ),
    );
    print('Create Post Response: ${response.data}');
    if (response.data != null) {
      return EditProfileResponse.fromJson(response.data);
    } else {
      throw Exception("Failed to edit profile");
    }
  }
}
