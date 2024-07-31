import 'package:graduation_project/features/auth/data/models/edit_profile_data.dart';
import 'package:graduation_project/features/auth/data/models/edit_profile_response.dart';

abstract class EditProfileRemoteDataSource {
  Future<EditProfileResponse> updateUser(EditProfileData requestBody);
}
