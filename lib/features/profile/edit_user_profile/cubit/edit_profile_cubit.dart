import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation_project/features/auth/data/models/edit_profile_data.dart';
import 'package:graduation_project/features/auth/data/models/edit_profile_response.dart';
import 'package:graduation_project/features/profile/edit_user_profile/editProfile_api_data_source.dart';
import 'package:graduation_project/features/profile/edit_user_profile/editProfile_repository.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final _editProfileRepository = EditProfileRepository(EditProfileAPIRemoteDataSource());
  EditProfileCubit() : super(EditProfileInitial());

  Future<void> editProfile(EditProfileData requestBody) async {
    emit(EditProfileLoading());
    try {
      final response = await _editProfileRepository.updateUser(requestBody);
      emit(EditProfileSuccess(response));
    } catch (e) {
      emit( EditProfileError(e.toString(), message: "${e.toString()}"));
    }
  }
}
