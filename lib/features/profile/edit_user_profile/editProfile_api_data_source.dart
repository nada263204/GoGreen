import 'package:dio/dio.dart';
import 'package:graduation_project/core/api_constanats.dart';
import 'package:graduation_project/features/auth/data/models/edit_profile_data.dart';
import 'package:graduation_project/features/auth/data/models/edit_profile_response.dart';
import 'package:graduation_project/features/profile/edit_user_profile/editProfile_remote_data_source.dart';

class EditProfileAPIRemoteDataSource extends EditProfileRemoteDataSource {
  final _dio = Dio(BaseOptions(
    receiveDataWhenStatusError: true,
    baseUrl: APIconstanats.baseURL,
    validateStatus: (status) {
      return status! < 500;
    },
  )); //private

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
