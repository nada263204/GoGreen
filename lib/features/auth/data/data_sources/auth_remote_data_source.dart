import 'package:graduation_project/features/auth/data/models/edit_profile_data.dart';
import 'package:graduation_project/features/auth/data/models/edit_profile_response.dart';
import 'package:graduation_project/features/auth/data/models/login_data.dart';
import 'package:graduation_project/features/auth/data/models/login_response/login_response.dart';
import 'package:graduation_project/features/auth/data/models/register_data.dart';
import 'package:graduation_project/features/auth/data/models/register_response/register_response.dart';

abstract class AuthRemoteataSource {
  Future<RegisterResponse> register(RegisterData requestBody);

  Future<LoginResponse> login(LoginData requestBody);

  Future<EditProfileResponse> updateUser(EditProfileData requestBody);
}
