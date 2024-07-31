import 'package:graduation_project/features/auth/data/models/edit_profile_data.dart';
import 'package:graduation_project/features/auth/data/models/edit_profile_response.dart';
import 'package:graduation_project/features/profile/edit_user_profile/editProfile_remote_data_source.dart';

class EditProfileRepository {
  final EditProfileRemoteDataSource _dataSource;
  EditProfileRepository(this._dataSource);
  Future<EditProfileResponse> updateUser(EditProfileData requestData) async {
    return await _dataSource.updateUser(requestData);
  }
}
