part of 'edit_profile_cubit.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();

  List<Object?> get props => [];

  get message => null;
}

final class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final EditProfileResponse editProfileResponse;

  EditProfileSuccess(this.editProfileResponse);
  @override
  List<Object?> get props => [editProfileResponse];
}

class EditProfileError extends EditProfileState {
  final String message;

  EditProfileError(String error, {required this.message});
}

