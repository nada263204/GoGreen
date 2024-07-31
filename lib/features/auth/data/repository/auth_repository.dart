import 'package:graduation_project/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:graduation_project/features/auth/data/models/edit_profile_data.dart';
import 'package:graduation_project/features/auth/data/models/edit_profile_response.dart';
import 'package:graduation_project/features/auth/data/models/login_data.dart';
import 'package:graduation_project/features/auth/data/models/login_response/login_response.dart';
import 'package:graduation_project/features/auth/data/models/register_data.dart';
import 'package:graduation_project/features/auth/data/models/register_response/register_response.dart';

class AuthRepository {
  final AuthRemoteataSource _dataSource;

  AuthRepository(this._dataSource);

  Future<LoginResponse> login(LoginData requestData) async {
    return await _dataSource.login(requestData);
  }

  Future<RegisterResponse> register(RegisterData requestData) async {
    return await _dataSource.register(requestData);
  }

  Future<EditProfileResponse> updateUser(EditProfileData requestData) async {
    return await _dataSource.updateUser(requestData);
  }
}
